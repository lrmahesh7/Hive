drop table post44;
create table post44 (
id int,
name string,
gender string
)
clustered by (id) into 4 buckets
row format delimited
fields terminated by ','
stored as orc
tblproperties("transactional" = "true");

insert into post44 select * from post41;

insert into post44 values(7,"mahi","male");
