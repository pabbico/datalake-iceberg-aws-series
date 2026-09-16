# Prerequisites

Before starting the hands-on workshop, make sure you have:

## Accounts & Access
- [ ] AWS account with permissions for: EC2, S3, Glue, Athena, Lake Formation, IAM
- [ ] AWS CLI configured locally (`aws configure`)

## Tools
- [ ] [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.5.0
- [ ] [Docker](https://docs.docker.com/get-docker/) + Docker Compose (for local testing of the compose file, if desired)
- [ ] Git

## Before you begin
- [ ] Decide on the AWS region (suggested default: `ap-south-1`)
- [ ] Have an existing VPC + subnet ready (or create one — TODO: add a
      minimal VPC module if you don't already have one)
- [ ] Create/confirm an EC2 key pair for SSH access
- [ ] Choose a globally-unique S3 bucket name for the data lake

## Estimated AWS cost
TODO: add a rough cost estimate for running the full workshop for a few
hours (EC2 t3.medium + Glue DPUs + S3 + Athena scan costs).

## Next step
Once ready, copy `part3-ingestion-glue/infra/terraform/terraform.tfvars.example`
to `terraform.tfvars`, fill in your values, and run `terraform apply`.
