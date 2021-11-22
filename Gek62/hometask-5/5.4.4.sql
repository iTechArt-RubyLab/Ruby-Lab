SELECT COUNT(rental_duration),rental_duration
FROM film
GROUP BY rental_duration
ORDER BY rental_duration;