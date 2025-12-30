-- Create custom user
create user "syslord1" with password 'ayaya67' bypassrls createdb;

-- extend syslord1's privileges to postgres (necessary to view changes in Dashboard)
grant "syslord1" to "postgres";

-- Grant it necessary permissions over the relevant schemas (blg1a2)
grant usage on schema blg1a2 to syslord1;
grant create on schema blg1a2 to syslord1;
grant all on all tables in schema blg1a2 to syslord1;
grant all on all routines in schema blg1a2 to syslord1;
grant all on all sequences in schema blg1a2 to syslord1;
alter default privileges for role postgres in schema blg1a2 grant all on tables to syslord1;
alter default privileges for role postgres in schema blg1a2 grant all on routines to syslord1;
alter default privileges for role postgres in schema blg1a2 grant all on sequences to syslord1;


