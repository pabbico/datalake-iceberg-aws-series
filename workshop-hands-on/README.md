# Workshop — Full Hands-on Build

Ties every part of the series together into one step-by-step, end-to-end
build using Terraform.

## Pipeline
```
MySQL/Postgres (Docker, on EC2) → Glue (JDBC) → S3 (Bronze)
   → Glue ETL (PySpark) → S3 (Silver/Gold, Iceberg) → Athena query
```

## Steps (high level)
1. [`setup/prerequisites.md`](./setup/prerequisites.md) — accounts, tools, decisions
2. Provision infra: `part3-ingestion-glue/infra/terraform/` (`terraform apply`)
3. EC2 auto-bootstraps via [`ec2-setup/user-data.sh`](./ec2-setup/user-data.sh)
   and brings up source DBs via [`docker/docker-compose.yml`](./docker/docker-compose.yml)
4. Run the Bronze crawler + Glue ETL jobs (`part3-ingestion-glue/glue-jobs/`)
   via Glue Studio console
5. Query the result via `part4-athena-querying/athena-queries/`
6. (Optional) Use [`scripts/end_to_end_pipeline.py`](./scripts/end_to_end_pipeline.py)
   to orchestrate/verify programmatically
7. Clean up: [`cleanup/teardown_resources.md`](./cleanup/teardown_resources.md)

## Status
Skeleton only — each step above needs to be built out and tested.
