use delimiters;
drop table fixed;
CREATE TABLE fixed(id int, name string)
     ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
     WITH SERDEPROPERTIES('input.regex'='(\\d+){0,4}(\.*)')
     stored as textfile;
load data local inpath '/home/hduser/mahesh/fixedlength' into table fixed;

select * from fixed;
