SELECT language.name, COUNT(film_id) 
AS number_of_films FROM language 
JOIN film ON (language.language_id = film.language_id) 
GROUP BY language.language_id;