SELECT CONCAT(actor.first_name, ' ', actor.last_name) AS name, COUNT(actor.actor_id) as count
FROM actor
LEFT JOIN film_actor ON film_actor.actor_id = actor.actor_id
GROUP BY actor.actor_id
HAVING COUNT(actor.actor_id) > 20;
