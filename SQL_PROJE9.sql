-- 1) city + country: şehir adı ve ülke adı
SELECT ci.city, co.country
FROM city AS ci
INNER JOIN country AS co ON ci.country_id = co.country_id
ORDER BY co.country, ci.city;

-- 2) payment + customer: payment_id ve müşterinin adı-soyadı
SELECT p.payment_id, c.first_name, c.last_name
FROM payment AS p
INNER JOIN customer AS c ON p.customer_id = c.customer_id
ORDER BY p.payment_id;


-- 3) rental + customer: rental_id ve müşterinin adı-soyadı
SELECT r.rental_id, c.first_name, c.last_name
FROM rental AS r
INNER JOIN customer AS c ON r.customer_id = c.customer_id
ORDER BY r.rental_id;
