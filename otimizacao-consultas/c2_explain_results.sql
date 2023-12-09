
                                                                QUERY PLAN                                                                 
-------------------------------------------------------------------------------------------------------------------------------------------
 WindowAgg  (cost=1671419.83..1871419.83 rows=10000000 width=19) (actual time=2627.818..5396.625 rows=10000000 loops=1)
   Buffers: shared hit=3 read=66942, temp read=126165 written=100069
   ->  Sort  (cost=1671419.83..1696419.83 rows=10000000 width=15) (actual time=2573.321..3189.789 rows=10000000 loops=1)
         Sort Key: dep_id
         Sort Method: external merge  Disk: 266432kB
         Buffers: shared hit=3 read=66942, temp read=66603 written=66808
         ->  Seq Scan on empregados e  (cost=0.00..166942.00 rows=10000000 width=15) (actual time=312.972..1007.796 rows=10000000 loops=1)
               Buffers: shared read=66942
 Planning:
   Buffers: shared hit=36 read=15 dirtied=1
 Planning Time: 6.148 ms
 JIT:
   Functions: 7
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 2.860 ms, Inlining 76.089 ms, Optimization 113.852 ms, Emission 121.855 ms, Total 314.656 ms
 Execution Time: 5911.693 ms
(16 rows)

                                                                QUERY PLAN                                                                 
-------------------------------------------------------------------------------------------------------------------------------------------
 WindowAgg  (cost=1671419.83..1871419.83 rows=10000000 width=19) (actual time=2729.602..5458.412 rows=10000000 loops=1)
   Buffers: shared hit=3 read=66942, temp read=126165 written=100069
   ->  Sort  (cost=1671419.83..1696419.83 rows=10000000 width=15) (actual time=2675.435..3240.177 rows=10000000 loops=1)
         Sort Key: dep_id
         Sort Method: external merge  Disk: 266432kB
         Buffers: shared hit=3 read=66942, temp read=66603 written=66808
         ->  Seq Scan on empregados e  (cost=0.00..166942.00 rows=10000000 width=15) (actual time=259.534..1083.285 rows=10000000 loops=1)
               Buffers: shared read=66942
 Planning:
   Buffers: shared hit=34 read=15
 Planning Time: 7.634 ms
 JIT:
   Functions: 7
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 2.886 ms, Inlining 81.227 ms, Optimization 85.956 ms, Emission 91.271 ms, Total 261.340 ms
 Execution Time: 5971.095 ms
(16 rows)

                                                                QUERY PLAN                                                                 
-------------------------------------------------------------------------------------------------------------------------------------------
 WindowAgg  (cost=1671419.83..1871419.83 rows=10000000 width=19) (actual time=2666.069..5378.391 rows=10000000 loops=1)
   Buffers: shared hit=3 read=66942, temp read=126165 written=100069
   ->  Sort  (cost=1671419.83..1696419.83 rows=10000000 width=15) (actual time=2612.364..3181.275 rows=10000000 loops=1)
         Sort Key: dep_id
         Sort Method: external merge  Disk: 266432kB
         Buffers: shared hit=3 read=66942, temp read=66603 written=66808
         ->  Seq Scan on empregados e  (cost=0.00..166942.00 rows=10000000 width=15) (actual time=339.734..1046.274 rows=10000000 loops=1)
               Buffers: shared read=66942
 Planning:
   Buffers: shared hit=34 read=15
 Planning Time: 5.121 ms
 JIT:
   Functions: 7
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.074 ms, Inlining 77.248 ms, Optimization 134.201 ms, Emission 127.039 ms, Total 341.562 ms
 Execution Time: 5887.988 ms
(16 rows)

                                                                QUERY PLAN                                                                 
-------------------------------------------------------------------------------------------------------------------------------------------
 WindowAgg  (cost=1671419.83..1871419.83 rows=10000000 width=19) (actual time=2741.388..5417.150 rows=10000000 loops=1)
   Buffers: shared hit=3 read=66942, temp read=126165 written=100069
   ->  Sort  (cost=1671419.83..1696419.83 rows=10000000 width=15) (actual time=2688.493..3246.009 rows=10000000 loops=1)
         Sort Key: dep_id
         Sort Method: external merge  Disk: 266432kB
         Buffers: shared hit=3 read=66942, temp read=66603 written=66808
         ->  Seq Scan on empregados e  (cost=0.00..166942.00 rows=10000000 width=15) (actual time=312.833..1114.436 rows=10000000 loops=1)
               Buffers: shared read=66942
 Planning:
   Buffers: shared hit=34 read=15
 Planning Time: 6.490 ms
 JIT:
   Functions: 7
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 2.967 ms, Inlining 79.230 ms, Optimization 124.806 ms, Emission 107.632 ms, Total 314.635 ms
 Execution Time: 5918.717 ms
(16 rows)

                                                                QUERY PLAN                                                                 
-------------------------------------------------------------------------------------------------------------------------------------------
 WindowAgg  (cost=1671419.83..1871419.83 rows=10000000 width=19) (actual time=2641.943..5377.822 rows=10000000 loops=1)
   Buffers: shared hit=3 read=66942, temp read=126165 written=100069
   ->  Sort  (cost=1671419.83..1696419.83 rows=10000000 width=15) (actual time=2587.805..3165.160 rows=10000000 loops=1)
         Sort Key: dep_id
         Sort Method: external merge  Disk: 266432kB
         Buffers: shared hit=3 read=66942, temp read=66603 written=66808
         ->  Seq Scan on empregados e  (cost=0.00..166942.00 rows=10000000 width=15) (actual time=326.204..1020.563 rows=10000000 loops=1)
               Buffers: shared read=66942
 Planning:
   Buffers: shared hit=34 read=15
 Planning Time: 6.475 ms
 JIT:
   Functions: 7
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.258 ms, Inlining 78.673 ms, Optimization 117.877 ms, Emission 128.468 ms, Total 328.276 ms
 Execution Time: 5888.053 ms
(16 rows)

