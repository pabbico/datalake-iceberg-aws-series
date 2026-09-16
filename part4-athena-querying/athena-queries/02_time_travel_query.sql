-- 02_time_travel_query.sql
-- Query a historical snapshot of an Iceberg table via Athena.
-- TODO: replace with an actual table + snapshot id / timestamp.

-- SELECT *
-- FROM <glue_database>.<table_name>
-- FOR TIMESTAMP AS OF TIMESTAMP '2026-01-01 00:00:00';

-- Or by snapshot id:
-- SELECT *
-- FROM <glue_database>.<table_name>
-- FOR VERSION AS OF <snapshot_id>;
