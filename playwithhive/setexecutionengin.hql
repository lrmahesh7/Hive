set hive.execution.engine;
select * from post41;


set hive.execution.engine=tez;
set hive.execution.engine;
select * from post41;

set hive.execution.engine=spark;

set hive.execution.engine;
select * from post41;
