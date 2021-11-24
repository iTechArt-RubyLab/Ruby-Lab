SELECT rental_duration, COUNT(title) AS in_each_group
FROM film
GROUP BY rental_duration;