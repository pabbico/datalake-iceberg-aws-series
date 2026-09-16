"""
bronze_to_silver.py

AWS Glue ETL job (PySpark) — Bronze -> Silver transformation.

Intended to be authored/run via AWS Glue Studio console (per the series'
teaching approach), but kept here as version-controlled source of truth.

Responsibilities (planned):
  - Read raw Bronze data from S3 (as crawled into the Glue Data Catalog)
  - Basic cleaning: dedupe, null handling, type casting
  - Write out to Silver layer in Apache Iceberg format

TODO: implement using AWS Glue's Iceberg connector / glue_context.
"""

import sys
# from awsglue.transforms import *
# from awsglue.utils import getResolvedOptions
# from pyspark.context import SparkContext
# from awsglue.context import GlueContext
# from awsglue.job import Job

# TODO: getResolvedOptions(sys.argv, ["JOB_NAME", "SOURCE_DB", "SOURCE_TABLE", "TARGET_S3_PATH"])

# TODO: initialize SparkContext / GlueContext / Job

# TODO: read from Bronze (Glue Data Catalog table)

# TODO: transform (dedupe, cast types, handle nulls)

# TODO: write to Silver as Iceberg table
#   e.g. df.writeTo("glue_catalog.<db>.<table>_silver").using("iceberg").createOrReplace()

# TODO: job.commit()
