SELECT rental_duration, COUNT(rental_duration) FROM film
GROUP BY rental_duration
;
