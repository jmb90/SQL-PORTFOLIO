-- FILE: 02_filtering_ordering.sql
-- TOPIC: Filtering, ordering, limiting results
-- DATASET: Sakila (PostgreSQL)

-- Q1: Films longer than 150 minutes
-- Demonstrates: WHERE + ORDER BY
SELECT title, length
FROM film
WHERE length > 150
ORDER BY length DESC, title;


-- Q2: Films with length between 90 and 120 minutes
-- Demonstrates: BETWEEN
SELECT title, length
FROM film
WHERE length BETWEEN 90 AND 120
ORDER BY length, title;


-- Q3: Films with rating in a given set
-- Demonstrates: IN
SELECT title, rating
FROM film
WHERE rating IN ('PG', 'PG-13')
ORDER BY rating, title;


-- Q4: Films whose title starts with 'A'
-- Demonstrates: LIKE
SELECT title
FROM film
WHERE title LIKE 'A%'
ORDER BY title;


-- Q5: Films whose title contains the word 'LOVE'
-- Demonstrates:
SELECT title
FROM film
WHERE title LIKE '%LOVE%'
ORDER BY title;


-- Q6: Get a page of results (pagination)
-- Demonstrates: LIMIT + OFFSET
SELECT film_id, title
FROM film
ORDER BY film_id
LIMIT 10 OFFSET 0;  -- page 1

-- page 2
SELECT film_id, title
FROM film
ORDER BY film_id
LIMIT 10 OFFSET 10;


-- Q7: Customers with missing email
-- Demonstrates: IS NULL
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE email IS NULL;


