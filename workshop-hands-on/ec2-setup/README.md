# EC2 Setup

`user-data.sh` bootstraps the EC2 instance (provisioned by Terraform in
`part3-ingestion-glue/infra/terraform/ec2.tf`) with Docker + Docker Compose,
and brings up the source databases.

## Status
Skeleton only — needs testing, and a decision on how the repo/compose
files get onto the instance (git clone vs. baked AMI vs. file provisioner).
