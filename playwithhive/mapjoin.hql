select /*+ mapjoin(join_b)*/ a.* ,b.* from join_a a join join_b b on(a.id=b.order_id)
