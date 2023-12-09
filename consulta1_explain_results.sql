-- 2023-12-08

-- script.sql :
-- EXPLAIN (analyse, costs, buffers,timing, wal) SELECT em.nome, em.salario, em.dep_id, avg AS avg_salary FROM (SELECT e.emp_id, e.dep_id, cast(AVG(salario) over(partition by dep_id) AS integer) FROM empregados e) s JOIN empregados em ON em.emp_id = s.emp_id WHERE em.salario >= s.AVG ORDER BY dep_id;

-- run.sh: (5x)
-- psql -U postgres -d dojo -h localhost -f script.sql >> c1_explain_results.sql
-- cat c1_explain_results.sql | grep "Execution Time"
-- sudo reboot now

                                                                       QUERY PLAN                                                                        
---------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=3231304.92..3239637.66 rows=3333094 width=19) (actual time=10623.602..10927.072 rows=5058367 loops=1)
   Sort Key: em.dep_id
   Sort Method: external merge  Disk: 154584kB
   Buffers: shared hit=35 read=133852, temp read=223581 written=203650
   ->  Hash Join  (cost=2021811.68..2733480.34 rows=3333094 width=19) (actual time=4245.697..9770.840 rows=5058367 loops=1)
         Hash Cond: (s.emp_id = em.emp_id)
         Join Filter: (em.salario >= s.avg)
         Rows Removed by Join Filter: 4941633
         Buffers: shared hit=32 read=133852, temp read=184936 written=164895
         ->  Subquery Scan on s  (cost=1671295.86..1971274.29 rows=9999281 width=8) (actual time=1919.895..5113.399 rows=10000000 loops=1)
               Buffers: shared hit=32 read=66910, temp read=100972 written=80931
               ->  WindowAgg  (cost=1671295.86..1871281.48 rows=9999281 width=12) (actual time=1919.894..4647.822 rows=10000000 loops=1)
                     Buffers: shared hit=32 read=66910, temp read=100972 written=80931
                     ->  Sort  (cost=1671295.86..1696294.06 rows=9999281 width=12) (actual time=1867.035..2457.653 rows=10000000 loops=1)
                           Sort Key: e.dep_id
                           Sort Method: external merge  Disk: 215352kB
                           Buffers: shared hit=32 read=66910, temp read=53833 written=54032
                           ->  Seq Scan on empregados e  (cost=0.00..166934.81 rows=9999281 width=12) (actual time=0.025..510.386 rows=10000000 loops=1)
                                 Buffers: shared hit=32 read=66910
         ->  Hash  (cost=166934.81..166934.81 rows=9999281 width=19) (actual time=2323.445..2323.445 rows=10000000 loops=1)
               Buckets: 131072  Batches: 128  Memory Usage: 5100kB
               Buffers: shared read=66942, temp written=49864
               ->  Seq Scan on empregados em  (cost=0.00..166934.81 rows=9999281 width=19) (actual time=353.852..1194.365 rows=10000000 loops=1)
                     Buffers: shared read=66942
 Planning:
   Buffers: shared hit=38 read=13
 Planning Time: 5.462 ms
 JIT:
   Functions: 18
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.643 ms, Inlining 81.856 ms, Optimization 157.157 ms, Emission 113.824 ms, Total 356.480 ms
 Execution Time: 11317.595 ms
(32 rows)

                                                                       QUERY PLAN                                                                        
---------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=3231304.92..3239637.66 rows=3333094 width=19) (actual time=10691.870..10996.536 rows=5058367 loops=1)
   Sort Key: em.dep_id
   Sort Method: external merge  Disk: 154584kB
   Buffers: shared hit=35 read=133852, temp read=223581 written=203650
   ->  Hash Join  (cost=2021811.68..2733480.34 rows=3333094 width=19) (actual time=4244.019..9838.994 rows=5058367 loops=1)
         Hash Cond: (s.emp_id = em.emp_id)
         Join Filter: (em.salario >= s.avg)
         Rows Removed by Join Filter: 4941633
         Buffers: shared hit=32 read=133852, temp read=184936 written=164895
         ->  Subquery Scan on s  (cost=1671295.86..1971274.29 rows=9999281 width=8) (actual time=1909.468..5127.948 rows=10000000 loops=1)
               Buffers: shared hit=32 read=66910, temp read=100972 written=80931
               ->  WindowAgg  (cost=1671295.86..1871281.48 rows=9999281 width=12) (actual time=1909.466..4654.107 rows=10000000 loops=1)
                     Buffers: shared hit=32 read=66910, temp read=100972 written=80931
                     ->  Sort  (cost=1671295.86..1696294.06 rows=9999281 width=12) (actual time=1856.645..2425.445 rows=10000000 loops=1)
                           Sort Key: e.dep_id
                           Sort Method: external merge  Disk: 215352kB
                           Buffers: shared hit=32 read=66910, temp read=53833 written=54032
                           ->  Seq Scan on empregados e  (cost=0.00..166934.81 rows=9999281 width=12) (actual time=0.026..510.806 rows=10000000 loops=1)
                                 Buffers: shared hit=32 read=66910
         ->  Hash  (cost=166934.81..166934.81 rows=9999281 width=19) (actual time=2332.162..2332.163 rows=10000000 loops=1)
               Buckets: 131072  Batches: 128  Memory Usage: 5100kB
               Buffers: shared read=66942, temp written=49864
               ->  Seq Scan on empregados em  (cost=0.00..166934.81 rows=9999281 width=19) (actual time=357.350..1212.020 rows=10000000 loops=1)
                     Buffers: shared read=66942
 Planning:
   Buffers: shared hit=38 read=13
 Planning Time: 6.557 ms
 JIT:
   Functions: 18
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.695 ms, Inlining 81.781 ms, Optimization 133.326 ms, Emission 141.270 ms, Total 360.072 ms
 Execution Time: 11401.590 ms
(32 rows)

                                                                       QUERY PLAN                                                                        
---------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=3231304.92..3239637.66 rows=3333094 width=19) (actual time=10420.260..10730.376 rows=5058367 loops=1)
   Sort Key: em.dep_id
   Sort Method: external merge  Disk: 154584kB
   Buffers: shared hit=35 read=133852, temp read=223581 written=203650
   ->  Hash Join  (cost=2021811.68..2733480.34 rows=3333094 width=19) (actual time=4198.213..9580.292 rows=5058367 loops=1)
         Hash Cond: (s.emp_id = em.emp_id)
         Join Filter: (em.salario >= s.avg)
         Rows Removed by Join Filter: 4941633
         Buffers: shared hit=32 read=133852, temp read=184936 written=164895
         ->  Subquery Scan on s  (cost=1671295.86..1971274.29 rows=9999281 width=8) (actual time=1899.542..5006.750 rows=10000000 loops=1)
               Buffers: shared hit=32 read=66910, temp read=100972 written=80931
               ->  WindowAgg  (cost=1671295.86..1871281.48 rows=9999281 width=12) (actual time=1899.539..4565.005 rows=10000000 loops=1)
                     Buffers: shared hit=32 read=66910, temp read=100972 written=80931
                     ->  Sort  (cost=1671295.86..1696294.06 rows=9999281 width=12) (actual time=1848.620..2392.099 rows=10000000 loops=1)
                           Sort Key: e.dep_id
                           Sort Method: external merge  Disk: 215352kB
                           Buffers: shared hit=32 read=66910, temp read=53833 written=54032
                           ->  Seq Scan on empregados e  (cost=0.00..166934.81 rows=9999281 width=12) (actual time=0.024..520.798 rows=10000000 loops=1)
                                 Buffers: shared hit=32 read=66910
         ->  Hash  (cost=166934.81..166934.81 rows=9999281 width=19) (actual time=2296.196..2296.197 rows=10000000 loops=1)
               Buckets: 131072  Batches: 128  Memory Usage: 5100kB
               Buffers: shared read=66942, temp written=49864
               ->  Seq Scan on empregados em  (cost=0.00..166934.81 rows=9999281 width=19) (actual time=309.831..1172.530 rows=10000000 loops=1)
                     Buffers: shared read=66942
 Planning:
   Buffers: shared hit=38 read=13
 Planning Time: 5.154 ms
 JIT:
   Functions: 18
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.739 ms, Inlining 73.223 ms, Optimization 132.027 ms, Emission 103.656 ms, Total 312.645 ms
 Execution Time: 11123.518 ms
(32 rows)

                                                                       QUERY PLAN                                                                        
---------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=3231304.92..3239637.66 rows=3333094 width=19) (actual time=10413.278..10714.209 rows=5058367 loops=1)
   Sort Key: em.dep_id
   Sort Method: external merge  Disk: 154584kB
   Buffers: shared hit=35 read=133852, temp read=223581 written=203650
   ->  Hash Join  (cost=2021811.68..2733480.34 rows=3333094 width=19) (actual time=4229.007..9582.505 rows=5058367 loops=1)
         Hash Cond: (s.emp_id = em.emp_id)
         Join Filter: (em.salario >= s.avg)
         Rows Removed by Join Filter: 4941633
         Buffers: shared hit=32 read=133852, temp read=184936 written=164895
         ->  Subquery Scan on s  (cost=1671295.86..1971274.29 rows=9999281 width=8) (actual time=1889.915..4990.814 rows=10000000 loops=1)
               Buffers: shared hit=32 read=66910, temp read=100972 written=80931
               ->  WindowAgg  (cost=1671295.86..1871281.48 rows=9999281 width=12) (actual time=1889.913..4556.635 rows=10000000 loops=1)
                     Buffers: shared hit=32 read=66910, temp read=100972 written=80931
                     ->  Sort  (cost=1671295.86..1696294.06 rows=9999281 width=12) (actual time=1838.657..2378.347 rows=10000000 loops=1)
                           Sort Key: e.dep_id
                           Sort Method: external merge  Disk: 215352kB
                           Buffers: shared hit=32 read=66910, temp read=53833 written=54032
                           ->  Seq Scan on empregados e  (cost=0.00..166934.81 rows=9999281 width=12) (actual time=0.024..506.928 rows=10000000 loops=1)
                                 Buffers: shared hit=32 read=66910
         ->  Hash  (cost=166934.81..166934.81 rows=9999281 width=19) (actual time=2336.726..2336.727 rows=10000000 loops=1)
               Buckets: 131072  Batches: 128  Memory Usage: 5100kB
               Buffers: shared read=66942, temp written=49864
               ->  Seq Scan on empregados em  (cost=0.00..166934.81 rows=9999281 width=19) (actual time=374.031..1212.434 rows=10000000 loops=1)
                     Buffers: shared read=66942
 Planning:
   Buffers: shared hit=38 read=13
 Planning Time: 6.608 ms
 JIT:
   Functions: 18
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.711 ms, Inlining 80.097 ms, Optimization 142.518 ms, Emission 150.389 ms, Total 376.714 ms
 Execution Time: 11106.900 ms
(32 rows)

                                                                       QUERY PLAN                                                                        
---------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=3231304.92..3239637.66 rows=3333094 width=19) (actual time=10559.292..10865.715 rows=5058367 loops=1)
   Sort Key: em.dep_id
   Sort Method: external merge  Disk: 154584kB
   Buffers: shared hit=35 read=133852, temp read=223581 written=203650
   ->  Hash Join  (cost=2021811.68..2733480.34 rows=3333094 width=19) (actual time=4208.523..9717.991 rows=5058367 loops=1)
         Hash Cond: (s.emp_id = em.emp_id)
         Join Filter: (em.salario >= s.avg)
         Rows Removed by Join Filter: 4941633
         Buffers: shared hit=32 read=133852, temp read=184936 written=164895
         ->  Subquery Scan on s  (cost=1671295.86..1971274.29 rows=9999281 width=8) (actual time=1887.546..5128.424 rows=10000000 loops=1)
               Buffers: shared hit=32 read=66910, temp read=100972 written=80931
               ->  WindowAgg  (cost=1671295.86..1871281.48 rows=9999281 width=12) (actual time=1887.540..4667.480 rows=10000000 loops=1)
                     Buffers: shared hit=32 read=66910, temp read=100972 written=80931
                     ->  Sort  (cost=1671295.86..1696294.06 rows=9999281 width=12) (actual time=1835.785..2422.243 rows=10000000 loops=1)
                           Sort Key: e.dep_id
                           Sort Method: external merge  Disk: 215352kB
                           Buffers: shared hit=32 read=66910, temp read=53833 written=54032
                           ->  Seq Scan on empregados e  (cost=0.00..166934.81 rows=9999281 width=12) (actual time=0.025..507.901 rows=10000000 loops=1)
                                 Buffers: shared hit=32 read=66910
         ->  Hash  (cost=166934.81..166934.81 rows=9999281 width=19) (actual time=2318.613..2318.614 rows=10000000 loops=1)
               Buckets: 131072  Batches: 128  Memory Usage: 5100kB
               Buffers: shared read=66942, temp written=49864
               ->  Seq Scan on empregados em  (cost=0.00..166934.81 rows=9999281 width=19) (actual time=371.752..1210.947 rows=10000000 loops=1)
                     Buffers: shared read=66942
 Planning:
   Buffers: shared hit=38 read=13
 Planning Time: 6.604 ms
 JIT:
   Functions: 18
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.679 ms, Inlining 82.074 ms, Optimization 143.092 ms, Emission 145.556 ms, Total 374.402 ms
 Execution Time: 11269.210 ms
(32 rows)

