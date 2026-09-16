# -----------------------------------------------------------------------------
# main.tf — provider config + shared locals
#
# This series uses Terraform end-to-end so the whole environment can be
# spun up and torn down cleanly with `terraform apply` / `terraform destroy`.
# -----------------------------------------------------------------------------

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # TODO (optional): configure a remote backend (S3 + DynamoDB lock table)
  # if you want shared/remote state instead of local state.
  # backend "s3" {
  #   bucket = "your-tfstate-bucket"
  #   key    = "datalake-iceberg-series/terraform.tfstate"
  #   region = "ap-south-1"
  # }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.common_tags
  }
}

locals {
  name_prefix = "${var.project_name}-${var.environment}"
}
