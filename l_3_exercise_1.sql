USE vk;

DROP TABLE IF EXISTS communities_posts;
CREATE TABLE IF NOT EXISTS communities_posts (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	communities_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	file_id BIGINT UNSIGNED NOT NULL,
	txt TEXT NOT NULL,
	likes_counter BIGINT UNSIGNED DEFAULT 0,
	comments_counter BIGINT UNSIGNED DEFAULT 0,
	views_counter BIGINT UNSIGNED DEFAULT 0,
	FOREIGN KEY (communities_id) REFERENCES communities (id),
	FOREIGN KEY (file_id) REFERENCES media (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
);

DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments (
	id SERIAL PRIMARY KEY,
	post_id BIGINT UNSIGNED NOT NULL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	txt TEXT NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	likes_counter BIGINT UNSIGNED DEFAULT 0,
	comments_counter BIGINT UNSIGNED DEFAULT 0,
	FOREIGN KEY (from_user_id) REFERENCES users(id),
	FOREIGN KEY (post_id) REFERENCES communities_posts (id)
);

DROP TABLE IF EXISTS users_music;
CREATE TABLE IF NOT EXISTS users_music (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL,
	executor VARCHAR(255) NOT NULL,
	album VARCHAR(255) NOT NULL,
	duration INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (id)
);