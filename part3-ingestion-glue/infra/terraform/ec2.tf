# -----------------------------------------------------------------------------
# ec2.tf — EC2 instance that hosts MySQL + Postgres via Docker Compose
#
# This simulates the "source systems" side of the pipeline. Docker install
# and docker-compose up is automated via user-data (see
# ../../../workshop-hands-on/ec2-setup/user-data.sh).
# -----------------------------------------------------------------------------

# TODO: reference or create a security group allowing:
#  - SSH (22) from your IP
#  - MySQL (3306) / Postgres (5432) from the Glue connection's security group
resource "aws_security_group" "source_db_sg" {
  name        = "${local.name_prefix}-source-db-sg"
  description = "Allows SSH + DB access for the source DB EC2 host"
  vpc_id      = var.vpc_id

  # TODO: tighten ingress rules before real use
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [] # TODO: your IP/32
  }

  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [] # TODO: restrict to VPC CIDR / Glue SG
  }

  ingress {
    description = "Postgres"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [] # TODO: restrict to VPC CIDR / Glue SG
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# TODO: pick an appropriate AMI (Amazon Linux 2023 recommended) via data source
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "source_db_host" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.ec2_instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.source_db_sg.id]

  # Installs Docker + Docker Compose and runs `docker compose up -d`
  # against the seed docker-compose.yml. See:
  # workshop-hands-on/ec2-setup/user-data.sh
  user_data = file("${path.module}/../../../workshop-hands-on/ec2-setup/user-data.sh")

  tags = {
    Name = "${local.name_prefix}-source-db-host"
  }
}

output "source_db_host_public_ip" {
  description = "Public IP of the EC2 instance running MySQL + Postgres"
  value       = aws_instance.source_db_host.public_ip
}
