use ${hiveconf:database};
select * from ${hiveconf:tablename} where name=${hiveconf:name};
