SELECT * 
FROM film 
JOIN language ON film.language_id = language.language_id 
WHERE language.name IN ('Italian','English','German')
ORDER BY title;
