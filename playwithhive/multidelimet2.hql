use delimiters;

drop table delim2;
CREATE TABLE delim2 (name string,code string,dob date,c1 int,c2 int,c3 int,c4 int,amount int,c5 int)
     ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.MultiDelimitSerDe' 
    WITH SERDEPROPERTIES ("field.delim"="@#")
    STORED AS TEXTFILE;
 load data local inpath '/home/hduser/mahesh/mulidelimet1' into table delim2;
select * from delim2;
