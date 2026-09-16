"""
end_to_end_pipeline.py

Optional orchestration helper for the workshop — walks through triggering
each stage of the pipeline in order (for demo/scripting convenience,
NOT a replacement for understanding each manual step via Glue Studio /
Athena console during the actual workshop).

Planned stages:
  1. Verify source DBs are reachable (MySQL + Postgres on EC2)
  2. Trigger Glue Crawler on Bronze
  3. Run bronze_to_silver Glue job
  4. Run silver_to_gold Glue job
  5. Run a sample Athena query against Gold to confirm the pipeline worked

TODO: implement using boto3 (glue, athena clients).
"""

# TODO: import boto3

def check_source_dbs():
    """TODO: ping MySQL + Postgres to confirm they're reachable."""
    raise NotImplementedError


def run_bronze_crawler():
    """TODO: start the Glue crawler and wait for completion."""
    raise NotImplementedError


def run_glue_job(job_name: str):
    """TODO: start a Glue job run and wait for completion."""
    raise NotImplementedError


def run_sample_athena_query():
    """TODO: run a sample query against the Gold Iceberg table."""
    raise NotImplementedError


def main():
    # TODO: wire up the stages in order
    pass


if __name__ == "__main__":
    main()
