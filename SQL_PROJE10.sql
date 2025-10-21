SELECT ci.city, co.country FROM city ci LEFT JOIN country co ON ci.country_id = co.country_id ORDER BY co.country, ci.city;

SELECT p.payment_id, c.first_name, c.last_name FROM customer c RIGHT JOIN payment p ON c.customer_id = p.customer_id ORDER BY p.payment_id;

SELECT r.rental_id, c.first_name, c.last_name FROM customer c FULL JOIN rental r ON c.customer_id = r.customer_id ORDER BY r.rental_id;
