create table accounts (
	id SERIAL primary key,
	balance numeric CHECK(balance > -100)
);

insert into accounts (balance) values 
	(100), (200), (300), (400), (500);
	
select * from ACCOUNTS;

update ACCOUNTS set BALANCE = id * 100;

begin; -- Start transaction
update accounts set balance = balance - 50 where id = 1;
update accounts set balance = balance + 50 where id = 2;

-- Create savepoint
savepoint my_savepoint;

update accounts set balance = balance - 100 where id = 3;
update accounts set balance = balance + 100 where id = 4;

-- Rollback to previously defined savepoint - as such 3&4 should not be modified
rollback to savepoint my_savepoint;


update accounts set balance = balance + 25 where ID = 5;

-- Commit transaction
-- Ultimately, only rows 1, 2, and 5 will be modified
commit;