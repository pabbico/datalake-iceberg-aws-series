# -----------------------------------------------------------------------------
# glue.tf — Glue Data Catalog database, connections, crawlers, IAM role
#
# NOTE: The series teaches authoring Glue ETL jobs via the Glue Studio
# console (beginner-friendly). Terraform here provisions the supporting
# infra (catalog DB, JDBC connections, crawlers, IAM) — not the job scripts
# themselves, which live in ../glue-jobs/ and are uploaded/attached via
# the console per the workshop steps.
# -----------------------------------------------------------------------------

resource "aws_glue_catalog_database" "this" {
  name = var.glue_database_name
}

# --- IAM role assumed by Glue jobs & crawlers ---
resource "aws_iam_role" "glue_service_role" {
  name = "${local.name_prefix}-glue-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "glue.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "glue_service" {
  role       = aws_iam_role.glue_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

# TODO: scope this down to just the data lake bucket instead of full S3 access
resource "aws_iam_role_policy_attachment" "glue_s3" {
  role       = aws_iam_role.glue_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# --- JDBC connections to the source DBs on EC2 ---
# TODO: fill in connection_properties (JDBC URL, username, password via
# Secrets Manager — do NOT hardcode credentials here)
resource "aws_glue_connection" "mysql_source" {
  name            = "${local.name_prefix}-mysql-source"
  connection_type = "JDBC"

  connection_properties = {
    JDBC_CONNECTION_URL = "" # TODO: jdbc:mysql://<ec2-ip>:3306/<db>
    USERNAME             = "" # TODO: prefer Secrets Manager reference
    PASSWORD              = "" # TODO
  }

  physical_connection_requirements {
    subnet_id              = var.subnet_id
    security_group_id_list = [aws_security_group.source_db_sg.id]
    availability_zone      = "" # TODO
  }
}

resource "aws_glue_connection" "postgres_source" {
  name            = "${local.name_prefix}-postgres-source"
  connection_type = "JDBC"

  connection_properties = {
    JDBC_CONNECTION_URL = "" # TODO: jdbc:postgresql://<ec2-ip>:5432/<db>
    USERNAME             = "" # TODO
    PASSWORD              = "" # TODO
  }

  physical_connection_requirements {
    subnet_id              = var.subnet_id
    security_group_id_list = [aws_security_group.source_db_sg.id]
    availability_zone      = "" # TODO
  }
}

# --- Crawlers (schema auto-detect on Bronze layer) ---
resource "aws_glue_crawler" "bronze_crawler" {
  name          = "${local.name_prefix}-bronze-crawler"
  role          = aws_iam_role.glue_service_role.arn
  database_name = aws_glue_catalog_database.this.name

  s3_target {
    path = "s3://${var.data_lake_bucket_name}/bronze/"
  }

  # TODO: set a schedule if you want this to run periodically,
  # otherwise trigger it manually during the workshop
}

output "glue_database_name" {
  value = aws_glue_catalog_database.this.name
}
