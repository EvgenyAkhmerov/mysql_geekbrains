-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”. 
-- Работаем с БД vk и данными, которые вы сгенерировали ранее:

USE vk;

-- 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).

set @user_id = 4;

/*
insert ignore into messages (from_user_id, to_user_id)
values (16, 4);
*/

select 
	count(*) as cnt,
	person
from (
select
	from_user_id as person
from messages
where to_user_id = @user_id
union all
select
	to_user_id as person
from messages
where from_user_id = @user_id) as all_messages
group by person
order by cnt desc limit 1;

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.

/* 
insert into likes (user_id, media_id)
values  (12, 21),
		(14, 22);
*/

select COUNT(*) as amount_of_likes
from likes
where user_id in
(select 
	user_id
from profiles
where TIMESTAMPDIFF(YEAR, birthday, now()) < 10);

-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины.

select 
	IF(
	(select COUNT(*) from likes
	where user_id in (select user_id from profiles where gender = 'm')) >
	(select COUNT(*) from likes 
	where user_id in (select user_id from profiles where gender = 'f')),
	'Больше мужчин поставило лайки',
	'Больше женщин поставило лайки'
	)
;





