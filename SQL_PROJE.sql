SELECT title, description
FROM film
ORDER BY title;
SELECT *
FROM film
WHERE length > 60 AND length < 75
ORDER BY length, title;
SELECT *
FROM film
WHERE rental_rate = 0.99
  AND replacement_cost IN (12.99, 28.99)
ORDER BY film_id;
SELECT last_name
FROM customer
WHERE first_name = 'Mary';
SELECT *
FROM film
WHERE length <= 50
  AND rental_rate NOT IN (2.99, 4.99)
ORDER BY length, title;
