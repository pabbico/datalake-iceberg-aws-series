# Sample Datasets

Reusable seed data for the workshop's MySQL/Postgres source DBs, plus a
sample unstructured dataset (files/logs/JSON) for the "unstructured data
into S3" part of Part 3.

## Open item
Exact sample domain is **not yet finalized**. Leading candidate:
**e-commerce** (customers / orders / products / transactions).

## Planned structure (once domain is finalized)
```
sample-datasets/
├── structured/
│   ├── mysql/init.sql        (or symlinked into workshop-hands-on/docker/init/mysql)
│   └── postgres/init.sql     (or symlinked into workshop-hands-on/docker/init/postgres)
└── unstructured/
    └── sample-logs-json/
```

## Status
Empty — waiting on domain decision (see root README, section "Open Items").
