-- Cursors - bufferred data that represents a virtual table that we can select
-- from. Generally, these are referred to as cursors. in Oracle the object
--name is cursor, in Postgres it will be refcursor

-- One challenge - Cursors only exist during the lifetime of a transaction.

create or replace function get_user_by_last_name(ln VARCHAR)
	returns refcursor as $$
		declare -- declaration phase -used to declare 
			curs refcursor;	--variables for use in the function
		begin -- executable phase - where executable statements live
			open curs for select * from users where last_name = ln;
			return curs;
		end;
	$$ security definer LANGuaGE plpgsql;

begin;

select * from get_user_by_last_name('Factor');
fetch all in "<unnamed portal 2>"
commit;
