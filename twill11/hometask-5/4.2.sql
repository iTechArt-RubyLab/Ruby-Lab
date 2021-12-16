SELECT * FROM film 
JOIN language ON language.language_id = film.language_id 
WHERE language.name IN ('English', 'German', 'Italian');
