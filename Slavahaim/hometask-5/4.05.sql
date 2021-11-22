SELECT l.name, COUNT(f.language_id) 
FROM language l INNER JOIN film f ON l.language_id = f.language_id 
GROUP BY l.name
;
