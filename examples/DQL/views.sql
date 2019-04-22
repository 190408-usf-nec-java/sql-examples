-- view - A database object which represents a stored query or conceptually
-- a way of looking at data, particularly in a processed format

create view even_users as
	select * from users where id % 2 = 0;
	
select * from even_users where id > 50;

grant SELECT on even_users to jdbc;