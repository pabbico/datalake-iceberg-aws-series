"""
03_time_travel.py

Makes another write to the table (creating a new snapshot), lists the full
snapshot history, and then reads the table AS OF an older snapshot — showing
that past states remain fully queryable because old manifests and data
files are never touched by later commits.

Run 01_create_table.py and 02_schema_evolution.py first.
"""

import pyarrow as pa

from _common import TABLE_IDENTIFIER, get_catalog


def main() -> None:
    catalog = get_catalog()
    table = catalog.load_table(TABLE_IDENTIFIER)

    snapshot_before = table.current_snapshot().snapshot_id
    print(f"Snapshot before this run: {snapshot_before}")

    new_orders = pa.table(
        {
            "order_id": [4],
            "customer": ["Vikram"],
            "amount": [1599.0],
            "region": ["North"],
        }
    )
    table.append(new_orders)

    print("\nAll snapshots (oldest to newest):")
    for snapshot in table.snapshots():
        print(f" - id={snapshot.snapshot_id}  timestamp_ms={snapshot.timestamp_ms}")

    print("\nCurrent data (latest snapshot):")
    print(table.scan().to_pandas())

    print(
        f"\nTime-travel query — data as of snapshot {snapshot_before} "
        "(before this run's insert):"
    )
    print(table.scan(snapshot_id=snapshot_before).to_pandas())


if __name__ == "__main__":
    main()
