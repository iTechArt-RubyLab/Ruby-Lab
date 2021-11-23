select title, l.name  
from film f 
  inner join language l  
    on f.language_id = l.language_id  
where l.name in ('English', 'German', 'Italian');