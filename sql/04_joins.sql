-- ============================================
-- FILE: 04_joins.sql
-- TOPIC: JOINs (INNER JOIN, LEFT JOIN)
-- DATASET: Sakila (PostgreSQL)
-- ============================================


-- Q1: Films with their language
-- Demonstrates: INNER JOIN
SELECT f.film_id,
       f.title,
       l.name AS language
FROM film f
INNER JOIN language l ON f.language_id = l.language_id
ORDER BY f.film_id;


-- Q2: Customers and the store they belong to
-- Demonstrates: INNER JOIN
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer,
       c.store_id
FROM customer c
INNER JOIN store s ON c.store_id = s.store_id
ORDER BY c.customer_id;


-- Q3: Actors and films 
-- Demonstrates: JOIN chain (actor -> film_actor -> film)
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor,
       f.title
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
ORDER BY actor, f.title;


-- Q4: Customers who never rented any film
-- Demonstrates: LEFT JOIN + IS NULL 
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL
ORDER BY c.customer_id;


-- Q5: Total number of rentals per customer
-- Demonstrates: JOIN + GROUP BY
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer,
       COUNT(r.rental_id) AS total_rentals
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;


-- Q6: Total amount paid by each customer
-- Demonstrates: JOIN + SUM
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer,
       SUM(p.amount) AS total_paid
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_paid DESC;


-- Q7: Number of inventory copies per film
-- Demonstrates: LEFT JOIN + COUNT
SELECT f.film_id,
       f.title,
       COUNT(i.inventory_id) AS inventory_copies
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.film_id, f.title
ORDER BY inventory_copies DESC, f.title;


-- Q8: Films that have never been rented
-- Demonstrates: LEFT JOIN + IS NULL
SELECT DISTINCT f.film_id,
       f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL
ORDER BY f.title;


-- Q9: Staff members with their store and address
-- Demonstrates: JOIN chain
SELECT CONCAT(st.first_name, ' ', st.last_name) AS staff_member,
       s.store_id,
       a.address
FROM staff st
INNER JOIN store s ON st.store_id = s.store_id
INNER JOIN address a ON s.address_id = a.address_id
ORDER BY s.store_id, staff_member;


-- Q10: Number of rentals per film category
-- Demonstrates: Multiple JOINs + GROUP BY
SELECT c.name AS category,
       COUNT(r.rental_id) AS total_rentals
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY total_rentals DESC;
