SELECT AVG(rental_rate) AS avg_rental_rate
FROM film;

SELECT COUNT(*) AS films_starting_with_C
FROM film
WHERE title ILIKE 'C%';

SELECT MAX(length) AS max_length_min
FROM film
WHERE rental_rate = 0.99;

SELECT COUNT(DISTINCT replacement_cost) AS distinct_replacement_costs_len_gt_150
FROM film
WHERE length > 150;
