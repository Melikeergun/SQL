SELECT COUNT(*) AS count_above_avg_length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

SELECT COUNT(*) AS count_at_max_rental_rate
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

SELECT film_id, title, rental_rate, replacement_cost
FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film)
  AND replacement_cost = (SELECT MIN(replacement_cost) FROM film)
ORDER BY title;

SELECT c.customer_id, c.first_name, c.last_name,
       COUNT(*) AS payment_count
FROM payment p
JOIN customer c ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY payment_count DESC, c.customer_id;
