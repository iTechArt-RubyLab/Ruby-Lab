SELECT rental_duration, COUNT(f.rental_duration)
FROM film f
GROUP BY f.rental_duration;
