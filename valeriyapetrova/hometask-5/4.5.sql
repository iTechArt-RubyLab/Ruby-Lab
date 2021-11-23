SELECT language.name, COUNT(film.title) FROM film RIGHT JOIN language ON film.language_id = language.language_id GROUP BY language.language_id;