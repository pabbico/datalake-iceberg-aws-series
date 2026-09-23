# Data Lake to Iceberg — AWS Series

A 4-part hands-on series that takes you from Data Lake fundamentals to
building a real Apache Iceberg pipeline on AWS.

> Owner: Pawan Sharma

---

## 📚 Series Index

| Part | Title | Type | Code in this repo | AWS Builder |
|---|---|---|---|---|
| Part 1 | From Data Warehouse to Data Lake: Why Modern Analytics Architecture Looks the Way It Does | Concept only | _Not applicable — no code_ | [Read on AWS Builder](https://builder.aws.com/content/3JQ4D7ZscQWUNox9VJJuk6hdvk1/from-data-warehouse-to-data-lake-why-modern-analytics-architecture-looks-the-way-it-does) |
| Part 2 | Table Formats and the Rise of Apache Iceberg | Concept + standalone PyIceberg demo | [`part2-iceberg-concepts/`](./part2-iceberg-concepts) | _Link TBD_ |
| Part 3 | Data Lake Architecture on AWS: From Ingestion to Catalog | Hands-on (Terraform + Glue) | _Coming soon_ | _Link TBD_ |
| Part 4 | Querying, Iceberg on AWS, and the Real Pipeline | Hands-on (Athena) | _Coming soon_ | _Link TBD_ |
| Workshop | Full end-to-end hands-on build | Hands-on | _Coming soon_ | — |

---

## 🗂 Repository Structure (current)

```
datalake-iceberg-aws-series/
└── part2-iceberg-concepts/
    └── iceberg-demo/     → Standalone PyIceberg scripts (no AWS needed)
```

This repo is code-only — article write-ups (AWS Builder, Medium) are
drafted separately and published on those platforms directly.

More folders (`part3-ingestion-glue/`, `part4-athena-querying/`,
`workshop-hands-on/`, etc.) will be added here as those parts are built —
see the Series Index above for what's planned.

---

## ✅ Prerequisites (for what's in this repo right now)

- Python 3.9+ and `pip`

That's all Part 2's standalone demo needs — see
[`part2-iceberg-concepts/iceberg-demo/README.md`](./part2-iceberg-concepts/iceberg-demo/README.md)
for setup. An AWS account, Terraform, and Docker will only be needed once
Part 3's infra lands here.

---

## 🚀 Quick Start (Part 2 — standalone Iceberg demo)

```bash
cd part2-iceberg-concepts/iceberg-demo
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt

python 01_create_table.py
python 02_schema_evolution.py
python 03_time_travel.py
```

No AWS account or cloud cost involved — everything runs against a local
SQLite-backed Iceberg catalog on disk.

---

## 📄 License

See [LICENSE](./LICENSE).
