-- DCL Sublanguage
-- data control language - is used to provide and revoke privileges to USERS
-- such that users aren't provided more privileges than they need to do their
-- job, which would be a security risk.

-- Operations:
-- grant - Grants privileges to a role
-- revoke - Revokes privileges from a role

create role jdbc LOGIN password 'p4ssw0rd';

-- This will provide privileges allowing jdbc to run select queries
-- on the followers table
grant select, update, INSERT on table followers to jdbc;

-- Provides all privileges on every existing table in public to jdbc
grant select, update, INSERT on all tables in schema public to jdbc;
grant all PRIVILEGES on all sequences in schema public to jdbc;

revoke all privileges on all tables in schema public from jdbc;

-- CRUD
-- create-read-update-delete
