SELECT CONCAT(last_name, '-', first_name) as fullname
FROM actor
WHERE first_name like 'W%' OR last_name like '%H'