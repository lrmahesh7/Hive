
use bucketting;
drop table  foo;
create table foo(id int,name string,country string,state string,city string) row format delimited fields terminated by ',';

load data local inpath '/home/hduser/mahesh/playwithhive/bucketting/fooinput' into table foo';

drop table foopartition;
 create table foopartition(id int,name string) partitioned by(country string,state string,city string) row format delimited fields terminated by ',';
     insert into foopartition partition(country,state,city) select * from foo;

