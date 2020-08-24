use ${hiveconf:database};
create table real_estate_02(street string,zip int,state string,beds int,baths int,sq_ft int,flat_type string,price float)partitioned by(city string) clustered by(street) into 8 buckets row format delimited fields terminated by ',';

set hive.exec.max.dynamic.partitions.pernode=20000;
set hive.enforce.bucketing=true;
set hive.exec.dynamic.partition.mode=nonstrict;
insert into table real_estate_02 partition(city) select * from inputtoreal_estate;
