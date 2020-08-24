use multipuledelimters;
drop table mytable;
create table mytable 
(c1 string,c2 string,c3 string,c4 string,c5 string)
partitioned by (delim string);

alter table mytable set serdeproperties ('field.delim'=',');
alter table mytable add partition (delim='comma');  

hadoop fs -cp /home/hduser/mahesh/multipuledelimiters/comma.txt hdfs://localhost:54310/user/hive/warehouse/multipuledelimters.db/mytable/delim=comma/

alter table mytable set serdeproperties ('field.delim'=':');
alter table mytable add partition (delim='colon');

hadoop fs -cp /home/hduser/mahesh/multipuledelimiters/semicolon.txt hdfs://localhost:54310/user/hive/warehouse/multipuledelimters.db/mytable/delim=colon/

alter table mytable set serdeproperties ('field.delim'='|');
alter table mytable add partition (delim='pipeline');

hadoop fs -cp /home/hduser/mahesh/multipuledelimiters/pipeline.txt hdfs://localhost:54310/user/hive/warehouse/multipuledelimters.db/mytable/delim=pipeline/

select * from mytable;
