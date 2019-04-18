-- DQL - data Query language
-- * select - to retrieve from the table
-- While select is the only operation considered to be a part of DQL
-- select is complicated and there are a lot of different ways to
-- structure and piece together select statements.

-- select col, (...) from table_name; -- select named columns
-- select * from table_name; -- all columns

select * from my_first_table;

select name, score from my_first_Table 
	where score >= 50
	order by score desc -- order by column, (col, ...)
	limit 1 -- used to reduce return set to a given number of rows
	offset 1 -- offset start of returned results;
	
create table users (
	id SERIAL primary key,
	first_name VARCHAR(40),
	last_name VARCHAR(40),
	email VARCHAR(254)
);

-- COMPOSITE KEY - A primary key that is composed of multiple columns
-- such that the composite of the two or more values is the unique identifier

create table followers (
	follower_id INTEGER references users(id),
	followee_id INTEGER references users(id),
	primary key (follower_id, followee_id),
	-- Users should not be able to follow themselves
	check (follower_id != followee_id)
);

create table posts (
	id SERIAL primary key,
	author_id INTEGER references users(id) not null,
	content VARCHAR(255) not null,
	-- Automatically insert current timestamp when rows are inserted
	post_time TIMESTAMP DEFAULT(CURRENT_TIMESTAMP) not null
)


-- Violated CHECK constraint
insert into followers (follower_id, followee_id) values (3, 3);

-- Works fine
insert into followers (follower_id, followee_id) values (3, 4);


insert into posts (author_id, content) values 
	(3, 'It''s a good day!');

select * from posts;