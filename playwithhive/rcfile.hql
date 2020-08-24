create table emprctmp(name string,id int,year string,month string,day string) row format delimited fields terminated by ',' ;
create table emprffile(name string,id int,year string,month string,day string) row format delimited fields terminated by ',' stored as rcfile;
load data local inpath '/home/hduser/mahesh/playwithhive/empinput' into table emprctmp;
insert overwrite table emprffile select * from emprctmp;
