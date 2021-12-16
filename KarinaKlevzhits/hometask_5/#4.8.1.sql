ALTER TABLE film_actor
DROP CONSTRAINT film_actor_actor_id_fkey,
ADD CONSTRAINT film_actor_actor_id_fkey
FOREIGN KEY (film_id)
REFERENCES film (film_id)
ON DELETE CASCADE 
NOT VALID;

ALTER TABLE film_category
DROP CONSTRAINT film_category_category_id_fkey,
ADD CONSTRAINT film_category_category_id_fkey
FOREIGN KEY (film_id)
REFERENCES film (film_id)
ON DELETE CASCADE 
NOT VALID;

ALTER TABLE inventory
DROP CONSTRAINT fim_id_fkey,
ADD CONSTRAINT fim_id_fkey
FOREIGN KEY (film_id)
REFERENCES film (film_id)
ON DELETE CASCADE 
NOT VALID;

ALTER TABLE rental
DROP CONSTRAINT inventory_id_fkey,
ADD CONSTRAINT inventory_id_fkey
FOREIGN KEY (inventory_id)
REFERENCES inventory (inventory_id)
ON DELETE CASCADE 
NOT VALID;

ALTER TABLE payment
DROP CONSTRAINT rental_id_fkey,
ADD CONSTRAINT rental_id_fkey
FOREIGN KEY (rental_id)
REFERENCES rental (rental_id)
ON DELETE CASCADE 
NOT VALID;


DELETE FROM film 
WHERE title = 'Airport Pollock';