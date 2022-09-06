USE vk;

-- ex 2
SELECT DISTINCT firstname FROM users ORDER BY firstname ASC;

-- ex 3
ALTER TABLE profiles ADD COLUMN is_active TINYINT(1) DEFAULT '1';

UPDATE profiles
SET is_active = 0
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 18;

-- ex 4
DELETE FROM messages WHERE created_at > NOW();