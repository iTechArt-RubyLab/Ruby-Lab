DELETE FROM payment
WHERE rental_id in (
  SELECT rental_id
  FROM rental 
  WHERE inventory_id in (
    SELECT inventory_id
    FROM inventory
    WHERE film_id in (
      SELECT f.film_id
      FROM film f 
      INNER JOIN film_category fc on f.film_id = fc.film_id
      INNER JOIN category c on fc.category_id = c.category_id
      WHERE c.category_id = 6)));

DELETE FROM rental
WHERE inventory_id in (
  SELECT inventory_id 
  FROM inventory
  WHERE film_id in (
    SELECT f.film_id
    FROM film f 
    INNER JOIN film_category fc on f.film_id = fc.film_id 
    INNER JOIN category c on fc.category_id = c.category_id
    WHERE c.category_id = 6));

DELETE 
FROM inventory
WHERE film_id in (
  SELECT f.film_id
  FROM film f 
  INNER JOIN film_category fc on f.film_id = fc.film_id 
  INNER JOIN category c on fc.category_id = c.category_id 
  WHERE c.category_id = 6);

DELETE 
FROM film_actor WHERE film_id in (
  SELECT f.film_id                                                                          
  FROM film f 
  INNER JOIN film_category fc on f.film_id = fc.film_id 
  INNER JOIN category c on fc.category_id = c.category_id 
  WHERE c.category_id = 6);

DELETE 
FROM film_category
WHERE category_id in (
  SELECT category_id
	FROM category WHERE category_id = 6);

DELETE 
FROM film f
WHERE (SELECT count(*) FROM film_category fc WHERE fc.film_id = f.film_id) = 0;
