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
- Backend: Python
- Testing: pytest, Playwright
- CI: GitHub Actions

## Project structure

```
plantbase/
├── database/            # schema.sql, seed_data.sql, generate_sales.py, queries.sql
├── app/                 # backend application code
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
python database/generate_sales.py

# Run a single query, e.g. count the rows in a table
sqlite3 plantbase.db "SELECT COUNT(*) FROM growing_conditions;"

# Run all practice queries from queries.sql
sqlite3 -header -column plantbase.db < database/queries.sql
```

Note: running `generate_sales.py` a second time adds another batch of sales rows. To avoid duplicates, rebuild the database with the commands above first.
