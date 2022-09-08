USE prik;
/*
Операторы, фильтрация, сортировка и ограничение

ex1
*/

UPDATE users 
SET created_at = NOW();

-- updated_at заполняется автоматически DEFAULT_GENERATED on update CURRENT_TIMESTAMP

-- ex2 

SELECT 
STR_TO_DATE(created_at, '%d.%m.%Y %h:%i') AS created_at, 
STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i') AS updated_at
FROM users;

-- ex3
SELECT 
SELECT value 
FROM  storehouses_products 
ORDER BY CASE WHEN id = 0 THEN 1 ELSE 0 END, value;

-- ex4

SELECT name
FROM users 
WHERE MONTHNAME(birthday_at) IN ('may', 'august');

-- ex5

SELECT * 
FROM catalogs 
WHERE id IN (5, 1, 2)
ORDER BY FIELD(id, 5, 1, 2);

/*
Практическое задание теме “Агрегация данных”

ex1
*/

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) FROM users;

-- ex2

SELECT 
COUNT(DAYNAME(DATE_FORMAT(birthday_at, '2022-%m-%d'))) AS num,
DAYNAME(DATE_FORMAT(birthday_at, '2022-%m-%d')) AS day_name 
FROM users GROUP BY DAYNAME(DATE_FORMAT(birthday_at, '2022-%m-%d'));

-- ex3 

SELECT EXP(SUM(LN(value))) FROM tab;


