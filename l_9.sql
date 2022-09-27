/*Практическое задание по теме 
 * “Транзакции, переменные, представления”*/

-- ex 1

START TRANSACTION;

SELECT * 
FROM shop.users 
WHERE id = 1;

INSERT INTO sample.users
SELECT * 
FROM shop.users 
WHERE id = 1;

DELETE FROM shop.users 
WHERE id = 1;

COMMIT; 

-- ex 2

DROP VIEW IF EXISTS name_prod_cat;
CREATE OR REPLACE VIEW name_prod_cat AS
SELECT p.name AS Name, c.name AS Catalog_name
FROM products p 
JOIN catalogs c ON p.catalog_id = c.id;

-- ex 3

CREATE TABLE date_table (id INT, created_at DATE);

INSERT INTO date_table 
VALUES (1, '2018-08-01'), (2, '2016-08-04'), (3, '2018-08-16'), (4, '2018-08-17');

DROP VIEW IF EXISTS num_31;
CREATE OR REPLACE VIEW num_31 AS
SELECT 0  UNION ALL SELECT 1  UNION ALL SELECT 2  UNION ALL
SELECT 3  UNION ALL SELECT 4  UNION ALL SELECT 5  UNION ALL
SELECT 6  UNION ALL SELECT 7  UNION ALL SELECT 8  UNION ALL
SELECT 9  UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL
SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL
SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL
SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20 UNION ALL
SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL
SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL
SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL
SELECT 30;

SET @start :=-1;

SELECT d AS Даты, IF(d IN (SELECT created_at  FROM date_table), 1, 0) AS Заряд
FROM
(SELECT DATE_ADD('2018-08-01', INTERVAL @start:= @start + 1 DAY) d
FROM num_31
WHERE @start < 30) date_n;

-- ex 4 

DELETE FROM users 
WHERE id NOT IN (SELECT * 
 				   FROM (SELECT id FROM users 
			   		   ORDER BY created_at DESC
				          LIMIT 5) _);
			
			
/* Практическое задание по теме 
 * “Администрирование MySQL” */

-- ex 1

CREATE USER u1 IDENTIFIED WITH sha256_password BY 'pass';	
CREATE USER u2 IDENTIFIED WITH sha256_password BY 'pass';	
GRANT SELECT ON shop.* TO u1;		
GRANT ALL ON shop.* TO u2;

-- ex 2

USE test2;

DROP VIEW IF EXISTS acc_v;
CREATE OR REPLACE VIEW acc_v AS
SELECT id, name FROM accounts;

CREATE USER u3 IDENTIFIED WITH sha256_password BY 'pass';
GRANT SELECT ON test2.acc_v TO u3;

/*Практическое задание по теме 
 “Хранимые процедуры и функции, триггеры"*/
 
 -- ex 1
 
DROP PROCEDURE IF EXISTS hello;
DELIMITER //

CREATE PROCEDURE hello ()
BEGIN
	IF (DATE_FORMAT(NOW(), "%H") BETWEEN 0 AND  5) THEN 
		SELECT "Доброй ночи";
	ELSEIF (DATE_FORMAT(NOW(), "%H") BETWEEN 6 AND  11) THEN 
		SELECT "Доброе утро";
	ELSEIF (DATE_FORMAT(NOW(), "%H") BETWEEN 12 AND  17) THEN 
		SELECT "Добрый день";
	ELSE
		SELECT "Добрый вечер";
	END IF;
END//

DELIMITER ;

-- ex 2

DROP TRIGGER IF EXISTS not_null_prod;
DELIMITER //

CREATE TRIGGER not_null_prod 
BEFORE INSERT ON products
FOR EACH ROW 
BEGIN
	IF NEW.name IS NULL AND NEW.desription IS NULL THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'name and description is NULL';
	END IF;
END //

DELIMITER ;

-- ex 3

DROP FUNCTION IF EXISTS fib_num;
DELIMITER //

CREATE FUNCTION FIBONACCI (n INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE a INT DEFAULT 0;
	DECLARE b INT DEFAULT 1;
	DECLARE c INT DEFAULT 0;
	IF n = 0 THEN
		RETURN a;
	ELSEIF n = 1 THEN
		RETURN b;
	ELSE
		WHILE i < n DO
			SET c = a + b;
			SET a = b;
			SET b = c;
			SET i = i + 1;
			END WHILE;
		RETURN c;
	END IF;
END//
DELIMITER ;