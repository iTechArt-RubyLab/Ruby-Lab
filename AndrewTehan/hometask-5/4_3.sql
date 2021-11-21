select concat(last_name, '-', first_name) as fullname
from actor 
where first_name like 'W%'
  or last_name like '%H';