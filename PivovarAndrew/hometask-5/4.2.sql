SELECT film.* FROM film
INNER JOIN language 
ON film.language_id = language.language_id
WHERE language.name = 'Italian' OR language.name = 'English' OR language.name = 'German'
