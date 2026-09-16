# Part 2 — Table Formats ka Concept: Hive ke Drawbacks aur Iceberg ka Janam

## Outline
- [ ] Plain S3 + Hive-style partitioning ki dikkatein (manual partition
      management, no ACID, no time travel, concurrent write issues)
- [ ] Table formats ka concept: Iceberg, Delta Lake, Hudi — inka role
- [ ] Apache Iceberg architecture: metadata layer, manifest files, snapshot isolation
- [ ] Iceberg superpowers: schema evolution, partition evolution, time travel, ACID transactions
- [ ] Iceberg vs Hive table — practical difference

## Companion code
See [`../iceberg-demo/`](../iceberg-demo) for standalone PyIceberg scripts
(local, independent of AWS) that demonstrate schema evolution and time travel.

## Status
Draft not started.
