use bucketting;
create table real_estate(street string,zip int,state string,beds int,baths int,sq_ft int,flat_type string,price float)partitioned by(city string) clustered by(street) into 4 buckets row format delimited fields terminated by ',';
create table inputtoreal_estate(street string,zip int,stat string,beds int,baths int,city string,sq_ft int,flat_type string,price float) row format delimited fields terminated by ',';
load data local inpath '/home/hduser/mahesh/buckettinginput' into table inputtoreal_estate;

set hive.exec.max.dynamic.partitions.pernode=20000;
set hive.enforce.bucketing=true;
set hive.exec.dynamic.partition.mode=nonstrict;
insert into table real_estate partition(city) select * from inputtoreal_estate;
