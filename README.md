# Sakila SQL Portfolio

This repository contains a collection of SQL queries developed to analyze the
Sakila sample database using PostgreSQL.

The project is intended as a **SQL learning and portfolio project**, showing
progression from basic queries to more advanced analytical techniques.

---

## Dataset

- **Name**: Sakila (DVD Rental Sample Database)
- **Context**: Video rental store
- **DBMS**: PostgreSQL
- **Tool**: pgAdmin

---

## Project Structure

- `sql/`  
  SQL scripts organized by topic and increasing difficulty.
- `docs/`  
  Additional documentation and analysis notes.

Each SQL file focuses on a specific set of concepts and contains commented
queries explaining the objective of each exercise.

---

## SQL Concepts Covered

- Basic queries (`SELECT`, `FROM`)
- Filtering data with `WHERE`
- Sorting results with `ORDER BY`
- Pagination with `LIMIT` and `OFFSET`
- Aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)
- Data aggregation using `GROUP BY`
- Filtering aggregated data with `HAVING`
- `INNER JOIN` and `LEFT JOIN`
- Multi-table joins and join chains
- Anti-join patterns (`LEFT JOIN ... IS NULL`)
- Subqueries (simple, nested and correlated)

---

## How to Use This Repository

1. Import the Sakila database into PostgreSQL.
2. Open the SQL scripts located in the `sql/` directory.
3. Execute the scripts in numerical order to follow the learning progression.
4. Review the comments inside each script for context.

---

## Author

Juan Marín Barrero
