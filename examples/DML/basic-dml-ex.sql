-- DML - Data Manipulation language
-- 4 or 3 operations
-- insert -- Inserts new rows into a table
-- update -- Update updates existing rows in a table
-- delete -- Deletes rows in a table
-- (SELECT) -- some people include select, but we will view it as it's owned
			-- sublanguage: DQL

-- Anatomy of insert statement
-- insert into table_name (col, ...) values (data, ...);

insert into my_first_Table (score, name, new_column) values (20, 'me', 1);

-- Multi-insert
insert into my_first_table (score, name, new_column) values 
	(30, 'Abby', 1), (15, 'Billy', 1), (25, 'Cathy', 1);

-- UPDATE anatomy
-- UPDATE table_name SET column_name = new_value;

-- DANGER ZONE
-- Abby played the game again and got a score of 45, so we want to
-- update Abby's score to 45
begin;
-- Warning: This will update every record! It's a bad idea!
update my_first_table set score = 45;
rollback;
-- WHERE clause - Functions as a filter to filter out rows which do not
-- match an expression

-- ... WHERE column_name = value ...
-- ... WHERE 1 = 1 ...

-- aside: sql injection attack examples
--EMAIL -> some_email or 1 = 1
--where email = some_email or 1 = 1
--email -> some-email"; drop table users; --

update my_first_table set score = 45 where id = 4;
update my_first_table set score = 50 where name = 'Billy';

update my_first_table set score = score + 10 where id = 4;

begin;
-- Warning: Without a WHERE clause we delete ALL the data
delete from my_first_Table;
select * from MY_FIRST_tABLE;
rollback;

delete from my_first_Table where id = 6;

-- Postgres RETURNING syntax
-- Using a returning clause returns a dataset representing modified data
-- from a DML statement

insert into my_first_Table (score, name, new_column) values
	(30, 'Danny', 1) returning id;

-- Chaining multiple operations with returned data available
-- postgres: WITH syntax