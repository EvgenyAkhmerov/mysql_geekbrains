USE shop;

/*
INSERT INTO orders (user_id)
VALUES
	(1),
	(2),
	(3)
; */

-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT * FROM users
WHERE id IN (SELECT user_id FROM orders);

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT
	id, 
	name,
	(SELECT name FROM catalogs WHERE id = catalog_id) as 'catalog'
FROM 
	products;

-- 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

USE base_for_task;

/*
CREATE TABLE flights (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	from_ VARCHAR(255),
	to_ VARCHAR(255)
);

CREATE TABLE cities (
	label varchar(255),
	name varchar(255)
); */

/*
INSERT INTO flights (from_,to_)
VALUES
	('moscow', 'omsk'),
	('novgorod', 'kazan');

INSERT INTO cities (label, name)
VALUES
	('moscow', 'Москва'),
	('novgorod', 'Новгород'),
	('omsk', 'Омск'),
	('kazan', 'Казань')
; */

SELECT 
	(SELECT name FROM cities WHERE from_ = label) as 'откуда',
	(SELECT name FROM cities WHERE to_ = label) as 'куда'
FROM flights;
