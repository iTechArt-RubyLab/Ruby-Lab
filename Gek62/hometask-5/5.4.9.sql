SELECT actor.first_name, actor.last_name, COUNT(film_actor.film_id)
FROM actor 
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id 
GROUP BY actor.actor_id
HAVING COUNT(film_actor.film_id) > 2
ORDER BY count DESC;
