# -----------------------------------------------------------------------------
# variables.tf — input variables for the Data Lake / Iceberg series infra
# -----------------------------------------------------------------------------

variable "aws_region" {
  description = "AWS region to deploy all resources into. Suggested: ap-south-1"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Prefix used for naming all resources (tags, S3 bucket, etc.)"
  type        = string
  default     = "datalake-iceberg-series"
}

variable "environment" {
  description = "Environment name, e.g. dev / workshop"
  type        = string
  default     = "workshop"
}

# --- Networking (TODO: fill in or reference an existing VPC module) ---
variable "vpc_id" {
  description = "VPC ID to launch the EC2 instance and Glue connections into"
  type        = string
  default     = "" # TODO
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance (source DBs)"
  type        = string
  default     = "" # TODO
}

# --- EC2 (source DB host) ---
variable "ec2_instance_type" {
  description = "Instance type for the EC2 box running MySQL + Postgres via Docker Compose"
  type        = string
  default     = "t3.medium" # TODO: right-size after testing
}

variable "key_pair_name" {
  description = "Existing EC2 key pair name for SSH access"
  type        = string
  default     = "" # TODO
}

# --- S3 ---
variable "data_lake_bucket_name" {
  description = "Globally-unique S3 bucket name for Bronze/Silver/Gold layers"
  type        = string
  default     = "" # TODO: must be globally unique, set in terraform.tfvars
}

# --- Glue ---
variable "glue_database_name" {
  description = "Name of the Glue Data Catalog database"
  type        = string
  default     = "datalake_iceberg_series"
}

# --- Tagging ---
variable "common_tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default = {
    Project = "datalake-iceberg-aws-series"
    Owner   = "Pawan Sharma"
  }
}
