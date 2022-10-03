USE vk;

INSERT IGNORE INTO user_music (user_id, music_id)
VALUES (1, 24);

INSERT IGNORE INTO user_gifts
VALUES (1, 2, 5);

DELETE FROM user_gifts
WHERE from_user_id = 2;

DELETE FROM users 
WHERE firstname = 'david';

INSERT IGNORE INTO users (firstname, email)
VALUES ('david', 123456);

INSERT IGNORE INTO users (firstname, email)
VALUES ('Alfreda', 1234567);

SELECT DISTINCTROW firstname
FROM users
ORDER BY firstname;

ALTER TABLE profiles
DROP COLUMN is_active;

ALTER TABLE profiles
ADD is_active BOOL DEFAULT TRUE;

UPDATE profiles
SET is_active = 0
WHERE DATEDIFF(CURDATE(), birthday) / 365 < 18
;

DELETE FROM messages 
WHERE created_at > NOW()
;
