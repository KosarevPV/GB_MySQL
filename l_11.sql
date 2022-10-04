/*Практическое задание по теме 
 “Оптимизация запросов”*/

-- ex 1

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME,
	table_name VARCHAR(150),
	id BIGINT,
	name VARCHAR(150)
) ENGINE=Archive;


DROP TRIGGER IF EXISTS users_logs;
DELIMITER //
CREATE TRIGGER users_logs
AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs VALUES(NEW.created_at, 'users', NEW.id, NEW.name);
END//
DELIMITER ;

DROP TRIGGER IF EXISTS catalogs_logs;
DELIMITER //
CREATE TRIGGER catalogs_logs
AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs VALUES(NOW(), 'catalogs', NEW.id, NEW.name);
END//
DELIMITER ;

DROP TRIGGER IF EXISTS users_logs;
DELIMITER //
CREATE TRIGGER products_logs
AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs VALUES(NEW.created_at, 'products', NEW.id, NEW.name);
END//
DELIMITER ;

-- ex 2

DROP PROCEDURE IF EXISTS add_rows;
DELIMITER //
CREATE PROCEDURE add_rows(n INT)
BEGIN
	SET @x = 1;
	REPEAT
		INSERT INTO users VALUES(DEFAULT, CONCAT('user', @x), FROM_DAYS(720000 + RAND()*18000), DEFAULT, DEFAULT);
		SET @x = @x + 1;
	UNTIL @x > n 
	END REPEAT;
END //
DELIMITER ;

-- Практическое задание по теме “NoSQL”

-- ex 1 

127.0.0.1:6379> hincrby users user1 1
(integer) 1
127.0.0.1:6379> hincrby users user2 1
(integer) 1
127.0.0.1:6379> hincrby users user1 1
(integer) 2
127.0.0.1:6379> hvals users
1) "2"
2) "1"
127.0.0.1:6379> hkeys users
1) "user1"
2) "user2"
127.0.0.1:6379> hgetall users
1) "user1"
2) "2"
3) "user2"
4) "1"


-- ex 2 

127.0.0.1:6379> set name:Pavel:email:pasha@mail.ru ''
OK
127.0.0.1:6379> set name:Ivan:email:ivan@mail.ru ''
OK
127.0.0.1:6379> keys name:Pavel*
1) "name:Pavel:email:pasha@mail.ru"
127.0.0.1:6379> keys name:Ivan*
1) "name:Ivan:email:ivan@mail.ru"
127.0.0.1:6379> keys *:email:pasha@mail.ru
1) "name:Pavel:email:pasha@mail.ru"
127.0.0.1:6379> keys *:email:ivan@mail.ru
1) "name:Ivan:email:ivan@mail.ru"

-- ex 3

db.shop.insert({name: 'Процессоры'})
db.shop.insert({name: 'Материнские платы', products: ['ASUS ROG MAXIMUS X HERO']})
db.shop.update({name: 'Процессоры'}, {$set: { products: ['Intel Core i3-8100', 'Intel Core i5-7400']}})
db.shop.update({name: 'Материнские платы'}, {$push: { products : 'Gigabyte H310M S2H'}})
db.shop.find()