select name, count(film_id)
from film
  left join language
    on language.language_id = film.language_id
group by name;