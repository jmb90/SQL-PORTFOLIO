-- FILE: 04_joins.sql
-- TOPIC: JOINs (INNER, LEFT) across Sakila
-- DATASET: Sakila (PostgreSQL)

-- Q1: Films with their language
-- Demonstrates: INNER JOIN (1:many)
SELECT f.film_id, f.title, l.name AS language
FROM film f
JOIN language l ON f.language_id = l.language_id
ORDER BY f.film_id;


-- Q2: Customers and their store (which store they belong to)
-- Demonstrates: INNER JOIN + selecting fields from both tables
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer,
       c.store_id
FROM customer c
JOIN store s ON c.store_id = s.store_id
ORDER BY c.customer_id;


-- Q3: Actors and films (many-to-many via film_actor)
-- Demonstrates: JOIN chain (actor -> film_actor -> film)
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor,
       f.title
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
ORDER BY actor, f.title;


-- Q4: All actors including those with no films (if any)
-- Demonstrates: LEFT JOIN
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor,
       f.title
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
ORDER BY actor, f.title;


-- Q5: Films rented by each customer (multi-table join)
-- Demonstrates: JOIN chain across transactional tables
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer,
       r.rental_id,
       r.rental_date,
       f.title
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
ORDER BY r.rental_date DESC
LIMIT 50;


-- Q6: Customers who never rented anything
-- Demonstrates: LEFT JOIN + IS NULL (anti-join)
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL
ORDER BY c.customer_id;

