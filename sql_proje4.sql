
SELECT DISTINCT replacement_cost
FROM film
ORDER BY replacement_cost;
SELECT COUNT(DISTINCT replacement_cost) AS distinct_replacement_costs
FROM film;
SELECT COUNT(*) AS num_title_T_and_rating_G
FROM film
WHERE title LIKE 'T%' AND rating = 'G';
SELECT COUNT(*) AS countries_len_5
FROM country
WHERE char_length(country) = 5;
SELECT COUNT(*) AS cities_end_with_r
FROM city
WHERE city ILIKE '%r';
