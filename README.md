# Data Lake to Iceberg — AWS Series

A 4-part hands-on series that takes you from Data Lake fundamentals to
building a real Apache Iceberg pipeline on AWS.

> Owner: Pawan Sharma

---

## 📚 Series Index

| Part | Title | Type | Link |
|---|---|---|---|
| Part 1 | Data Lake ki Kahani: Kyun aur Kaise Shuru Hua | Concept (no code) | _AWS Builder link — TBD_ |
| Part 2 | Table Formats ka Concept: Hive ke Drawbacks aur Iceberg ka Janam | Concept + standalone demo | _AWS Builder link — TBD_ |
| Part 3 | AWS mein Data Lake Architecture: Ingestion se Catalog tak | Hands-on (Glue) | _AWS Builder link — TBD_ |
| Part 4 | Querying, Iceberg on AWS, aur Real Pipeline | Hands-on (Athena) | _AWS Builder link — TBD_ |
| Workshop | Full end-to-end hands-on build | Hands-on | [`workshop-hands-on/`](./workshop-hands-on) |

**Overview article (Medium):** _TBD — links out to all of the above_
**Videos (YouTube):** _TBD — Concept/Intro video, Hands-on build video_

---

## 🗂 Repository Structure

```
datalake-iceberg-aws-series/
├── architecture-diagrams/     → Diagrams reused across all platforms
├── part1-datalake-basics/     → Concept notes (no code)
├── part2-iceberg-concepts/    → Iceberg concepts + standalone PyIceberg demo
├── part3-ingestion-glue/      → Terraform infra + Glue ETL jobs
├── part4-athena-querying/     → Athena SQL + Lake Formation notes
├── workshop-hands-on/         → Full end-to-end pipeline (Docker, EC2, scripts, cleanup)
└── sample-datasets/           → Seed data for MySQL/Postgres + unstructured samples
```

---

## ✅ Prerequisites

- AWS account with sufficient permissions (Glue, S3, EC2, Athena, Lake Formation, IAM)
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
- [Docker](https://docs.docker.com/get-docker/) + Docker Compose
- AWS CLI configured (`aws configure`)
- Basic SQL + Python familiarity

No other tools are required — infra is kept deliberately minimal.

---

## 🚀 Quick Start (Workshop)

```bash
cd workshop-hands-on
cat setup/prerequisites.md
```

Then follow the workshop guide end to end. Full pipeline:

```
MySQL/Postgres (EC2, Docker) → Glue (JDBC) → S3 (Bronze)
   → Glue ETL → S3 (Silver/Gold, Iceberg) → Athena query
```

---

## 🔗 Cross-links

- **AWS Builder articles** → this repo (relevant code sections) + YouTube hands-on video
- **Medium overview** → AWS Builder articles + this repo + YouTube
- **YouTube description** → this repo + AWS Builder articles

---

## 🧹 Cleanup

Everything is provisioned via Terraform for easy teardown — see
[`workshop-hands-on/cleanup/teardown_resources.md`](./workshop-hands-on/cleanup/teardown_resources.md).

## 📄 License

See [LICENSE](./LICENSE).
