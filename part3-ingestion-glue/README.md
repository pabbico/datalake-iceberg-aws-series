# Part 3 — AWS mein Data Lake Architecture: Ingestion se Catalog tak

## Outline
- [ ] Medallion Architecture: Bronze, Silver, Gold layers ka matlab aur purpose
- [ ] Multiple sources se data lana: MySQL + Postgres (Docker Compose se simulate)
- [ ] Unstructured data (files, logs, JSON) ko S3 mein directly daalna
- [ ] AWS Glue Data Catalog — metadata management
- [ ] AWS Glue Crawlers — schema auto-detect
- [ ] AWS Glue ETL Jobs (PySpark) — Bronze → Silver → Gold, Iceberg format mein likhna
- [ ] AWS DMS — concept-level mention only (core demo Glue JDBC direct connection use karega)

## Structure
```
part3-ingestion-glue/
├── infra/terraform/     → EC2, S3, Glue, IAM (Terraform)
├── glue-jobs/            → bronze_to_silver.py, silver_to_gold.py (PySpark)
└── local-glue-dev/       → Optional: local Glue dev environment docs
```

## Locked decisions
- Sources: **MySQL + Postgres only** (Oracle out of scope)
- DB hosting: Docker Compose containers **on EC2** (not local laptop)
- Ingestion: **AWS Glue JDBC direct connection** (batch)
- Glue authoring: **AWS Glue Studio console** (primary teaching method)

## Status
Terraform base files and Glue job stubs scaffolded — logic not yet implemented.
