SELECT name, COUNT(film_id) AS number_of_films FROM language 
LEFT JOIN film ON (language.language_id = film.language_id) 
GROUP BY language_id
