SELECT film.*
FROM film
INNER JOIN language 
ON film.language_id = language.language_id
WHERE language.name && ARRAY['English', 'Italian', 'German']
