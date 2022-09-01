USE vk;

DROP TABLE IF EXISTS music;
CREATE TABLE music (
	id SERIAL,
    name VARCHAR(100),
    author VARCHAR(100),
    album VARCHAR(100),
    metadata JSON,
    
    INDEX music_name_idx(name)
);

DROP TABLE IF EXISTS user_music;
CREATE TABLE user_music (
	user_id BIGINT UNSIGNED NOT NULL,
    music_id BIGINT UNSIGNED NOT NULL,
    
    PRIMARY KEY (user_id, music_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (music_id) REFERENCES music(id)
);

DROP TABLE IF EXISTS gifts;
CREATE TABLE gifts (
	id SERIAL,
    name VARCHAR(100),
    body VARCHAR(255),
    metadata JSON,
    
    INDEX gifts_name_idx(name)
);

DROP TABLE IF EXISTS user_gifts;
CREATE TABLE user_gifts (
	to_user_id BIGINT UNSIGNED NOT NULL,
	from_user_id BIGINT UNSIGNED NOT NULL,
    gifts_id BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (to_user_id) REFERENCES users(id),
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (gifts_id) REFERENCES gifts(id)
);

