--  return QUERY

-- We are returning a query that can then be executed
-- PARAMETERS IN SQL, work differently than Java in that:
-- Parameters can be IN/OUT/INOUT parameters.
-- variadic - Like Java varargs
drop function find_user_by_first_name;
create or replace function find_user_by_first_name(in fn VARCHAR)
	returns TABLE(id INTEGER, first_name VARCHAR, 
			last_name VARCHAR, email VARCHAR) as $$
	begin
		return QUERY select rt.id, rt.first_name, rt.last_name, rt.email from users as rt
			where rt.first_name = fn;
	end;
$$ language plpgsql;

select * from find_user_by_first_name('X');