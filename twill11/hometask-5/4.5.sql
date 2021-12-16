SELECT language.name, COUNT(film.title) AS number_of_films FROM language 
INNER JOIN film ON language.language_id = film.language_id 
GROUP BY language.name;
