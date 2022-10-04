
# 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
# Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

 # insert ignore into users (id, name)
#values (1, 'Генадий');
#delete from sample.users where id = 1;
#select * from sample.users;

start transaction;

select * from users where id = 1;

insert ignore into sample.users (id, name)
select id, name from shop.users where id = 1;

delete from shop.users where id = 1;

select * from sample.users;

commit;

select * from shop.users;

# 2. Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее 
# название каталога name из таблицы catalogs.

USE shop;

#CREATE view product_and_catalogs AS
#select products.name as 'product name', catalogs.name as 'catalogs name'
#from products
#inner join catalogs on products.catalog_id =  catalogs.id;

select * from product_and_catalogs;

# 3. (по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные записи за август 2018 года 
# '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август, 
# выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.

select * from base_for_task.calendar_notes
limit 5;

use base_for_task;

create view august_notes as
select 
	calendar_notes.crated_at,
	CASE 
		when calendar_notes.crated_at = calendar.crated_at then 1
		else 0
	END as 'exist or not'
from calendar_notes
left join calendar on calendar_notes.crated_at = calendar.crated_at; 

select * from august_notes;

# Практическое задание по теме “Хранимые процедуры и функции, триггеры"

# 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
# С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
# с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

use base_for_task;
drop procedure if exists hello;

delimiter //
create procedure hello ()
BEGIN
	select CASE
		when HOUR(CURRENT_TIME) < 6 then 'Доброй ночи'
		when (HOUR(CURRENT_TIME) > 6) and (HOUR(CURRENT_TIME) <= 12) then 'Доброе утро'
		when (HOUR(CURRENT_TIME) > 12) and (HOUR(CURRENT_TIME) <= 18) then 'Добрый день'
		when (HOUR(CURRENT_TIME) > 18) and (HOUR(CURRENT_TIME) <= 23) then 'Добрый вечер'
		else NULL
	end;
END//

call hello();

# SHOW PROCEDURE STATUS LIKE 'hello'

# 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
# Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
# Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
# При попытке присвоить полям NULL-значение необходимо отменить операцию.

use shop;

select * from products;


drop trigger if exists enable_to_add_item;
delimiter //
create trigger enable_to_add_item before insert on products 
for each row
begin
	if (NEW.name is NULL) and (NEW.description is NULL) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Name or description must be filled';
	end if;
end//

drop trigger if exists enable_to_update_item;
delimiter //
create trigger enable_to_update_item before update on products 
for each row
begin
	if (NEW.name is NULL) and (NEW.description is NULL) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Name or description must be filled';
	end if;
end//

insert into products (price)
values (900);

update products 
set name = NULL 
where id = 1;

update products 
set description = NULL 
where id = 1;



	
	



