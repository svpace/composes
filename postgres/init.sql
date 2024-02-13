alter system set wal_level = 'logical';

create role cdc with login replication password 'password';

create table "messages" (
	"id" uuid primary key default gen_random_uuid(),
	"body" varchar(255) not null
);

insert into "messages" ("body") values ('First Message');
