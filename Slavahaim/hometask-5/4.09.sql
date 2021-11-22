SELECT a.last_name, a.first_name, a.actor_id, COUNT(fa.film_id)
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id) > 2
ORDER BY COUNT(fa.film_id), last_name
;
