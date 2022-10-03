USE example;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT UNSIGNED,
	name VARCHAR(255)
);

INSERT INTO users VALUES (DEFAULT, 'new user');
