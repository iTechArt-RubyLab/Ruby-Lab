SELECT * FROM film f INNER JOIN language l ON f.language_id = l.language_id
WHERE l.name IN ('English','German','Italian');
