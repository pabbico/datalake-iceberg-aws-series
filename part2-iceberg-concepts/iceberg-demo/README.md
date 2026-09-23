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

## Status
Scripts implemented and runnable locally.
