DELETE FROM inventory
WHERE inventory.film_id IN (SELECT film.film_id FROM film WHERE length > 150 );

DELETE FROM film_category
WHERE film_id IN (SELECT film.film_id FROM film WHERE length > 150 );

DELETE FROM film_actor
WHERE film_id IN (SELECT film.film_id FROM film WHERE length > 150 );

DELETE FROM film WHERE length > 150;
