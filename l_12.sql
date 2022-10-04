-- Узнать количество велосипедов каждого бренда в котологе

SELECT br.name AS Бренд, COUNT(b.brand_id)  AS Количество 
FROM brand br 
LEFT JOIN bikes b 
ON br.id = b.brand_id 
GROUP BY br.id;

-- выбрать ввелосипед с наибольшей ценой

SELECT * FROM bikes WHERE price = (SELECT MAX(price) FROM bikes);

-- представление включающее название велосипеда, бренд, цену, размер рамы RU

DROP VIEW IF EXISTS velo_brand_frame;
CREATE OR REPLACE VIEW velo_brand_frame AS
SELECT b.name AS 'Название велосипеда', b2.name Бренд, b.price Цена, fs.name_ru 'Размер рамы'
FROM bikes b 
INNER JOIN brand b2 ON b.brand_id = b2.id 
INNER JOIN frame_size fs ON b.frame_size_id = fs.id;

/* представление включающее название велосипеда, бренд, цену за шт, 
количесвто шт на складе суммарную стоимость велоспеда на складе*/

DROP VIEW IF EXISTS velo_brand_storage;
CREATE OR REPLACE VIEW velo_brand_storage AS
SELECT b.name AS 'Название велосипеда', 
	   b2.name Бренд, 
	   b.price Цена,
	   s.amount 'Шт. на складе',
	   ROUND(s.amount * b.price, 0) 'Суммарная стоимость' 
FROM bikes b 
INNER JOIN brand b2 ON b.brand_id = b2.id 
INNER JOIN storage s ON b.id = s.bike_id;

-- процедура на пойск средней цены велосипедов заданного бренда

DROP PROCEDURE IF EXISTS avg_price;
DELIMITER //
CREATE PROCEDURE avg_price (x VARCHAR(150))
BEGIN
	SELECT AVG(b.price) 'Средняя цена'
	FROM bikes b 
	INNER JOIN brand br
	ON b.brand_id = br.id
	WHERE br.name = x;
END//
DELIMITER ;

-- триггер на запрет вставки в таблицу color цветов  не существующими RAL (допустимые RAL от 1000 до 9023)

DROP TRIGGER IF EXISTS try_color;
DELIMITER //

CREATE TRIGGER try_color
BEFORE INSERT ON color
FOR EACH ROW 
BEGIN
	IF NEW.ral NOT BETWEEN 1000 AND 9023 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'not correct RAL';
	END IF;
END //

DELIMITER ;