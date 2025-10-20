SELECT country
FROM country
WHERE country LIKE 'A%a'
ORDER BY country;
SELECT country
FROM country
WHERE char_length(country) >= 6
  AND country LIKE '%n'
ORDER BY country;
SELECT title
FROM film
WHERE length(upper(title)) - length(replace(upper(title), 'T', '')) >= 4
ORDER BY title;
SELECT *
FROM film
WHERE title LIKE 'C%'
  AND length > 90
  AND rental_rate = 2.99
ORDER BY title;
