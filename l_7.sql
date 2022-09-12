-- ex 1

SELECT name 
FROM users
JOIN orders 
ON users.id = orders.user_id 
GROUP BY name;

-- ex 2

SELECT p.name AS Товары, c.name AS Разделы 
FROM products AS p 
JOIN catalogs AS c 
ON p.catalog_id = c.id;

-- ex 3

SELECT id, c1.name AS из, c2.name AS в
FROM flights AS f 
JOIN cities AS c1
	ON f.from = c1.label
JOIN cities AS c2
	ON f.to = c2.label
ORDER BY id;