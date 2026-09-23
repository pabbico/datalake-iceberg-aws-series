"""
02_schema_evolution.py

Loads the table created by 01_create_table.py and evolves its schema
WITHOUT rewriting any existing data files:
  1. Add a new column ("region") — existing rows read back as NULL for it
  2. Rename a column ("customer_name" -> "customer") — old data stays put

This is the field-ID-based schema evolution covered in the Part 2 article:
Iceberg tracks columns by a stable internal ID, not by name or position,
so both changes are pure metadata operations.

Run 01_create_table.py first.
"""

from pyiceberg.types import StringType

from _common import TABLE_IDENTIFIER, get_catalog


def main() -> None:
    catalog = get_catalog()
    table = catalog.load_table(TABLE_IDENTIFIER)

    print("Schema BEFORE evolution:")
    print(table.schema())

    with table.update_schema() as update:
        update.add_column("region", StringType())

    with table.update_schema() as update:
        update.rename_column("customer_name", "customer")

    print("\nSchema AFTER evolution:")
    print(table.schema())

    print(
        "\nExisting rows now show NULL for the new 'region' column, and the "
        "renamed 'customer' column still holds the original data:"
    )
    print(table.scan().to_pandas())

    print("\nData files on disk — unchanged by the schema update:")
    for task in table.scan().plan_files():
        print(" -", task.file.file_path)


if __name__ == "__main__":
    main()
