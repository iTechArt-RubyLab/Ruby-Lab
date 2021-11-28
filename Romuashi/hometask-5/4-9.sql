SELECT actor.first_name, actor.last_name, COUNT(film_actor.film_id)
FROM actor 
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id 
GROUP BY actor.first_name, actor.last_name 
HAVING COUNT(film_actor.film_id) > 2;
