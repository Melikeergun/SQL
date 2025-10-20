SELECT rating, COUNT(*) AS film_sayisi
FROM film
GROUP BY rating
ORDER BY film_sayisi DESC, rating;

SELECT replacement_cost, COUNT(*) AS film_sayisi
FROM film
GROUP BY replacement_cost
HAVING COUNT(*) > 50
ORDER BY film_sayisi DESC, replacement_cost;

SELECT store_id, COUNT(*) AS musteri_sayisi
FROM customer
GROUP BY store_id
ORDER BY store_id;

-- Basit: tek satır döndürür
SELECT country_id, COUNT(*) AS sehir_sayisi
FROM city
GROUP BY country_id
ORDER BY sehir_sayisi DESC
LIMIT 1;

-- Beraberlik varsa tüm maksimumları döndür (tie-safe)
WITH counts AS (
  SELECT country_id, COUNT(*) AS sehir_sayisi
  FROM city
  GROUP BY country_id
),
maxv AS (
  SELECT MAX(sehir_sayisi) AS mx FROM counts
)
SELECT c.country_id, c.sehir_sayisi
FROM counts c
JOIN maxv m ON c.sehir_sayisi = m.mx
ORDER BY c.country_id;
