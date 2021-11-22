SELECT CONCAT(a.first_name, ' ', a.last_name) AS name, FA.count
FROM actor AS a
         LEFT JOIN
     (SELECT fa.actor_id, COUNT(fa.actor_id) as count
      FROM film_actor AS fa
      GROUP BY fa.actor_id
         ) AS FA
     ON FA.actor_id = a.actor_id
WHERE FA.count > 2;
