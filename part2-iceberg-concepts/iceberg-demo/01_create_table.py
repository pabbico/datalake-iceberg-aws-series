"""
01_create_table.py

Creates a local Apache Iceberg table using PyIceberg's SqlCatalog (SQLite-
backed) — no AWS, no Spark. Same catalog -> metadata.json -> manifest list
-> manifests -> data files architecture covered in the Part 2 article,
just backed by local disk instead of S3 + AWS Glue.

Run:
    python 01_create_table.py
"""

import pyarrow as pa
from pyiceberg.exceptions import NamespaceAlreadyExistsError, NoSuchTableError

from _common import NAMESPACE, TABLE_IDENTIFIER, get_catalog


def main() -> None:
    catalog = get_catalog()

    try:
        catalog.create_namespace(NAMESPACE)
    except NamespaceAlreadyExistsError:
        pass

    try:
        catalog.drop_table(TABLE_IDENTIFIER)
        print(f"Dropped existing table {TABLE_IDENTIFIER} for a clean demo run.")
    except NoSuchTableError:
        pass

    orders = pa.table(
        {
            "order_id": [1, 2, 3],
            "customer_name": ["Aditi", "Rahul", "Sneha"],
            "amount": [499.0, 1299.5, 899.0],
        }
    )

    table = catalog.create_table(TABLE_IDENTIFIER, schema=orders.schema)
    table.append(orders)

    print(f"Created table: {TABLE_IDENTIFIER}")
    print(f"Metadata location: {table.metadata_location}")
    print("\nData in the table:")
    print(table.scan().to_pandas())


if __name__ == "__main__":
    main()
