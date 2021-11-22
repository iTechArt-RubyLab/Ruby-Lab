SELECT language.name, COUNT(*) FROM film JOIN language ON language.language_id = film.language_id GROUP BY language.name;
