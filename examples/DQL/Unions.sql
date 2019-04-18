-- Combining result sets vertically 
-- Combining multiple select queries together to create a single result set

-- UNION - Combine the result sets of two queries, representing only unique rows
-- union all - Same as union, but will not remove repeated rows

select * from users where id = 5
union ALL
select * from USERS where id between 2 and 7;


select * from users where id between 2 and 7 or id = 5;

-- intersect - Combines a result such that returned rows must be in both
-- result sets

select * from users where id = 5
INTERSECT
select * from USERS where id between 2 and 7;

select * from users where id between 2 and 7 and id = 5;
-- except - Returns rows from first result set which are not present in second
--	result set



select * from USERS where id between 2 and 7 
EXCEPT
select * from users where id = 5;

select * from users where id between 2 and 7 and id != 5;