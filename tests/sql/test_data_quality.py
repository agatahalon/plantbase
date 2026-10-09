"""Data-quality tests for plantbase.db.

Run from the repo root with:  pytest tests/sql -v
"""

# Step 1: imports.

import sqlite3
from pathlib import Path
import pytest

# Step 2: path to the database.

this_file = Path(__file__).resolve()              # absolute path of THIS file: .../plantbase/tests/sql/test_data_quality.py
repo_root = this_file.parents[2]                  # parents[0] = tests/sql, parents[1] = tests, parents[2] = repo root
DB_PATH = repo_root / "plantbase.db"              # the / operator joins path pieces; Short version: DB_PATH = Path(__file__).resolve().parents[2] / "plantbase.db"
ALLOWED_SUNLIGHT = {'Full sun','Full sun to partial shade','Partial shade','Partial to full shade','Full sun to bright indirect light'}


# Step 3: a fixture that gives every test a database connection. (note: A fixture is a function pytest runs for you; a test receives its result by listing the fixture's name as a parameter)

@pytest.fixture
def db():
    connection = sqlite3.connect(DB_PATH)
    yield connection
    connection.close()

# Step 4 - tests:
# Test 1 - row counts.

def test_plants_table_has_16_rows(db):
    # arrange:
    cursor = db.cursor()                          # a cursor is the object that runs queries and holds their results
    # act:
    cursor.execute("SELECT COUNT(*) FROM plants") # runs the query, then reads the single result row
    row = cursor.fetchone()
    plant_count = row[0]                          # take the number out of the tuple
    # assert:
    assert plant_count == 16

    # Short version:
    # assert db.execute("SELECT COUNT(*) FROM plants").fetchone()[0] == 16

# Test 2 - no orphan rows (referential integrity).

def test_plant_uses_has_no_orphan_plants(db):
    cursor = db.cursor()
    cursor.execute("SELECT pu.plant_id FROM plant_uses pu LEFT JOIN plants p ON p.id = pu.plant_id WHERE p.id IS NULL")
    orphan_rows = cursor.fetchall()
    assert orphan_rows == [], f"Orphan plant_uses rows: {orphan_rows}"

def test_plant_uses_has_no_orphan_uses(db):
    cursor = db.cursor()
    cursor.execute("SELECT pu.use_id FROM plant_uses pu LEFT JOIN uses u ON u.id = pu.use_id WHERE u.id IS NULL")
    orphan_rows = cursor.fetchall()
    assert orphan_rows == [], f"Orphan uses rows: {orphan_rows}"

# Test 3 - sunlight values (this one is SUPPOSED TO FAIL for now). Known data issue: growing_conditions.sunlight has inconsistent wordings.
# Allowed set idea: Full sun, Full sun to partial shade, Partial shade, Partial to full shade, Full sun to bright indirect light.

def test_sunlight_values(db):
    cursor = db.cursor()
    cursor.execute("SELECT DISTINCT sunlight FROM growing_conditions")
    rows = cursor.fetchall()
    actual_values = set()
    for row in rows:
        actual_values.add(row[0])
    unexpected = actual_values - ALLOWED_SUNLIGHT
    assert unexpected == set(), f"Unexpected sunlight values: {unexpected}"