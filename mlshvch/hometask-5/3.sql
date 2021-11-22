SELECT CONCAT(last_name, '-', first_name)
FROM actor
WHERE first_name ILIKE 'w%' OR last_name LIKE '%h';
