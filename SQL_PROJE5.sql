SELECT title, length
FROM film
WHERE title LIKE '%n'
ORDER BY length DESC, title
LIMIT 5;
SELECT title, length
FROM film
WHERE title LIKE '%n'
ORDER BY length ASC, title
LIMIT 5 OFFSET 5;
SELECT customer_id, first_name, last_name, store_id
FROM customer
WHERE store_id = 1
ORDER BY last_name DESC, first_name DESC
LIMIT 4;
