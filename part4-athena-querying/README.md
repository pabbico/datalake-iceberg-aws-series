# Part 4 — Querying, Iceberg on AWS, aur Real Pipeline

## Outline
- [ ] Amazon Athena se query karna (Presto/Trino engine ka basic)
- [ ] Athena + Iceberg native integration
- [ ] AWS Glue + Iceberg table format setup
- [ ] AWS Lake Formation — permissions aur governance
- [ ] End-to-end pipeline recap: MySQL/Postgres → Glue → S3 (Bronze) →
      Glue ETL → S3 (Silver/Gold, Iceberg) → Athena query

## Structure
```
part4-athena-querying/
├── athena-queries/    → create table, time travel, schema evolution,
│                         bronze/silver/gold comparison SQL
└── lake-formation/    → Permissions setup notes
```

## Status
Draft not started. SQL stubs scaffolded below.
