SELECT CONCAT(last_name, '-', first_name) AS full_name
FROM actor
WHERE first_name LIKE 'w%' OR last_name LIKE '%h'
