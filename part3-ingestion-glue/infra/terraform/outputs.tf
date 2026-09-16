# -----------------------------------------------------------------------------
# outputs.tf — cross-file outputs kept together for quick reference.
#
# NOTE: resource-specific outputs (source_db_host_public_ip,
# data_lake_bucket_name, glue_database_name) are defined next to their
# resources in ec2.tf / s3.tf / glue.tf. Add any additional
# workshop-wide outputs here as the series grows (e.g. Athena workgroup,
# Lake Formation settings).
# -----------------------------------------------------------------------------

output "aws_region" {
  description = "Region all resources were deployed into"
  value       = var.aws_region
}
