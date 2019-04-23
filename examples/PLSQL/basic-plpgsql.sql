-- PLSQL
-- procedural language
-- In postgres procedural langauge can be written 
-- in any of different languages, including Java. We will be using
-- plpgsql - procedural language: PostgreSQL

-- functions are operations or groups of operations stored on the database
-- which can be recalled later. They can be provided parameters and return values.
-- functions generally have access to DML/DQL commands, and may be designed
-- to act as an interface for external (application driven) users to interact
-- with the data model.

-- Syntax wise - Defining functions in sql is somewhat heavy and more inline
-- with what you might expect from lower level programming languages.

-- A function for calculating the sum of two ints


create or replace function my_sum(val_a INTEGER, val_b INTEGER)
	returns INTEGER as $$ -- <-- delimiter - separates DDL from function body
		begin
			return val_a + val_b;
		end;
	$$ language plpgsql;

select id, new_column, id+new_Column, my_sum(id, new_Column) from my_first_table;

create or replace function create_user(fn VARCHAR,
			ln VARCHAR, em VARCHAR)
			returns void as $$
				begin
					insert into users (first_name, last_name, EMAIL)
						values (fn, ln, em);
				end;
			$$ security definer language plpgsql;
		
select create_user('X', 'Factor', 'xfactor@gmail.com');

select * from users where first_name like '_';

revoke all PRIVILEGES on table users from jdbc;
grant all privileges on table users to jdbc;



