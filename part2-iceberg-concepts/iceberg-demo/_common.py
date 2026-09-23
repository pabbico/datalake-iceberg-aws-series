"""
Shared setup for the standalone PyIceberg demo scripts (01-03).

Not a demo step on its own — it just wires up a local SqlCatalog (SQLite
for the catalog pointer, local disk for metadata/data files) so the three
numbered scripts can share the same table across separate runs.

No AWS credentials, no Spark, no network calls — everything lives under
./warehouse next to this file.
"""

import os

from pyiceberg.catalog.sql import SqlCatalog

WAREHOUSE_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "warehouse")
NAMESPACE = "demo"
TABLE_NAME = "orders"
TABLE_IDENTIFIER = f"{NAMESPACE}.{TABLE_NAME}"


def get_catalog() -> SqlCatalog:
    os.makedirs(WAREHOUSE_PATH, exist_ok=True)
    return SqlCatalog(
        "local",
        uri=f"sqlite:///{WAREHOUSE_PATH}/catalog.db",
        warehouse=f"file://{WAREHOUSE_PATH}",
    )
