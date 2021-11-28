SELECT name, COUNT(film_id)
FROM film
RIGHT JOIN language
ON language.language_id = film.language_id
GROUP BY name;
