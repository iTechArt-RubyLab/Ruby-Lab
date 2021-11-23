1) Достать список всех актеров с фамилией Zellweger.

```
SELECT *
FROM actor
WHERE last_name = 'Zellweger';
```
```
actor_id | first_name | last_name |      last_update       
----------+------------+-----------+------------------------
       85 | Minnie     | Zellweger | 2013-05-26 14:47:57.62
      111 | Cameron    | Zellweger | 2013-05-26 14:47:57.62
      186 | Julia      | Zellweger | 2013-05-26 14:47:57.62
(3 rows)
```


2) Получить список фильмов с английским, немецким и итальянским языком.

```
SELECT f.title, l.name
FROM film f INNER JOIN language l on f.language_id = l.language_id 
WHERE l.name = 'English' or l.name = 'German' or l.name = 'Italian';
```
```
           title            |         name         
-----------------------------+----------------------
 Airport Pollock             | English             
 Bright Encounters           | English             
 Academy Dinosaur            | English
 ...
 Zhivago Core                | English             
 Zoolander Fiction           | English             
 Zorro Ark                   | English             
(949 rows)
```


3) Получить список актеров у которых имя начинается на W или фамилия заканчивается на H.
Для каждого актера вывести только полное имя, соединенное через дефис, начиная с фамилии.
Например, для актера  William Hoffman - результирующая колонка будет ‘Hoffman-William’.

```
SELECT first_name || '-' || last_name
FROM actor
WHERE first_name like 'W%' or last_name like '%h';
```
```
   ?column?     
-----------------
 Woody-Hoffman
 Kirk-Jovovich
 Woody-Jolie
 Charlize-Dench
 Walter-Torn
 Matthew-Leigh
 Warren-Nolte
 Warren-Jackman
 Julianne-Dench
 Whoopi-Hurt
 Will-Wilson
 William-Hackman
 Cuba-Birch
(13 rows)
```


4) Подсчитать кол-во фильмов с одинаковым rental_duration, подчитать кол-во фильмов в каждой группе.
В результирующей выборке получить только rental_duration и кол-во фильмов в этой группе.

```
SELECT rental_duration, count(rental_duration) count
FROM film
GROUP BY rental_duration
order by rental_duration asc;
```
```
rental_duration | count 
-----------------+-------
               3 |   196
               4 |   194
               5 |   179
               6 |   201
               7 |   179
(5 rows)
```


5) Подсчитать общее кол-во фильмов с каждым из языков.
В результирующей выборке получить название языка и связанное с ним количество фильмов.

```
SELECT l.name as language, count(f.title)    
FROM language l INNER JOIN film f on l.language_id = f.language_id 
GROUP BY l.name;
```
```
       language       | count 
----------------------+-------
 English              |   949
(1 row)
```


6) Написать запрос на создание самого любимого фильма, который вам нравится.

```
INSERT INTO film(title, language_id, fulltext)
VALUES ('Pacific Rim', 1, 'pacific_rim'::tsvector);
```
```
INSERT 0 1
task5_db=# select title from film where title = 'Pacific Rim';
    title    
-------------
 Pacific Rim
(1 row)
```


7) Написать запрос на редактирование нескольких атрибутов любого фильма

```
UPDATE film
SET title = 'The Pacific Rim', language_id = 2
WHERE title = 'Pacific Rim';
```
```
UPDATE 1
task5_db=# select title, language_id from film where title like 'The Pacific Rim';
      title      | language_id 
-----------------+-------------
 The Pacific Rim |           2
(1 row)
```


8) Написать запрос на удаление фильмов которые вам не нравятся(это может быть по имени,
категории или же еще по какому-нибудь вашему признаку)
Не забывайте о каскадных связях с другими таблицами.

```
DELETE FROM payment
WHERE rental_id in (
  SELECT rental_id
  FROM rental 
  WHERE inventory_id in (
    SELECT inventory_id
    FROM inventory
    WHERE film_id in (
      SELECT f.film_id
      FROM film f INNER JOIN film_category fc on f.film_id = fc.film_id INNER JOIN category c on fc.category_id = c.category_id
      WHERE c.name = 'Music')));

DELETE FROM rental
WHERE inventory_id in (
  SELECT inventory_id 
  FROM inventory
  WHERE film_id in (
    SELECT f.film_id
    FROM film f INNER JOIN film_category fc on f.film_id = fc.film_id INNER JOIN category c on fc.category_id = c.category_id
    WHERE c.name = 'Music'));

DELETE FROM inventory
WHERE film_id in (
  SELECT f.film_id
  FROM film f INNER JOIN film_category fc on f.film_id = fc.film_id INNER JOIN category c on fc.category_id = c.category_id 
  WHERE c.name = 'Music');

DELETE FROM film_actor WHERE film_id in (
  SELECT f.film_id                                                                          
  FROM film f INNER JOIN film_category fc on f.film_id = fc.film_id INNER JOIN category c on fc.category_id = c.category_id 
  WHERE c.name = 'Music');

DELETE FROM film_category
WHERE category_id in (
  SELECT category_id
	FROM category WHERE name = 'Music');

DELETE FROM film f
WHERE (SELECT count(*) FROM film_category fc WHERE fc.film_id = f.film_id) = 0;
```
```
select count(*) FROM film_category
WHERE category_id in (
  SELECT category_id
FROM category WHERE name = 'Music');
 count 
-------
    51
(1 row)

DELETE 750
DELETE 830
DELETE 232
DELETE 281
DELETE 51
DELETE 51
```


9) Вывести список актеров которые снимались более чем в двух фильмах.

```
SELECT a.first_name, a.last_name
FROM actor a 
WHERE (SELECT count(*) FROM film_actor fa WHERE a.actor_id = fa.actor_id) > 2;
```
```
first_name  |  last_name   
-------------+--------------
 Penelope    | Guiness
 Nick        | Wahlberg
 Ed          | Chase
...
 Mary        | Keitel
 Julia       | Fawcett
 Thora       | Temple
(200 rows)

```


10) Добавьте новую колонку со значением по умолчанию в таблицу film.

```
ALTER TABLE film
ADD COLUMN impression CHAR(200) DEFAULT 'normal';
```
```
ALTER TABLE

                                              Table "public.film"
      Column      |            Type             | Collation | Nullable |                Default                
------------------+-----------------------------+-----------+----------+---------------------------------------
impression       | character(200)              |           |          | 'normal'::bpchar
```


11) Удалите колонку из п. 4.10.

```
ALTER TABLE film
DROP COLUMN impression;
```
```
ALTER TABLE
```