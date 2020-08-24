use delimiters;
drop table temp;
drop table permanent;

create table temp(name string);
load data local inpath '/home/hduser/mahesh/differentdelims' into table temp;

create table permanent(id int,name string,sal int);
insert into permanent select substring(name,1,3)as id,substring(name,7,3) as name ,substring(name,13,4)as sal from temp;

select * from permanent;

