SELECT concat(last_name, '-', first_name)
FROM actor
WHERE first_name LIKE'%W%'
OR last_name LIKE'%h';
