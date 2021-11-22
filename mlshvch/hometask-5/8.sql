ALTER TABLE film_actor
DROP CONSTRAINT film_actor_film_id_fkey;

ALTER TABLE film_category
DROP CONSTRAINT film_category_film_id_fkey;

ALTER TABLE inventory
DROP CONSTRAINT inventory_film_id_fkey;

delete from film
where length > 150;