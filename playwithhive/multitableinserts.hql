use spark;
show tables;
from t3 insert overwrite table t2 select t3.* where 1=1
     insert overwrite table t4 select t3.* where 1=1
     insert overwrite table t1 select t3.* where 1=1;

