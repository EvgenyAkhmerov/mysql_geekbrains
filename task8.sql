USE vk;


-- 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).

set @targ_user_id = 1;

/*
insert into messages (from_user_id, to_user_id, body)
values 
	(2, 1, 'hello!'),
	(1, 2, 'aad'),
	(1, 3, 'dwad'),
	(2, 1, 'wdad');
*/

select
	person_in_dialog as person_id,
	(select concat(users.firstname,' ', users.lastname) from users 
	where users.id = person_id) as name,
	count(*) as amount_of_messages
from
(select
	users.id as target_person,
	messages.to_user_id as person_in_dialog,
	messages.from_user_id as initiator_id
from users
inner join messages on messages.from_user_id = @targ_user_id
UNION all
select
	users.id,
	messages.from_user_id,
	messages.from_user_id
from users
inner join messages on messages.to_user_id = @targ_user_id) as tbl
where target_person = @targ_user_id
group by person_in_dialog
order by amount_of_messages desc limit 1;

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

select concat('Amount of likes: ', count(*)) as 'result'
from profiles
inner join users on users.id = profiles.user_id
right join likes on likes.user_id = profiles.user_id
where TIMESTAMPDIFF(YEAR, birthday, now()) < 10;

-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины.

select
	CASE
    	when profiles.gender = 'f' then 'Женщин'
    	when profiles.gender = 'm' then 'Мужчин'
    END as 'пол',
    count(profiles.gender) as amount_of_likes
from profiles
right join likes on likes.user_id = profiles.user_id
group by gender
order by amount_of_likes desc limit 1;




