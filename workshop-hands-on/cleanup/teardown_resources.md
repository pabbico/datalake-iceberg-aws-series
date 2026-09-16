# Cleanup / Teardown

To avoid ongoing AWS costs after the workshop, tear everything down.

## Steps

1. **Empty the S3 data lake bucket** (Terraform won't delete a non-empty
   bucket by default):
   ```bash
   aws s3 rm s3://<your-data-lake-bucket-name> --recursive
   ```

2. **Destroy all Terraform-managed infra:**
   ```bash
   cd part3-ingestion-glue/infra/terraform
   terraform destroy
   ```

3. **Manually verify** (Terraform should catch all of these, but double-check
   in the console):
   - [ ] EC2 instance terminated
   - [ ] S3 bucket deleted
   - [ ] Glue database, crawlers, connections, jobs removed
   - [ ] IAM role/policies removed
   - [ ] Any Lake Formation permissions/registrations cleaned up
   - [ ] Athena query result bucket (if separately created) emptied/deleted

## Status
TODO: verify this list once the full Terraform config is built out —
some resources (e.g. Lake Formation registrations) may need manual cleanup
if not fully managed by Terraform.
