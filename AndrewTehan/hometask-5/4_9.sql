select actor.first_name, actor.last_name, actor.actor_id, count(film_actor.film_id)
from actor 
  inner join film_actor
    on actor.actor_id = film_actor.actor_id 
group by actor.first_name, actor.last_name, actor.actor_id 
having COUNT(film_actor.film_id) > 2;