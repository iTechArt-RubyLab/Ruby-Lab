SELECT name, COUNT(language.language_id) FROM film 
INNER JOIN language ON film.language_id = language.language_id GROUP BY name
