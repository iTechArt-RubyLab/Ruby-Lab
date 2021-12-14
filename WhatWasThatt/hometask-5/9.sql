SELECT * FROM actor WHERE 
(SELECT COUNT(*) FROM film_actor 
WHERE actor.actor_id = film_actor.actor_id) >= 2;