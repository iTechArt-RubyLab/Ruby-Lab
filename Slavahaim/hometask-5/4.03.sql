SELECT CONCAT(last_name, '-', first_name) AS FullName FROM actor a 
WHERE first_name LIKE 'W%' OR last_name LIKE '%h';
