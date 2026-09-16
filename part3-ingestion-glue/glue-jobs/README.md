# Glue ETL Jobs (PySpark)

Authored primarily via **AWS Glue Studio console** (per the series' teaching
approach) — these files are the version-controlled source of truth to keep
in sync with what's built in the console.

| Job | Purpose |
|---|---|
| `bronze_to_silver.py` | Clean/dedupe raw Bronze data, write to Silver as Iceberg |
| `silver_to_gold.py` | Aggregate/join Silver data into curated Gold Iceberg tables |

## Status
Stubs only — logic not yet implemented.
