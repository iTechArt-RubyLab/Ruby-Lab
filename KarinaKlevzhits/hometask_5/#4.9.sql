SELECT actor.* FROM actor JOIN film_actor ON actor.actor_id=film_actor.actor_id
GROUP BY actor.actor_id HAVING COUNT(film_actor.film_id)>2