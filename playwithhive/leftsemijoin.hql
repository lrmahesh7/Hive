select a.id as id,a.name as name,a.gender  from join_a a left semi join join_b b on (a.id = b.order_id);

select a.id as id,a.name as name,a.gender as gender,b.order_id as id,b.order_date as order_id,b.order_status as od_stat from join_a a left semi join join_b b on (a.id = b.order_id);
