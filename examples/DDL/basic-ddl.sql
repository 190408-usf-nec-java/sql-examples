-- DDL - Data Definition Language
-- Operations:
-- CREATE
-- ALTER
-- DROP
-- TRUNCATE

create table if not exists my_first_table (
--  col_name datatype   other properties
	id 		SERIAL 		primary key,
	score 	DECIMAL 	not null,
	name 	VARCHAR(10) unique
);

create table if not exists related_table (
	id SERIAL primary key,
	--  foreign key referencing id of my_first_table
	main_table_id INTEGER references my_first_table(id)
)

-- drop table - Deletes entire table and all data
--drop table my_first_table;

-- truncate table - Removes data, leaving empty table structure behind
--truncate table my_first_table;

alter table my_first_table
	add column new_column INTEGER not null;