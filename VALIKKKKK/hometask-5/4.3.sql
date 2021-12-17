SELECT CONCAT(last_name, '-', first_name) AS fullname
FROM actor
WHERE first_name LIKE 'W%' 
  OR last_name LIKE '%H'
