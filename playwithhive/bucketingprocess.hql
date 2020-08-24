use bucketting;
drop table inputtobucket;
drop table bucket_table;
create table inputtobucket(street string,city string,zip string,states string,beds string,baths string,
sq_feet 
load data local inpath '/home/hduser/mahesh/bucketdata' into table inputtobucket;
select * from inputtobucket;

create table bucket_table(street string,city string,zip string,states string,beds string,baths string,sq_feet st$


set hive.exec.dynamic.partition.mode=nonstrict;
set mapred.reduce.tasks = 2;
set hive.enforce.bucketing = true;
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.max.dynamic.partitions=100000;
set hive.exec.max.dynamic.partitions.pernode=100000;

insert into bucket_table  select street,city,zip,states,beds,baths,sq_feet,flat_type,price from inputtobucket;
select * from bucket_table;

