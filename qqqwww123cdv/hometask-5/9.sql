SELECT actor.last_name, actor.first_name,  COUNT(film_actor.film_id)
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.last_name, actor.first_name
HAVING COUNT(film_actor.film_id) > 2;