-- ex 1

SELECT (SELECT firstname FROM users WHERE id = from_user_id) AS firstname, 
	(SELECT lastname FROM users WHERE id = from_user_id) AS lastname
FROM messages 
GROUP BY from_user_id, to_user_id
HAVING to_user_id = 4
ORDER BY COUNT(to_user_id) DESC
LIMIT 1;

-- ex 2

SELECT COUNT(*) AS "Общее количество лайков"
FROM posts_likes 
WHERE post_id 
IN (SELECT id 
    FROM posts 
	WHERE user_id 
	IN (SELECT user_id 
	    FROM profiles 
		WHERE TIMESTAMPDIFF(YEAR, birthday, CURRENT_TIMESTAMP) < 10));

-- ex 3									

SELECT IF(gender = "m", "Мужчины", "женщины") AS "Больше поставили лайков"
FROM (SELECT
		(SELECT gender 
	 	FROM profiles 
	 	WHERE profiles.user_id = posts_likes.user_id) AS gender
	  FROM posts_likes
      GROUP BY gender
      HAVING gender IN ("m", "f")
      ORDER BY COUNT(user_id) DESC
      LIMIT 1) AS gender;
