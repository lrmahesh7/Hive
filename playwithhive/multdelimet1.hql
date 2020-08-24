drop table stocks_multi;
add jar /home/hduser/mahesh/hive-contrib-0.10.0.jar;
CREATE table stocks_multi(
exch STRING,
symbol STRING,
ymd STRING,
price_open FLOAT,
price_high FLOAT,
price_low FLOAT,
price_close FLOAT,
volume INT,
price_adj_close FLOAT)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe'
WITH SERDEPROPERTIES ("field.delim"="@#");
load data local inpath '/home/hduser/mahesh/mulidelimet1' into table stocks_multi;
select * from stocks_multi;
