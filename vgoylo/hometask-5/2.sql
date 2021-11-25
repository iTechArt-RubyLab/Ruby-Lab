SELECT *
FROM "film"
JOIN language
ON film.language_id = language.language_id
WHERE language.name IN ('Italian','German','English')
ORDER BY title;
