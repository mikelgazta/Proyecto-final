alter user system account unlock ;
alter user system identified by oracle;
alter profile DEFAULT limit PASSWORD_REUSE_TIME unlimited;
alter profile DEFAULT limit PASSWORD_LIFE_TIME  unlimited;
select username, account_status, EXPIRY_DATE from dba_users where username='SYSTEM';