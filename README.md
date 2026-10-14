# PlantBase

A plants and herbs database covering species found across Europe (with a Poland-specific lens), built as a portfolio project to practice full-stack testing skills: SQL database design, Python, and Playwright test automation.

## Status

Work in progress -- built step by step as a learning project.

## Project goals

- Design and populate a relational SQLite database of plants and herbs (names, Latin names, families, where they're found, growing conditions, uses, toxicity, and approximate harvest data).
- Generate synthetic sales data (2023-2025) for a fictional herbal shop with a Python script (`database/generate_sales.py`), to practice SQL aggregation and join queries.
- Build a small web application on top of the database.
- Write automated tests at multiple levels: SQL data-quality checks, Python unit/API tests (pytest), and end-to-end browser tests (Playwright).
- Set up continuous integration so tests run automatically on every push.

## Tech stack

- Database: SQLite
- Backend: Python (FastAPI)
- Testing: pytest, Playwright
- CI: GitHub Actions

## Project structure

```
plantbase/
├── database/            # schema.sql, seed_data.sql, generate_sales.py, queries.sql
├── app/                 # FastAPI backend (API)
├── tests/
│   ├── sql/             # data-quality / database tests
│   ├── unit/            # unit and API tests
│   └── e2e/             # Playwright end-to-end tests
└── .github/
    └── workflows/       # CI configuration
```

More detail (schema design, test strategy) will be added as the project develops.

## Useful commands

Run these from the repository root to rebuild the database from scratch and display query results.

```bash
# Remove the existing database (start from scratch)
rm plantbase.db

# Recreate the schema and load the seed data
sqlite3 plantbase.db < database/schema.sql
sqlite3 plantbase.db < database/seed_data.sql

# Generate synthetic sales data (2023-2025)
python3 database/generate_sales.py

# Run a single query, e.g. count the rows in a table
sqlite3 plantbase.db "SELECT COUNT(*) FROM growing_conditions;"

# Run all practice queries from queries.sql
sqlite3 -header -column plantbase.db < database/queries.sql
```

Note: running `generate_sales.py` a second time adds another batch of sales rows. To avoid duplicates, rebuild the database with the commands above first.

### Python environment and tests

Set up the virtual environment once (from the repository root), then activate it in every new terminal:

```bash
# Create the virtual environment (first time only)
python3 -m venv venv

# Activate it (the prompt then starts with "(venv)")
source venv/bin/activate

# Install the dependencies (first time, or after requirements.txt changes)
pip install -r requirements.txt

# Run the database data-quality tests
pytest tests/sql -v

# Leave the virtual environment
deactivate
```

If `pytest` or `uvicorn` is "not found", the virtual environment is not active in that terminal.

## Running the API locally

The API is a small FastAPI app (`app/main.py`) that reads data from `plantbase.db`. Build the database first (see above), then start the server from the repository root:

```bash
source venv/bin/activate
uvicorn app.main:app --reload
```

`--reload` restarts the server automatically whenever a file is saved. Stop the server with `Ctrl+C`.

### About localhost

While the server runs, the API is available **only on your own computer** at `http://127.0.0.1:8000` (also written `http://localhost:8000`). `127.0.0.1` is the address a computer uses to talk to itself, and `8000` is the port the server listens on. Nobody else can reach it, and it stops working when you stop the server. If port 8000 is already in use, start the server on another one, for example `uvicorn app.main:app --reload --port 8001`.

| URL | What it shows |
|---|---|
| `http://127.0.0.1:8000/plants` | All plants as JSON |
| `http://127.0.0.1:8000/docs` | Interactive API documentation (try the endpoints in the browser) |

Note: `is_toxic` comes back as `0` or `1`, because SQLite has no boolean type.
