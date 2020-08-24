drop table logs;
CREATE TABLE logs (foo INT, bar STRING, sal int)
     ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe' 
    WITH SERDEPROPERTIES ("field.delim"="<=>")
    STORED AS TEXTFILE;
 load data local inpath '/home/hduser/mahesh/logsinput' into table logs;
select * from logs;
