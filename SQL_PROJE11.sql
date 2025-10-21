SELECT first_name FROM actor
UNION
SELECT first_name FROM customer
ORDER BY first_name;

SELECT first_name FROM actor
INTERSECT
SELECT first_name FROM customer
ORDER BY first_name;

SELECT first_name FROM actor
EXCEPT
SELECT first_name FROM customer
ORDER BY first_name;

-- Tüm isimler (tekrarlı)
SELECT first_name FROM actor
UNION ALL
SELECT first_name FROM customer
ORDER BY first_name;

-- Kesişim (tekrarlı)
SELECT first_name FROM actor
INTERSECT ALL
SELECT first_name FROM customer
ORDER BY first_name;

-- Sadece actor – customer (tekrarlı)
SELECT first_name FROM actor
EXCEPT ALL
SELECT first_name FROM customer
ORDER BY first_name;

