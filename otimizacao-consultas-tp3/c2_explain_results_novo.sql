
                                                                          QUERY PLAN                                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 WindowAgg  (cost=0.43..626344.94 rows=10000000 width=19) (actual time=414.896..4100.432 rows=10000000 loops=1)
   Buffers: shared read=75364
   ->  Index Scan using dep_id_empregados on empregados e  (cost=0.43..451344.94 rows=10000000 width=15) (actual time=328.523..1672.519 rows=10000000 loops=1)
         Buffers: shared read=75364
 Planning:
   Buffers: shared hit=49 read=18
 Planning Time: 6.354 ms
 JIT:
   Functions: 7
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.031 ms, Inlining 77.080 ms, Optimization 117.265 ms, Emission 132.128 ms, Total 329.503 ms
 Execution Time: 4576.916 ms
(12 rows)

                                                                          QUERY PLAN                                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 WindowAgg  (cost=0.43..626344.94 rows=10000000 width=19) (actual time=381.742..4239.487 rows=10000000 loops=1)
   Buffers: shared read=75364
   ->  Index Scan using dep_id_empregados on empregados e  (cost=0.43..451344.94 rows=10000000 width=15) (actual time=288.778..1673.541 rows=10000000 loops=1)
         Buffers: shared read=75364
 Planning:
   Buffers: shared hit=44 read=18
 Planning Time: 7.811 ms
 JIT:
   Functions: 7
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.046 ms, Inlining 76.979 ms, Optimization 118.004 ms, Emission 91.791 ms, Total 289.820 ms
 Execution Time: 4711.488 ms
(12 rows)

                                                                          QUERY PLAN                                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 WindowAgg  (cost=0.43..626344.94 rows=10000000 width=19) (actual time=395.108..4252.088 rows=10000000 loops=1)
   Buffers: shared read=75364
   ->  Index Scan using dep_id_empregados on empregados e  (cost=0.43..451344.94 rows=10000000 width=15) (actual time=297.577..1647.454 rows=10000000 loops=1)
         Buffers: shared read=75364
 Planning:
   Buffers: shared hit=44 read=18
 Planning Time: 9.110 ms
 JIT:
   Functions: 7
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.047 ms, Inlining 84.697 ms, Optimization 116.998 ms, Emission 93.880 ms, Total 298.622 ms
 Execution Time: 4739.354 ms
(12 rows)

                                                                          QUERY PLAN                                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 WindowAgg  (cost=0.43..626344.94 rows=10000000 width=19) (actual time=382.963..4248.053 rows=10000000 loops=1)
   Buffers: shared read=75364
   ->  Index Scan using dep_id_empregados on empregados e  (cost=0.43..451344.94 rows=10000000 width=15) (actual time=279.110..1660.997 rows=10000000 loops=1)
         Buffers: shared read=75364
 Planning:
   Buffers: shared hit=44 read=18
 Planning Time: 9.051 ms
 JIT:
   Functions: 7
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.006 ms, Inlining 40.707 ms, Optimization 114.410 ms, Emission 122.345 ms, Total 280.468 ms
 Execution Time: 4736.044 ms
(12 rows)

                                                                          QUERY PLAN                                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 WindowAgg  (cost=0.43..626344.94 rows=10000000 width=19) (actual time=414.439..4260.571 rows=10000000 loops=1)
   Buffers: shared read=75364
   ->  Index Scan using dep_id_empregados on empregados e  (cost=0.43..451344.94 rows=10000000 width=15) (actual time=327.921..1716.591 rows=10000000 loops=1)
         Buffers: shared read=75364
 Planning:
   Buffers: shared hit=44 read=18
 Planning Time: 7.837 ms
 JIT:
   Functions: 7
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 2.901 ms, Inlining 82.653 ms, Optimization 116.748 ms, Emission 126.764 ms, Total 329.066 ms
 Execution Time: 4742.907 ms
(11 rows)
