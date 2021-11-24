INSERT INTO film(title, release_year, language_id)
VALUES ('Matrix', 1999, (SELECT language_id FROM language WHERE 'English' = name));
