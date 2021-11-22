SELECT f.title, l.name
FROM film f
         LEFT JOIN language l
                   ON f.language_id = l.language_id
WHERE l.name IN ('English', 'Italian', 'German');
