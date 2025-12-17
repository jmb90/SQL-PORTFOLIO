-- FILE: 01_basics.sql
-- TOPIC: Basic SELECT queries
-- DATASET: Sakila (PostgreSQL)

-- Q1: List all films with their title and release year
-- Demonstrates: SELECT, FROM
SELECT title, release_year
FROM film;

-- Q2: List films ordered by length (longest first)
-- Demonstrates: ORDER BY
SELECT title, length
FROM film
ORDER BY length DESC;

-- Q3: Show the 10 longest films
-- Demonstrates: ORDER BY + LIMIT
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

