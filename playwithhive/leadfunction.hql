#LEAD (scalar_expression [,offset] [,default]) OVER ([query_partition_clause] order_by_clause); The LEAD function is used to return data from the next row.
select id,sal,(sal-lead(sal,1,null) over (order by id))  from t2;

