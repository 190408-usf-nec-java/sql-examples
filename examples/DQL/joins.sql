-- Joins!
-- Joins allow us to horizontally combine table data, generally to map
-- between tables and rows, such that related data from multiple tables
-- can be displayed together.

-- posts table -> id, author_id, content, post_time
-- users table -> (id), first_name, last_name
-- We can join posts and users result sets by comparing 
--	 posts.author_id with users.id

-- Join types
--------------
--left join
--right join
--full outer join
--inner join
--cross join
--natural join

select * from posts
	left join users on author_id = users.id;