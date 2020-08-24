drop table post49;
drop table post41;
create table post49 (
order_id int,
order_date string,
order_amt int,
order_status string
)
row format delimited 
fields terminated by '\t'
stored as textfile;

load data local inpath '/home/hduser/mahesh/post49input' into table post49;


create table post41 (
id int,
name string,
gender string
)
row format delimited 
fields terminated by ','
stored as textfile;

load data local inpath '/home/hduser/mahesh/post41.csv.gz' into table post41;

select * from post49 where order_id IN (select DISTINCT(id) from post41);
