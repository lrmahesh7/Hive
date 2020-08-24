drop table join_a;
drop table join_b;
create table join_a (
id int,
name string,
gender string
)
row format delimited 
fields terminated by '\t'
stored as textfile;

load data local inpath '/home/hduser/mahesh/joininput_a.csv' into table join_a;
select * from join_a;
create table join_b (
order_id int,
order_date string,
order_amt int,
order_status string
)
row format delimited 
fields terminated by '\t'
stored as textfile;

load data local inpath '/home/hduser/mahesh/joininput_b.csv' into table join_b;
select * from join_b;

select a.id as id,a.name as name,a.gender as gender,b.order_id as id,b.order_date as order_id,b.order_status as od_stat from join_a a join join_b b on (a.id = b.order_id);

select a.id as id,a.name as name,a.gender as gender,b.order_id as id,b.order_date as order_id,b.order_status as od_stat from join_a a left outer join join_b b on (a.id = b.order_id);

select a.id as id,a.name as name,a.gender as gender,b.order_id as id,b.order_date as order_id,b.order_status as od_stat from join_a a right join join_b b on (a.id = b.order_id);

select a.id as id,a.name as name,a.gender as gender,b.order_id as id,b.order_date as order_id,b.order_status as od_stat from join_a a cross join join_b b on (a.id = b.order_id) where a.id is null;

select a.id as id,a.name as name,a.gender as gender,b.order_id as id,b.order_date as order_id,b.order_status as od_stat from join_a a full outer join join_b b on (a.id = b.order_id);

select a.id as id,a.name as name,a.gender as gender,b.order_id as id,b.order_date as order_id,b.order_status as od_stat from join_a a cross join join_b b on (a.id = b.order_id) where a.id is null;

select b.* from join_b b left semi join join_a a on(b.order_id=a.id);

