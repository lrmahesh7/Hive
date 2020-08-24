use mahesh;
drop table Json_serde;
add jar /home/hduser/mahesh/hive-json-serde-0.2.jar;
create table Json_serde(name string,age int)row format SERDE 'org.apache.hadoop.hive.contrib.serde2.JsonSerde';
load data local inpath '/home/hduser/mahesh/jsoninput' into table Json_serde;
select * from Json_serde;
