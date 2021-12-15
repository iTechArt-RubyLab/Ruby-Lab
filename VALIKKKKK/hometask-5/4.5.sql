SELECT language.name, COUNT(*)
FROM film 
JOIN language
ON film.language_id = language.language_id
GROUP BY language.name