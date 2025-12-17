-- FILE: 03_aggregations_groupby_having.sql
-- TOPIC: Aggregations, GROUP BY and HAVING
-- DATASET: Sakila (PostgreSQL)

-- Q1: Total number of distinct films
-- Demonstrates: COUNT
SELECT DISTINCT COUNT(film_id) AS total_films
FROM film;


-- Q2: Average, minimum and maximum film length
-- Demonstrates: AVG, MIN, MAX
SELECT
    AVG(length) AS avg_length,
    MIN(length) AS min_length,
    MAX(length) AS max_length
FROM film;


-- Q3: Number of films per rating
-- Demonstrates: GROUP BY + COUNT
SELECT rating,COUNT (film_id) AS total_films
FROM film
GROUP BY rating
ORDER BY total_films DESC;


-- Q4: Average film length per rating
-- Demonstrates: GROUP BY + AVG
SELECT rating, ROUND(AVG(length),2) AS avg_length
FROM film
GROUP BY rating
ORDER BY avg_length DESC;


-- Q5: Ratings with more than 200 films
-- Demonstrates: GROUP BY + HAVING
SELECT rating, COUNT(film_id) AS total_films
FROM film
GROUP BY rating
HAVING COUNT(film_id) > 200
ORDER BY total_films DESC;


-- Q6: Customers with more than 30 rentals
-- Demonstrates: GROUP BY + HAVING on transactional data
SELECT customer_id,COUNT(*) AS total_rentals
FROM rental 
GROUP BY customer_id
HAVING COUNT(*) > 30
ORDER BY total_rentals DESC;

