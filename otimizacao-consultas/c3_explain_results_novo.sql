
                                                                                    QUERY PLAN                                                                                     
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=130455.55..130455.63 rows=33 width=21) (actual time=1870.681..1882.750 rows=32 loops=1)
   Sort Key: s.sum
   Sort Method: quicksort  Memory: 27kB
   Buffers: shared hit=17 read=66944
   ->  Hash Join  (cost=130453.29..130454.72 rows=33 width=21) (actual time=1870.571..1882.644 rows=32 loops=1)
         Hash Cond: (d.dep_id = s.dep_id)
         Buffers: shared hit=14 read=66944
         ->  Seq Scan on departamentos d  (cost=0.00..1.33 rows=33 width=17) (actual time=0.424..0.426 rows=33 loops=1)
               Buffers: shared read=1
         ->  Hash  (cost=130452.88..130452.88 rows=33 width=12) (actual time=1870.108..1882.176 rows=33 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 10kB
               Buffers: shared hit=14 read=66943
               ->  Subquery Scan on s  (cost=130444.19..130452.88 rows=33 width=12) (actual time=1870.080..1882.168 rows=33 loops=1)
                     Buffers: shared hit=14 read=66943
                     ->  Finalize GroupAggregate  (cost=130444.19..130452.55 rows=33 width=12) (actual time=1870.078..1882.163 rows=33 loops=1)
                           Group Key: e.dep_id
                           Buffers: shared hit=14 read=66943
                           ->  Gather Merge  (cost=130444.19..130451.89 rows=66 width=12) (actual time=1870.069..1882.148 rows=99 loops=1)
                                 Workers Planned: 2
                                 Workers Launched: 2
                                 Buffers: shared hit=14 read=66943
                                 ->  Sort  (cost=129444.16..129444.25 rows=33 width=12) (actual time=1853.663..1853.664 rows=33 loops=3)
                                       Sort Key: e.dep_id
                                       Sort Method: quicksort  Memory: 26kB
                                       Buffers: shared hit=14 read=66943
                                       Worker 0:  Sort Method: quicksort  Memory: 26kB
                                       Worker 1:  Sort Method: quicksort  Memory: 26kB
                                       ->  Partial HashAggregate  (cost=129443.00..129443.33 rows=33 width=12) (actual time=1853.636..1853.639 rows=33 loops=3)
                                             Group Key: e.dep_id
                                             Batches: 1  Memory Usage: 24kB
                                             Buffers: shared read=66943
                                             Worker 0:  Batches: 1  Memory Usage: 24kB
                                             Worker 1:  Batches: 1  Memory Usage: 24kB
                                             ->  Parallel Seq Scan on empregados e  (cost=0.00..108609.67 rows=4166667 width=8) (actual time=0.684..1453.868 rows=3333333 loops=3)
                                                   Buffers: shared read=66943
 Planning:
   Buffers: shared hit=81 read=23
 Planning Time: 9.452 ms
 JIT:
   Functions: 34
   Options: Inlining false, Optimization false, Expressions true, Deforming true
   Timing: Generation 4.239 ms, Inlining 0.000 ms, Optimization 9.267 ms, Emission 178.098 ms, Total 191.605 ms
 Execution Time: 2145.375 ms
(43 rows)

                                                                                    QUERY PLAN                                                                                     
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=130455.55..130455.63 rows=33 width=21) (actual time=1862.824..1873.762 rows=32 loops=1)
   Sort Key: s.sum
   Sort Method: quicksort  Memory: 27kB
   Buffers: shared hit=17 read=66944
   ->  Hash Join  (cost=130453.29..130454.72 rows=33 width=21) (actual time=1862.718..1873.660 rows=32 loops=1)
         Hash Cond: (d.dep_id = s.dep_id)
         Buffers: shared hit=14 read=66944
         ->  Seq Scan on departamentos d  (cost=0.00..1.33 rows=33 width=17) (actual time=0.427..0.429 rows=33 loops=1)
               Buffers: shared read=1
         ->  Hash  (cost=130452.88..130452.88 rows=33 width=12) (actual time=1862.250..1873.186 rows=33 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 10kB
               Buffers: shared hit=14 read=66943
               ->  Subquery Scan on s  (cost=130444.19..130452.88 rows=33 width=12) (actual time=1862.222..1873.178 rows=33 loops=1)
                     Buffers: shared hit=14 read=66943
                     ->  Finalize GroupAggregate  (cost=130444.19..130452.55 rows=33 width=12) (actual time=1862.220..1873.174 rows=33 loops=1)
                           Group Key: e.dep_id
                           Buffers: shared hit=14 read=66943
                           ->  Gather Merge  (cost=130444.19..130451.89 rows=66 width=12) (actual time=1862.209..1873.155 rows=99 loops=1)
                                 Workers Planned: 2
                                 Workers Launched: 2
                                 Buffers: shared hit=14 read=66943
                                 ->  Sort  (cost=129444.16..129444.25 rows=33 width=12) (actual time=1841.356..1841.358 rows=33 loops=3)
                                       Sort Key: e.dep_id
                                       Sort Method: quicksort  Memory: 26kB
                                       Buffers: shared hit=14 read=66943
                                       Worker 0:  Sort Method: quicksort  Memory: 26kB
                                       Worker 1:  Sort Method: quicksort  Memory: 26kB
                                       ->  Partial HashAggregate  (cost=129443.00..129443.33 rows=33 width=12) (actual time=1841.285..1841.288 rows=33 loops=3)
                                             Group Key: e.dep_id
                                             Batches: 1  Memory Usage: 24kB
                                             Buffers: shared read=66943
                                             Worker 0:  Batches: 1  Memory Usage: 24kB
                                             Worker 1:  Batches: 1  Memory Usage: 24kB
                                             ->  Parallel Seq Scan on empregados e  (cost=0.00..108609.67 rows=4166667 width=8) (actual time=0.549..1378.255 rows=3333333 loops=3)
                                                   Buffers: shared read=66943
 Planning:
   Buffers: shared hit=81 read=23
 Planning Time: 9.562 ms
 JIT:
   Functions: 34
   Options: Inlining false, Optimization false, Expressions true, Deforming true
   Timing: Generation 6.691 ms, Inlining 0.000 ms, Optimization 10.632 ms, Emission 171.230 ms, Total 188.553 ms
 Execution Time: 2132.586 ms
(43 rows)

                                                                                    QUERY PLAN                                                                                     
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=130455.55..130455.63 rows=33 width=21) (actual time=1876.667..1891.128 rows=32 loops=1)
   Sort Key: s.sum
   Sort Method: quicksort  Memory: 27kB
   Buffers: shared hit=17 read=66944
   ->  Hash Join  (cost=130453.29..130454.72 rows=33 width=21) (actual time=1876.561..1891.027 rows=32 loops=1)
         Hash Cond: (d.dep_id = s.dep_id)
         Buffers: shared hit=14 read=66944
         ->  Seq Scan on departamentos d  (cost=0.00..1.33 rows=33 width=17) (actual time=0.437..0.439 rows=33 loops=1)
               Buffers: shared read=1
         ->  Hash  (cost=130452.88..130452.88 rows=33 width=12) (actual time=1876.083..1890.543 rows=33 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 10kB
               Buffers: shared hit=14 read=66943
               ->  Subquery Scan on s  (cost=130444.19..130452.88 rows=33 width=12) (actual time=1876.055..1890.534 rows=33 loops=1)
                     Buffers: shared hit=14 read=66943
                     ->  Finalize GroupAggregate  (cost=130444.19..130452.55 rows=33 width=12) (actual time=1876.053..1890.529 rows=33 loops=1)
                           Group Key: e.dep_id
                           Buffers: shared hit=14 read=66943
                           ->  Gather Merge  (cost=130444.19..130451.89 rows=66 width=12) (actual time=1876.044..1890.514 rows=99 loops=1)
                                 Workers Planned: 2
                                 Workers Launched: 2
                                 Buffers: shared hit=14 read=66943
                                 ->  Sort  (cost=129444.16..129444.25 rows=33 width=12) (actual time=1860.292..1860.294 rows=33 loops=3)
                                       Sort Key: e.dep_id
                                       Sort Method: quicksort  Memory: 26kB
                                       Buffers: shared hit=14 read=66943
                                       Worker 0:  Sort Method: quicksort  Memory: 26kB
                                       Worker 1:  Sort Method: quicksort  Memory: 26kB
                                       ->  Partial HashAggregate  (cost=129443.00..129443.33 rows=33 width=12) (actual time=1860.263..1860.266 rows=33 loops=3)
                                             Group Key: e.dep_id
                                             Batches: 1  Memory Usage: 24kB
                                             Buffers: shared read=66943
                                             Worker 0:  Batches: 1  Memory Usage: 24kB
                                             Worker 1:  Batches: 1  Memory Usage: 24kB
                                             ->  Parallel Seq Scan on empregados e  (cost=0.00..108609.67 rows=4166667 width=8) (actual time=0.703..1462.537 rows=3333333 loops=3)
                                                   Buffers: shared read=66943
 Planning:
   Buffers: shared hit=81 read=23
 Planning Time: 9.100 ms
 JIT:
   Functions: 34
   Options: Inlining false, Optimization false, Expressions true, Deforming true
   Timing: Generation 4.204 ms, Inlining 0.000 ms, Optimization 9.344 ms, Emission 179.433 ms, Total 192.982 ms
 Execution Time: 2146.544 ms
(43 rows)

                                                                                    QUERY PLAN                                                                                     
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=130455.55..130455.63 rows=33 width=21) (actual time=1885.140..1899.753 rows=32 loops=1)
   Sort Key: s.sum
   Sort Method: quicksort  Memory: 27kB
   Buffers: shared hit=17 read=66944
   ->  Hash Join  (cost=130453.29..130454.72 rows=33 width=21) (actual time=1885.033..1899.650 rows=32 loops=1)
         Hash Cond: (d.dep_id = s.dep_id)
         Buffers: shared hit=14 read=66944
         ->  Seq Scan on departamentos d  (cost=0.00..1.33 rows=33 width=17) (actual time=0.429..0.431 rows=33 loops=1)
               Buffers: shared read=1
         ->  Hash  (cost=130452.88..130452.88 rows=33 width=12) (actual time=1884.565..1899.176 rows=33 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 10kB
               Buffers: shared hit=14 read=66943
               ->  Subquery Scan on s  (cost=130444.19..130452.88 rows=33 width=12) (actual time=1884.535..1899.167 rows=33 loops=1)
                     Buffers: shared hit=14 read=66943
                     ->  Finalize GroupAggregate  (cost=130444.19..130452.55 rows=33 width=12) (actual time=1884.533..1899.162 rows=33 loops=1)
                           Group Key: e.dep_id
                           Buffers: shared hit=14 read=66943
                           ->  Gather Merge  (cost=130444.19..130451.89 rows=66 width=12) (actual time=1884.523..1899.145 rows=99 loops=1)
                                 Workers Planned: 2
                                 Workers Launched: 2
                                 Buffers: shared hit=14 read=66943
                                 ->  Sort  (cost=129444.16..129444.25 rows=33 width=12) (actual time=1868.457..1868.459 rows=33 loops=3)
                                       Sort Key: e.dep_id
                                       Sort Method: quicksort  Memory: 26kB
                                       Buffers: shared hit=14 read=66943
                                       Worker 0:  Sort Method: quicksort  Memory: 26kB
                                       Worker 1:  Sort Method: quicksort  Memory: 26kB
                                       ->  Partial HashAggregate  (cost=129443.00..129443.33 rows=33 width=12) (actual time=1868.428..1868.431 rows=33 loops=3)
                                             Group Key: e.dep_id
                                             Batches: 1  Memory Usage: 24kB
                                             Buffers: shared read=66943
                                             Worker 0:  Batches: 1  Memory Usage: 24kB
                                             Worker 1:  Batches: 1  Memory Usage: 24kB
                                             ->  Parallel Seq Scan on empregados e  (cost=0.00..108609.67 rows=4166667 width=8) (actual time=0.661..1470.865 rows=3333333 loops=3)
                                                   Buffers: shared read=66943
 Planning:
   Buffers: shared hit=81 read=23
 Planning Time: 9.519 ms
 JIT:
   Functions: 34
   Options: Inlining false, Optimization false, Expressions true, Deforming true
   Timing: Generation 4.246 ms, Inlining 0.000 ms, Optimization 9.783 ms, Emission 176.245 ms, Total 190.273 ms
 Execution Time: 2157.914 ms
(43 rows)

                                                                                    QUERY PLAN                                                                                     
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=130455.55..130455.63 rows=33 width=21) (actual time=1862.694..1877.868 rows=32 loops=1)
   Sort Key: s.sum
   Sort Method: quicksort  Memory: 27kB
   Buffers: shared hit=17 read=66944
   ->  Hash Join  (cost=130453.29..130454.72 rows=33 width=21) (actual time=1862.598..1877.776 rows=32 loops=1)
         Hash Cond: (d.dep_id = s.dep_id)
         Buffers: shared hit=14 read=66944
         ->  Seq Scan on departamentos d  (cost=0.00..1.33 rows=33 width=17) (actual time=0.430..0.432 rows=33 loops=1)
               Buffers: shared read=1
         ->  Hash  (cost=130452.88..130452.88 rows=33 width=12) (actual time=1862.128..1877.300 rows=33 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 10kB
               Buffers: shared hit=14 read=66943
               ->  Subquery Scan on s  (cost=130444.19..130452.88 rows=33 width=12) (actual time=1862.097..1877.289 rows=33 loops=1)
                     Buffers: shared hit=14 read=66943
                     ->  Finalize GroupAggregate  (cost=130444.19..130452.55 rows=33 width=12) (actual time=1862.094..1877.283 rows=33 loops=1)
                           Group Key: e.dep_id
                           Buffers: shared hit=14 read=66943
                           ->  Gather Merge  (cost=130444.19..130451.89 rows=66 width=12) (actual time=1862.083..1877.265 rows=99 loops=1)
                                 Workers Planned: 2
                                 Workers Launched: 2
                                 Buffers: shared hit=14 read=66943
                                 ->  Sort  (cost=129444.16..129444.25 rows=33 width=12) (actual time=1845.420..1845.422 rows=33 loops=3)
                                       Sort Key: e.dep_id
                                       Sort Method: quicksort  Memory: 26kB
                                       Buffers: shared hit=14 read=66943
                                       Worker 0:  Sort Method: quicksort  Memory: 26kB
                                       Worker 1:  Sort Method: quicksort  Memory: 26kB
                                       ->  Partial HashAggregate  (cost=129443.00..129443.33 rows=33 width=12) (actual time=1845.391..1845.394 rows=33 loops=3)
                                             Group Key: e.dep_id
                                             Batches: 1  Memory Usage: 24kB
                                             Buffers: shared read=66943
                                             Worker 0:  Batches: 1  Memory Usage: 24kB
                                             Worker 1:  Batches: 1  Memory Usage: 24kB
                                             ->  Parallel Seq Scan on empregados e  (cost=0.00..108609.67 rows=4166667 width=8) (actual time=0.649..1449.908 rows=3333333 loops=3)
                                                   Buffers: shared read=66943
 Planning:
   Buffers: shared hit=81 read=23
 Planning Time: 9.527 ms
 JIT:
   Functions: 34
   Options: Inlining false, Optimization false, Expressions true, Deforming true
   Timing: Generation 4.301 ms, Inlining 0.000 ms, Optimization 9.701 ms, Emission 173.175 ms, Total 187.176 ms
 Execution Time: 2138.669 ms
(43 rows)

