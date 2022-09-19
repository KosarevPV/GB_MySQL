-- ex 1

SELECT CONCAT(u.firstname,' ' , u.lastname) AS name
FROM users AS u JOIN messages AS m ON u.id = m.from_user_id
WHERE m.to_user_id = 4
GROUP BY m.from_user_id, m.to_user_id
HAVING COUNT(m.to_user_id) = (
	SELECT MAX(c) FROM
		(SELECT COUNT(*) AS c
		 FROM messages AS mes
		 WHERE mes.to_user_id = 4
		 GROUP BY mes.from_user_id, mes.to_user_id) AS _);
	
-- ex 2

SELECT COUNT(*) AS "Общее количество лайков"
FROM profiles AS pr 
JOIN posts AS p ON pr.user_id = p.user_id
JOIN posts_likes AS pl ON p.id =pl.post_id
WHERE TIMESTAMPDIFF(YEAR, pr.birthday, CURRENT_TIMESTAMP) < 10;

-- ex 3

SELECT IF(gender = "m", "Мужчины", "Женщины") AS "Больше поставили лайков"
FROM posts_likes AS pl
JOIN profiles AS p ON pl.user_id = p.user_id
WHERE gender IN ('m', 'f')
GROUP BY p.gender
ORDER BY COUNT(*) DESC
LIMIT 1;