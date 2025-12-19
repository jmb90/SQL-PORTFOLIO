-- ============================================
-- FILE: 05_subqueries.sql
-- TOPIC: Subqueries
-- DATASET: Sakila (PostgreSQL)
-- ============================================


-- Q1: Films longer than the average film length
-- Demonstrates: Subquery returning a single value
SELECT title, length
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film
)
ORDER BY length DESC;


-- Q2: Films with the same length as 'DANCING FEVER'
-- Demonstrates: Subquery returning a single value with =
SELECT title, length
FROM film
WHERE length = (
    SELECT length
    FROM film
    WHERE title = 'DANCING FEVER'
)
ORDER BY title;


-- Q3: Customers who have made at least one rental
-- Demonstrates: Subquery returning multiple values with IN
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT DISTINCT customer_id
    FROM rental
)
ORDER BY customer_id;


-- Q4: Customers who have never rented a film
-- Demonstrates: NOT IN subquery
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM rental
)
ORDER BY customer_id;


-- Q5: Films that belong to the 'Action' category
-- Demonstrates: Subquery with IN and multiple levels
SELECT title
FROM film
WHERE film_id IN (
    SELECT film_id
    FROM film_category
    WHERE category_id = (
        SELECT category_id
        FROM category
        WHERE name = 'Action'
    )
)
ORDER BY title;


-- Q6: Actors who have appeared in more films than the average actor
-- Demonstrates: Subquery with aggregation
SELECT a.actor_id,
       CONCAT(a.first_name, ' ', a.last_name) AS actor
FROM actor a
WHERE a.actor_id IN (
    SELECT fa.actor_id
    FROM film_actor fa
    GROUP BY fa.actor_id
    HAVING COUNT(fa.film_id) > (
        SELECT AVG(film_count)
        FROM (
            SELECT COUNT(fa2.film_id) AS film_count
            FROM film_actor fa2
            GROUP BY fa2.actor_id
        ) sub
    )
)
ORDER BY actor;


-- Q7: Films whose replacement cost is higher than the average cost for their rating
-- Demonstrates: Correlated subquery
SELECT f1.title,
       f1.rating,
       f1.replacement_cost
FROM film f1
WHERE f1.replacement_cost > (
    SELECT AVG(f2.replacement_cost)
    FROM film f2
    WHERE f2.rating = f1.rating
)
ORDER BY f1.rating, f1.replacement_cost DESC;


-- Q8: Customers who have spent more than the average customer
-- Demonstrates: Subquery with aggregation and HAVING
SELECT p.customer_id,
       SUM(p.amount) AS total_spent
FROM payment p
GROUP BY p.customer_id
HAVING SUM(p.amount) > (
    SELECT AVG(total_amount)
    FROM (
        SELECT SUM(amount) AS total_amount
        FROM payment
        GROUP BY customer_id
    ) sub
)
ORDER BY total_spent DESC;


-- Q9: Films that have never been rented
-- Demonstrates: Subquery with NOT IN
SELECT title
FROM film
WHERE film_id NOT IN (
    SELECT DISTINCT i.film_id
    FROM inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
)
ORDER BY title;

