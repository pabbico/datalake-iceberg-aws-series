# Local Glue Dev (Optional / Advanced)

For those who want to test/iterate on Glue PySpark scripts locally before
pushing to Glue Studio, AWS provides an official Docker image:
`amazon/aws-glue-libs`.

> This is **optional** — the primary teaching path in this series is the
> AWS Glue Studio console. This is documented here for advanced readers only.

## Planned steps (to be filled in)
- [ ] `docker pull amazon/aws-glue-libs:<tag>`
- [ ] Mount `../glue-jobs/` into the container
- [ ] Configure AWS credentials for local Spark session to read/write S3
- [ ] Run/debug a job script locally with `spark-submit`

## Status
Docs not yet written — placeholder only.
