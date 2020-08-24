drop table maxmin;
create table maxmin(id int,deptno int,sal int) row format delimited fields terminated by ',';
load data local inpath '/home/hduser/mahesh/minmaxinput' into table maxmin;
select * from(select deptno,min(sal) as sal from maxmin group by deptno union all select deptno,max(sal) from maxmin group by deptno order by deptno) maxmin;

