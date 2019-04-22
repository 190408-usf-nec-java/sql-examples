-- We want to find, all the users of whom user with the id 7 is following.

-- Example of a Nested Subquery - The subquery is located in the WHERE clause
select * from users where id IN
(select FOLLOWEE_ID from FOLLOWERS where follower_id = 7);

-- in - used in a where clause to select within a set of values
select * from users where id in (10, 15, 20);

-- between - Used to select in a range
select * from users where id between 10 and 20;

-- Example of an inline-view - A subquery located in the FROM clause
select * from 
	(select * from users where id % 2 = 0) as inner_query
where first_name like 'A%';

-- like examples
---- % - Wildcard of any size
---- _ - Wildcard of a single character

select * from users where first_name like 'B_v%';

-- select inner query (this is what I call them)
select *, 
	(select count(*) from posts where author_id = users.id) 
from users order by count desc limit 1;


