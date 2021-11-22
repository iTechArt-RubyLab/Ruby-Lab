SELECT name, COUNT(film_id) AS number_of_films
FROM film
RIGHT JOIN language
ON language.language_id = film.language_id
GROUP BY 1;
