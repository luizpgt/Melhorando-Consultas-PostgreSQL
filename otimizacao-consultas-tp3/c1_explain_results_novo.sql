
                                                                                QUERY PLAN                                                                                 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1428491.63..1436824.97 rows=3333333 width=19) (actual time=8500.052..8632.831 rows=5058367 loops=1)
   Sort Key: em.dep_id
   Sort Method: quicksort  Memory: 512442kB
   Buffers: shared hit=66946 read=75364
   ->  Hash Join  (cost=291943.43..1067349.44 rows=3333333 width=19) (actual time=2932.678..7984.458 rows=5058367 loops=1)
         Hash Cond: (e.emp_id = em.emp_id)
         Join Filter: (em.salario >= ((avg(e.salario) OVER (?))::integer))
         Rows Removed by Join Filter: 4941633
         Buffers: shared hit=66943 read=75364
         ->  WindowAgg  (cost=0.43..400406.43 rows=10000000 width=12) (actual time=471.004..3534.853 rows=10000000 loops=1)
               Buffers: shared hit=64913 read=10451
               ->  Index Scan using dep_id_empregados on empregados e  (cost=0.43..225406.43 rows=10000000 width=12) (actual time=371.782..1348.188 rows=10000000 loops=1)
                     Buffers: shared hit=64913 read=10451
         ->  Hash  (cost=166943.00..166943.00 rows=10000000 width=19) (actual time=2450.239..2450.240 rows=10000000 loops=1)
               Buckets: 16777216  Batches: 1  Memory Usage: 650827kB
               Buffers: shared hit=2030 read=64913
               ->  Seq Scan on empregados em  (cost=0.00..166943.00 rows=10000000 width=19) (actual time=0.022..791.626 rows=10000000 loops=1)
                     Buffers: shared hit=2030 read=64913
 Planning:
   Buffers: shared hit=59 read=18
 Planning Time: 8.579 ms
 JIT:
   Functions: 17
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.572 ms, Inlining 81.910 ms, Optimization 140.594 ms, Emission 147.315 ms, Total 373.391 ms
 Execution Time: 9022.608 ms
(26 rows)

                                                                                QUERY PLAN                                                                                 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1428491.63..1436824.97 rows=3333333 width=19) (actual time=8507.101..8636.656 rows=5058367 loops=1)
   Sort Key: em.dep_id
   Sort Method: quicksort  Memory: 512442kB
   Buffers: shared hit=66946 read=75364
   ->  Hash Join  (cost=291943.43..1067349.44 rows=3333333 width=19) (actual time=2914.519..7993.009 rows=5058367 loops=1)
         Hash Cond: (e.emp_id = em.emp_id)
         Join Filter: (em.salario >= ((avg(e.salario) OVER (?))::integer))
         Rows Removed by Join Filter: 4941633
         Buffers: shared hit=66943 read=75364
         ->  WindowAgg  (cost=0.43..400406.43 rows=10000000 width=12) (actual time=454.391..3540.403 rows=10000000 loops=1)
               Buffers: shared hit=64913 read=10451
               ->  Index Scan using dep_id_empregados on empregados e  (cost=0.43..225406.43 rows=10000000 width=12) (actual time=371.332..1362.144 rows=10000000 loops=1)
                     Buffers: shared hit=64913 read=10451
         ->  Hash  (cost=166943.00..166943.00 rows=10000000 width=19) (actual time=2449.452..2449.453 rows=10000000 loops=1)
               Buckets: 16777216  Batches: 1  Memory Usage: 650827kB
               Buffers: shared hit=2030 read=64913
               ->  Seq Scan on empregados em  (cost=0.00..166943.00 rows=10000000 width=19) (actual time=0.021..789.047 rows=10000000 loops=1)
                     Buffers: shared hit=2030 read=64913
 Planning:
   Buffers: shared hit=59 read=18
 Planning Time: 8.554 ms
 JIT:
   Functions: 17
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.592 ms, Inlining 78.891 ms, Optimization 140.426 ms, Emission 150.312 ms, Total 373.220 ms
 Execution Time: 9018.117 ms
(26 rows)

                                                                                QUERY PLAN                                                                                 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1428491.63..1436824.97 rows=3333333 width=19) (actual time=8569.163..8700.767 rows=5058367 loops=1)
   Sort Key: em.dep_id
   Sort Method: quicksort  Memory: 512442kB
   Buffers: shared hit=66946 read=75364
   ->  Hash Join  (cost=291943.43..1067349.44 rows=3333333 width=19) (actual time=2923.438..8042.249 rows=5058367 loops=1)
         Hash Cond: (e.emp_id = em.emp_id)
         Join Filter: (em.salario >= ((avg(e.salario) OVER (?))::integer))
         Rows Removed by Join Filter: 4941633
         Buffers: shared hit=66943 read=75364
         ->  WindowAgg  (cost=0.43..400406.43 rows=10000000 width=12) (actual time=436.855..3527.680 rows=10000000 loops=1)
               Buffers: shared hit=64913 read=10451
               ->  Index Scan using dep_id_empregados on empregados e  (cost=0.43..225406.43 rows=10000000 width=12) (actual time=354.501..1321.492 rows=10000000 loops=1)
                     Buffers: shared hit=64913 read=10451
         ->  Hash  (cost=166943.00..166943.00 rows=10000000 width=19) (actual time=2475.684..2475.685 rows=10000000 loops=1)
               Buckets: 16777216  Batches: 1  Memory Usage: 650827kB
               Buffers: shared hit=2030 read=64913
               ->  Seq Scan on empregados em  (cost=0.00..166943.00 rows=10000000 width=19) (actual time=0.022..790.949 rows=10000000 loops=1)
                     Buffers: shared hit=2030 read=64913
 Planning:
   Buffers: shared hit=59 read=18
 Planning Time: 10.095 ms
 JIT:
   Functions: 17
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.569 ms, Inlining 76.883 ms, Optimization 134.931 ms, Emission 140.889 ms, Total 356.271 ms
 Execution Time: 9098.693 ms
(26 rows)

                                                                                QUERY PLAN                                                                                 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1428491.63..1436824.97 rows=3333333 width=19) (actual time=8466.530..8595.920 rows=5058367 loops=1)
   Sort Key: em.dep_id
   Sort Method: quicksort  Memory: 512442kB
   Buffers: shared hit=66946 read=75364
   ->  Hash Join  (cost=291943.43..1067349.44 rows=3333333 width=19) (actual time=2911.513..7948.961 rows=5058367 loops=1)
         Hash Cond: (e.emp_id = em.emp_id)
         Join Filter: (em.salario >= ((avg(e.salario) OVER (?))::integer))
         Rows Removed by Join Filter: 4941633
         Buffers: shared hit=66943 read=75364
         ->  WindowAgg  (cost=0.43..400406.43 rows=10000000 width=12) (actual time=455.122..3501.395 rows=10000000 loops=1)
               Buffers: shared hit=64913 read=10451
               ->  Index Scan using dep_id_empregados on empregados e  (cost=0.43..225406.43 rows=10000000 width=12) (actual time=354.454..1316.740 rows=10000000 loops=1)
                     Buffers: shared hit=64913 read=10451
         ->  Hash  (cost=166943.00..166943.00 rows=10000000 width=19) (actual time=2445.330..2445.330 rows=10000000 loops=1)
               Buckets: 16777216  Batches: 1  Memory Usage: 650827kB
               Buffers: shared hit=2030 read=64913
               ->  Seq Scan on empregados em  (cost=0.00..166943.00 rows=10000000 width=19) (actual time=0.021..783.590 rows=10000000 loops=1)
                     Buffers: shared hit=2030 read=64913
 Planning:
   Buffers: shared hit=59 read=18
 Planning Time: 8.520 ms
 JIT:
   Functions: 17
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.549 ms, Inlining 78.245 ms, Optimization 139.562 ms, Emission 134.696 ms, Total 356.053 ms
 Execution Time: 8977.171 ms
(26 rows)

                                                                                QUERY PLAN                                                                                 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1428491.63..1436824.97 rows=3333333 width=19) (actual time=8505.781..8637.540 rows=5058367 loops=1)
   Sort Key: em.dep_id
   Sort Method: quicksort  Memory: 512442kB
   Buffers: shared hit=66946 read=75364
   ->  Hash Join  (cost=291943.43..1067349.44 rows=3333333 width=19) (actual time=2915.755..7989.509 rows=5058367 loops=1)
         Hash Cond: (e.emp_id = em.emp_id)
         Join Filter: (em.salario >= ((avg(e.salario) OVER (?))::integer))
         Rows Removed by Join Filter: 4941633
         Buffers: shared hit=66943 read=75364
         ->  WindowAgg  (cost=0.43..400406.43 rows=10000000 width=12) (actual time=454.577..3532.303 rows=10000000 loops=1)
               Buffers: shared hit=64913 read=10451
               ->  Index Scan using dep_id_empregados on empregados e  (cost=0.43..225406.43 rows=10000000 width=12) (actual time=371.747..1339.111 rows=10000000 loops=1)
                     Buffers: shared hit=64913 read=10451
         ->  Hash  (cost=166943.00..166943.00 rows=10000000 width=19) (actual time=2449.757..2449.758 rows=10000000 loops=1)
               Buckets: 16777216  Batches: 1  Memory Usage: 650827kB
               Buffers: shared hit=2030 read=64913
               ->  Seq Scan on empregados em  (cost=0.00..166943.00 rows=10000000 width=19) (actual time=0.021..790.621 rows=10000000 loops=1)
                     Buffers: shared hit=2030 read=64913
 Planning:
   Buffers: shared hit=59 read=18
 Planning Time: 8.700 ms
 JIT:
   Functions: 17
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.589 ms, Inlining 85.696 ms, Optimization 141.324 ms, Emission 142.753 ms, Total 373.363 ms
 Execution Time: 9040.836 ms
(26 rows)

