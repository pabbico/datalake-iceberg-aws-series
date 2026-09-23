# Standalone PyIceberg Demo

Independent of AWS — runs locally to demonstrate core Iceberg concepts
before the AWS-specific implementation in Part 3/4.

Uses PyIceberg's `SqlCatalog`: the catalog pointer lives in a local SQLite
file, and metadata/data files live on local disk under `./warehouse`. Same
catalog → metadata.json → manifest list → manifests → data files
architecture as the AWS version — just S3 swapped for your local
filesystem, so there's zero cloud cost to try this.

## Setup (plain Python venv — no Docker needed for this one)

Use **Python 3.10–3.13**. Avoid a brand-new Python release (e.g. 3.14) as
your default `python3` — `pyarrow` is a heavy C++ extension, and its
prebuilt wheels typically lag a new Python release by a few months. On an
unsupported version, `pip install` tries to compile `pyarrow` from source
and fails with a `cmake` error, which this demo doesn't need you to deal
with. Run `python3 --version` first; if it's not 3.10–3.13, point the venv
at a specific version instead (e.g. `python3.12`, installed via
`brew install python@3.12` on macOS, or from python.org).

```bash
cd part2-iceberg-concepts/iceberg-demo
python3.12 -m venv .venv        # use whichever 3.10-3.13 interpreter you have
source .venv/bin/activate       # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

**If `pip install` fails trying to build `pyarrow` from source** (a
`cmake` error is the telltale sign): your default `python3` is too new.
Recreate the venv with an explicit 3.10–3.13 interpreter as shown above.

## Scripts (run in order)

| Script | Demonstrates |
|---|---|
| `01_create_table.py` | Creating an Iceberg table with a local catalog, appending data |
| `02_schema_evolution.py` | Adding + renaming columns without rewriting existing data files |
| `03_time_travel.py` | New snapshot on write, listing snapshot history, querying an older snapshot |

```bash
python 01_create_table.py
python 02_schema_evolution.py
python 03_time_travel.py
```

Each script loads the table left behind by the previous one — run them in
order. Re-running `01_create_table.py` drops and recreates the table for a
clean demo.

Everything under `./warehouse` (the SQLite catalog file + Parquet/Avro
metadata and data files) is generated at runtime and gitignored — delete
that folder any time to reset.

## Expected output

```
$ python 01_create_table.py
Created table: demo.orders
Metadata location: file:///.../warehouse/demo.db/orders/metadata/00001-....metadata.json

Data in the table:
   order_id customer_name  amount
0         1         Aditi   499.0
1         2         Rahul  1299.5
2         3         Sneha   899.0

$ python 02_schema_evolution.py
Schema BEFORE evolution:
table {
  1: order_id: optional long
  2: customer_name: optional string
  3: amount: optional double
}

Schema AFTER evolution:
table {
  1: order_id: optional long
  2: customer: optional string
  3: amount: optional double
  4: region: optional string
}

Existing rows now show NULL for the new 'region' column, and the renamed 'customer' column still holds the original data:
   order_id customer  amount region
0         1    Aditi   499.0   None
1         2    Rahul  1299.5   None
2         3    Sneha   899.0   None

Data files on disk — unchanged by the schema update:
 - file:///.../warehouse/demo.db/orders/data/00000-0-....parquet

$ python 03_time_travel.py
Snapshot before this run: 6028772215023111316

All snapshots (oldest to newest):
 - id=6028772215023111316  timestamp_ms=1790165155935
 - id=4811962652808191436  timestamp_ms=1790165429802

Current data (latest snapshot):
   order_id customer  amount region
0         4   Vikram  1599.0  North
1         1    Aditi   499.0   None
2         2    Rahul  1299.5   None
3         3    Sneha   899.0   None

Time-travel query — data as of snapshot 6028772215023111316 (before this run's insert):
   order_id customer_name  amount
0         1         Aditi   499.0
1         2         Rahul  1299.5
2         3         Sneha   899.0
```

Notice the last block: the time-travel query returns `customer_name`
(the original column), not the renamed `customer` — because that older
snapshot points back to the table's schema as it existed at that commit,
before the rename. Snapshot IDs and file paths will differ on your run.

## Status
Scripts implemented and verified working locally (PyIceberg 0.8.1, Python 3.12).
