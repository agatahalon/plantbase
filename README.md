# PlantBase

A plants and herbs database covering species found across Europe (with a Poland-specific lens), built as a portfolio project to practice full-stack testing skills: SQL database design, Python, and Playwright test automation.

## Status

Work in progress -- built step by step as a learning project.

## Project goals

- Design and populate a relational SQLite database of plants and herbs (names, Latin names, families, where they're found, growing conditions, uses, toxicity, and approximate harvest data).
- Build a small web application on top of the database.
- Write automated tests at multiple levels: SQL data-quality checks, Python unit/API tests (pytest), and end-to-end browser tests (Playwright).
- Set up continuous integration so tests run automatically on every push.

## Tech stack

- Database: SQLite
- Backend: Python
- Testing: pytest, Playwright
- CI: GitHub Actions

## Project structure

\`\`\`
plantbase/
├── database/ # schema.sql, seed data
├── app/ # backend application code
├── tests/
│ ├── sql/ # data-quality / database tests
│ ├── unit/ # unit and API tests
│ └── e2e/ # Playwright end-to-end tests
└── .github/
└── workflows/ # CI configuration
\`\`\`

More detail (schema design, test strategy) will be added as the project develops.
