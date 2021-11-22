SELECT film.title, lang.name
FROM film
LEFT JOIN language lang ON film.language_id = lang.language_id
WHERE lang.name IN ('English', 'Italian', 'German');
