WITH films_ids AS (
    SELECT film_id
    FROM film
    WHERE title = 'Samurai Lion'
)
DELETE FROM film_category WHERE film_id IN (
 select film_id from films_ids
);
WITH films_ids AS (
    SELECT film_id
    FROM film
    WHERE title = 'Samurai Lion'
)
DELETE FROM film_actor WHERE film_id IN (
  SELECT film_id FROM films_ids
);
WITH films_ids AS (
    SELECT film_id
    FROM film
    WHERE title = 'Samurai Lion'
)
DELETE FROM payment WHERE rental_id IN (
 SELECT rental_id FROM rental 
  WHERE inventory_id IN (
   SELECT inventory_id FROM inventory 
    WHERE film_id IN (
     SELECT film_id FROM films_ids
    )
  )
);
WITH films_ids AS (
    SELECT film_id
    FROM film
    WHERE title = 'Samurai Lion'
)
DELETE FROM rental WHERE inventory_id IN (
 SELECT inventory_id FROM inventory 
  WHERE film_id IN (
   SELECT film_id FROM films_ids
  )
);
DELETE FROM inventory WHERE film_id IN (
  SELECT film.film_id FROM film
   INNER JOIN film_category ON film.film_id = film_category.film_id
    INNER JOIN category ON film_category.category_id = category.category_id
     WHERE film.title = 'Samurai Lion'
);
 
);
DELETE FROM film 
WHERE title = 'Samurai Lion';
