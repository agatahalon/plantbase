"""PlantBase API - a thin layer between the web and plantbase.db.

Run from the repo root with:  uvicorn app.main:app --reload
Then open http://127.0.0.1:8000/docs in the browser to try the endpoints.
"""

# Step 1: imports.
# You need: FastAPI (from the fastapi package), sqlite3 and Path from pathlib.
from fastapi import FastAPI                     # The package fastapi is lowercase, the class is FastAPI
import sqlite3
from pathlib import Path


# Step 2: the app object and the path to the database.
# - create the app:  app = FastAPI(title="PlantBase API")
# - DB_PATH: same technique as in tests/sql/test_data_quality.py, but this file lives in app/, so the repo root is one level up. Check: which parents[n]?
app = FastAPI(title="PlantBase API")
this_file = Path(__file__).resolve()            # absolute path of THIS file: .../plantbase/app/main.py
repo_root = this_file.parents[1]                # parents[0] = app, parents[1] = repo root
DB_PATH = repo_root / "plantbase.db"            # the / operator joins path pieces; Short version: Path(__file__).resolve().parents[1] / "plantbase.db"


# Step 3: a helper function that opens a database connection.
# def get_connection(): ...
# - connect with sqlite3.connect(DB_PATH)
# - set connection.row_factory = sqlite3.Row  (lets you read a column by name, e.g. row["common_name"], instead of by position, e.g. row[1])
# - return the connection
# Every endpoint opens its own connection and closes it when it is done.
def get_connection():
    connection = sqlite3.connect(DB_PATH)
    connection.row_factory = sqlite3.Row
    return connection


# Step 4: first endpoint - GET /plants.
# - decorate a function with @app.get("/plants")
# - open a connection, run: SELECT id, common_name, latin_name, family, is_toxic FROM plants
# - fetchall() gives a list of Row objects; FastAPI cannot turn those into JSON, so build a list of dictionaries first (long version: loop and dict(row); short version as a comment: [dict(row) for row in rows])
# - close the connection and return the list - FastAPI converts it to JSON.
# Note: is_toxic comes back as 0 or 1 (SQLite has no real boolean).

@app.get("/plants")
def get_plants():
    connection = get_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT id, common_name, latin_name, family, is_toxic FROM plants")
    rows = cursor.fetchall()
    plants = []
    for row in rows:
        plants.append(dict(row))
    connection.close()
    return plants

# Short version: plants = [dict(row) for row in rows]

# Step 5: second endpoint - GET /plants/{plant_id}  (one plant, with its uses).
# - imports: add HTTPException to the fastapi import (from fastapi import FastAPI, HTTPException)
# - decorate with @app.get("/plants/{plant_id}"); the function takes plant_id: int
#   (the ": int" makes FastAPI reject text like /plants/abc with a 422 error for free)
# - query 1: the plant itself, with all columns:
#       SELECT * FROM plants WHERE id = ?
#   pass the id as a tuple, never paste it into the string:  cursor.execute(sql, (plant_id,))
# - fetchone() returns one Row, or None when there is no such plant
# - if it is None: close the connection and  raise HTTPException(status_code=404, detail="Plant not found")
# - query 2: the plant's uses (you know this join from Query 13):
#       SELECT u.use_name, pu.notes FROM plant_uses pu JOIN uses u ON u.id = pu.use_id WHERE pu.plant_id = ?
# - build the response: plant = dict(row), then plant["uses"] = a list of dictionaries
#   (long version: loop; short version as a comment)
# - close the connection and return plant.
# Try: /plants/1 (Chamomile), /plants/999 (404), /plants/abc (422).


# Step 6: try it.
# uvicorn app.main:app --reload
# - http://127.0.0.1:8000/plants  shows the JSON
# - http://127.0.0.1:8000/docs    lets you run the endpoint from the browser
# - compare the number of items with SELECT COUNT(*) FROM plants (16)
