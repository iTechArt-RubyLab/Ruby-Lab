SELECT rental_duration, COUNT(*) 
AS count_same 
FROM film 
GROUP BY rental_duration;
