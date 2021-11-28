select rental_duration, COUNT(film_id)
from film
group by rental_duration;