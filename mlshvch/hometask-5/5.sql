SELECT l.name, COUNT(f.film_id)
FROM film f
         LEFT JOIN language l
                   ON f.language_id = l.language_id

GROUP BY l.name;