SELECT * FROM film 
WHERE language_id IN (
 SELECT language_id FROM language WHERE name IN ('English', 'German', 'Italian')
)
