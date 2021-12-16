SELECT language.name,COUNT("language"."language_id") AS "total"
FROM film
INNER JOIN language
    ON film.language_id = language.language_id
GROUP BY language.name;
