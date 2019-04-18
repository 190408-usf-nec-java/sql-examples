-- SCALAR functions
-- predefined functions come in two categories:
-- * Scalar functions
-- * aggregate functions

-- Scalar functions manipulate data without aggregating rows.
-- Use of alias using AS and without AS
select id+1 as id_plus_one, UPPER(first_name) upper_name from users;

-- SCALAR FUNCTION EXAMPLES:
-- UPPER, LOWER, ROUND, ceil, FLOOR

-- Aggregate Functions
-- Aggregate functions allow us to look at sections, or subsections of table
-- and operate on those as a group, consuming many rows to produce useful
-- information.

select COUNT(*) from users;

-- Find the number of posts by author_id
select author_id, count(*) from posts group by author_id;

select AVG(score) from my_first_Table;

-- I'm only interested in posts with a content size larger than 25 characters
select author_id, count(*) from posts 
	where CHAR_LENGTH(content) < 25
	group by author_id
	having count(*) > 2;

-- 1. All data is pulled from the table
-- 2. WHERE clause filters out data with content length less than 25
-- 3. Data is grouped into groups by author_id
-- 4. Rows in groups are aggregated using the count function
-- 5. HAVING clause filters out data with count greater than 2





