DELETE 
FROM film_actor 
WHERE film_id 
IN 
(SELECT film_id 
FROM film 
WHERE title = 'Kill Bill');

DELETE 
FROM film_category 
WHERE film_id 
IN 
(SELECT film_id 
FROM film 
WHERE title = 'Kill Bill');

DELETE 
FROM payment 
WHERE rental_id 
IN 
(SELECT rental_id 
FROM rental 
WHERE inventory_id 
IN 
(SELECT inventory_id 
FROM inventory 
WHERE film_id 
IN 
(SELECT film_id 
FROM film 
WHERE title = 'Kill Bill')));

DELETE 
FROM rental 
WHERE inventory_id 
IN 
(SELECT inventory_id 
FROM inventory 
WHERE film_id 
IN 
(SELECT film_id 
FROM film 
WHERE title = 'Kill Bill'));

DELETE 
FROM inventory 
WHERE film_id 
IN 
(SELECT film_id 
FROM film 
WHERE title = 'Kill Bill');

DELETE 
FROM film 
WHERE title = 'Kill Bill';
