USE shop;

-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

/* 
UPDATE users
SET created_at = NULL, updated_at = NULL
WHERE name = 'Геннадий';

SELECT * FROM users;

*/

UPDATE users
SET created_at = NOW(), updated_at = NOW()
WHERE created_at is NULL AND updated_at is NULL;


SELECT * FROM users;

-- 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
-- и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, 
-- сохранив введеные ранее значения.

ALTER TABLE users CHANGE created_at created_at DATETIME DEFAULT NOW(); 
ALTER TABLE users CHANGE updated_at updated_at DATETIME DEFAULT NOW();

-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
-- если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
-- чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

SELECT * FROM storehouses_products;

/* INSERT IGNORE INTO storehouses_products (value) VALUES
	(0),
	(2500),
	(0),
	(100),
	(50),
	(200),
	(0)
; */ -- add value

/* ALTER TABLE storehouses_products 
ADD COLUMN available BOOL DEFAULT FALSE; */ -- add column available, value: true or false

UPDATE storehouses_products 
SET available = TRUE
WHERE value > 0;

SELECT id, value, available FROM storehouses_products
ORDER BY available DESC, value;

-- 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
-- Месяцы заданы в виде списка английских названий ('may', 'august')

SELECT name, MONTHNAME(birthday_at) AS birth_month FROM users
WHERE MONTHNAME(birthday_at) IN ('May', 'August');

-- 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
-- Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM catalogs WHERE id IN (5, 1, 2)
ORDER BY FIELD(id, 5, 1, 2);

-- Практическое задание теме “Агрегация данных”

-- 1. Подсчитайте средний возраст пользователей в таблице users

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) FROM users;

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT COUNT(*), DAYOFWEEK(birthday_at) AS day_of_week FROM users
GROUP BY day_of_week
;

-- 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы

USE base_for_task;

DROP TABLE IF EXISTS numbers;

CREATE TABLE numbers (num INT);

INSERT INTO numbers VALUES
	(1),
	(2),
	(3),
	(4),
	(5)
;

SELECT EXP(SUM(LOG(FLOOR(num)))) FROM numbers; 

	




