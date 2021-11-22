SELECT lang.name, COUNT(film.film_id)
FROM film
LEFT JOIN language lang ON film.language_id = lang.language_id
GROUP BY lang.name;
