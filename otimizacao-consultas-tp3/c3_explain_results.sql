
                                                                          QUERY PLAN                                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1975815.06..1975819.51 rows=1780 width=25) (actual time=7282.681..7282.684 rows=32 loops=1)
   Sort Key: (sum(e.salario) OVER (?))
   Sort Method: quicksort  Memory: 27kB
   Buffers: shared hit=3 read=66944, temp read=111693 written=102850
   ->  HashAggregate  (cost=1975701.16..1975718.96 rows=1780 width=25) (actual time=7282.609..7282.618 rows=32 loops=1)
         Group Key: sum(e.salario) OVER (?), d.nome
         Batches: 1  Memory Usage: 73kB
         Buffers: shared read=66944, temp read=111693 written=102850
         ->  WindowAgg  (cost=1603061.00..1925701.16 rows=10000000 width=25) (actual time=2478.363..6440.530 rows=9696700 loops=1)
               Buffers: shared read=66944, temp read=111693 written=102850
               ->  Merge Join  (cost=1603061.00..1775701.16 rows=10000000 width=21) (actual time=2372.801..4294.825 rows=9696700 loops=1)
                     Merge Cond: (d.dep_id = e.dep_id)
                     Buffers: shared read=66944, temp read=43418 written=65534
                     ->  Sort  (cost=2.16..2.24 rows=33 width=17) (actual time=345.376..345.386 rows=33 loops=1)
                           Sort Key: d.dep_id
                           Sort Method: quicksort  Memory: 26kB
                           Buffers: shared read=1
                           ->  Seq Scan on departamentos d  (cost=0.00..1.33 rows=33 width=17) (actual time=345.335..345.340 rows=33 loops=1)
                                 Buffers: shared read=1
                     ->  Materialize  (cost=1603058.83..1653058.83 rows=10000000 width=8) (actual time=2027.398..3319.963 rows=9696701 loops=1)
                           Buffers: shared read=66943, temp read=43418 written=65534
                           ->  Sort  (cost=1603058.83..1628058.83 rows=10000000 width=8) (actual time=2027.394..2575.328 rows=9696701 loops=1)
                                 Sort Key: e.dep_id
                                 Sort Method: external merge  Disk: 176200kB
                                 Buffers: shared read=66943, temp read=43418 written=44228
                                 ->  Seq Scan on empregados e  (cost=0.00..166943.00 rows=10000000 width=8) (actual time=1.031..849.263 rows=10000000 loops=1)
                                       Buffers: shared read=66943
 Planning:
   Buffers: shared hit=76 read=19 dirtied=1
 Planning Time: 7.643 ms
 JIT:
   Functions: 21
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 4.187 ms, Inlining 81.704 ms, Optimization 149.313 ms, Emission 113.951 ms, Total 349.155 ms
 Execution Time: 7564.615 ms
(35 rows)

                                                                          QUERY PLAN                                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1975815.06..1975819.51 rows=1780 width=25) (actual time=7001.707..7001.709 rows=32 loops=1)
   Sort Key: (sum(e.salario) OVER (?))
   Sort Method: quicksort  Memory: 27kB
   Buffers: shared hit=3 read=66944, temp read=111693 written=102850
   ->  HashAggregate  (cost=1975701.16..1975718.96 rows=1780 width=25) (actual time=7001.642..7001.650 rows=32 loops=1)
         Group Key: sum(e.salario) OVER (?), d.nome
         Batches: 1  Memory Usage: 73kB
         Buffers: shared read=66944, temp read=111693 written=102850
         ->  WindowAgg  (cost=1603061.00..1925701.16 rows=10000000 width=25) (actual time=2327.973..6166.475 rows=9696700 loops=1)
               Buffers: shared read=66944, temp read=111693 written=102850
               ->  Merge Join  (cost=1603061.00..1775701.16 rows=10000000 width=21) (actual time=2225.741..4063.444 rows=9696700 loops=1)
                     Merge Cond: (d.dep_id = e.dep_id)
                     Buffers: shared read=66944, temp read=43418 written=65534
                     ->  Sort  (cost=2.16..2.24 rows=33 width=17) (actual time=318.652..318.663 rows=33 loops=1)
                           Sort Key: d.dep_id
                           Sort Method: quicksort  Memory: 26kB
                           Buffers: shared read=1
                           ->  Seq Scan on departamentos d  (cost=0.00..1.33 rows=33 width=17) (actual time=318.618..318.623 rows=33 loops=1)
                                 Buffers: shared read=1
                     ->  Materialize  (cost=1603058.83..1653058.83 rows=10000000 width=8) (actual time=1907.062..3133.516 rows=9696701 loops=1)
                           Buffers: shared read=66943, temp read=43418 written=65534
                           ->  Sort  (cost=1603058.83..1628058.83 rows=10000000 width=8) (actual time=1907.060..2418.311 rows=9696701 loops=1)
                                 Sort Key: e.dep_id
                                 Sort Method: external merge  Disk: 176200kB
                                 Buffers: shared read=66943, temp read=43418 written=44228
                                 ->  Seq Scan on empregados e  (cost=0.00..166943.00 rows=10000000 width=8) (actual time=0.793..759.557 rows=10000000 loops=1)
                                       Buffers: shared read=66943
 Planning:
   Buffers: shared hit=72 read=19
 Planning Time: 8.895 ms
 JIT:
   Functions: 21
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 4.092 ms, Inlining 76.020 ms, Optimization 136.173 ms, Emission 106.027 ms, Total 322.311 ms
 Execution Time: 7284.495 ms
(35 rows)

                                                                          QUERY PLAN                                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1975815.06..1975819.51 rows=1780 width=25) (actual time=7151.187..7151.190 rows=32 loops=1)
   Sort Key: (sum(e.salario) OVER (?))
   Sort Method: quicksort  Memory: 27kB
   Buffers: shared hit=3 read=66944, temp read=111693 written=102850
   ->  HashAggregate  (cost=1975701.16..1975718.96 rows=1780 width=25) (actual time=7151.115..7151.123 rows=32 loops=1)
         Group Key: sum(e.salario) OVER (?), d.nome
         Batches: 1  Memory Usage: 73kB
         Buffers: shared read=66944, temp read=111693 written=102850
         ->  WindowAgg  (cost=1603061.00..1925701.16 rows=10000000 width=25) (actual time=2390.990..6302.740 rows=9696700 loops=1)
               Buffers: shared read=66944, temp read=111693 written=102850
               ->  Merge Join  (cost=1603061.00..1775701.16 rows=10000000 width=21) (actual time=2286.211..4180.149 rows=9696700 loops=1)
                     Merge Cond: (d.dep_id = e.dep_id)
                     Buffers: shared read=66944, temp read=43418 written=65534
                     ->  Sort  (cost=2.16..2.24 rows=33 width=17) (actual time=372.838..372.848 rows=33 loops=1)
                           Sort Key: d.dep_id
                           Sort Method: quicksort  Memory: 26kB
                           Buffers: shared read=1
                           ->  Seq Scan on departamentos d  (cost=0.00..1.33 rows=33 width=17) (actual time=372.797..372.802 rows=33 loops=1)
                                 Buffers: shared read=1
                     ->  Materialize  (cost=1603058.83..1653058.83 rows=10000000 width=8) (actual time=1913.347..3175.761 rows=9696701 loops=1)
                           Buffers: shared read=66943, temp read=43418 written=65534
                           ->  Sort  (cost=1603058.83..1628058.83 rows=10000000 width=8) (actual time=1913.341..2432.372 rows=9696701 loops=1)
                                 Sort Key: e.dep_id
                                 Sort Method: external merge  Disk: 176200kB
                                 Buffers: shared read=66943, temp read=43418 written=44228
                                 ->  Seq Scan on empregados e  (cost=0.00..166943.00 rows=10000000 width=8) (actual time=0.989..758.961 rows=10000000 loops=1)
                                       Buffers: shared read=66943
 Planning:
   Buffers: shared hit=72 read=19
 Planning Time: 7.582 ms
 JIT:
   Functions: 21
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 4.395 ms, Inlining 81.434 ms, Optimization 142.969 ms, Emission 147.945 ms, Total 376.744 ms
 Execution Time: 7455.624 ms
(35 rows)

                                                                          QUERY PLAN                                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1975815.06..1975819.51 rows=1780 width=25) (actual time=7255.497..7255.499 rows=32 loops=1)
   Sort Key: (sum(e.salario) OVER (?))
   Sort Method: quicksort  Memory: 27kB
   Buffers: shared hit=3 read=66944, temp read=111693 written=102850
   ->  HashAggregate  (cost=1975701.16..1975718.96 rows=1780 width=25) (actual time=7255.419..7255.427 rows=32 loops=1)
         Group Key: sum(e.salario) OVER (?), d.nome
         Batches: 1  Memory Usage: 73kB
         Buffers: shared read=66944, temp read=111693 written=102850
         ->  WindowAgg  (cost=1603061.00..1925701.16 rows=10000000 width=25) (actual time=2559.139..6416.297 rows=9696700 loops=1)
               Buffers: shared read=66944, temp read=111693 written=102850
               ->  Merge Join  (cost=1603061.00..1775701.16 rows=10000000 width=21) (actual time=2456.385..4328.691 rows=9696700 loops=1)
                     Merge Cond: (d.dep_id = e.dep_id)
                     Buffers: shared read=66944, temp read=43418 written=65534
                     ->  Sort  (cost=2.16..2.24 rows=33 width=17) (actual time=378.453..378.464 rows=33 loops=1)
                           Sort Key: d.dep_id
                           Sort Method: quicksort  Memory: 26kB
                           Buffers: shared read=1
                           ->  Seq Scan on departamentos d  (cost=0.00..1.33 rows=33 width=17) (actual time=378.388..378.401 rows=33 loops=1)
                                 Buffers: shared read=1
                     ->  Materialize  (cost=1603058.83..1653058.83 rows=10000000 width=8) (actual time=2077.889..3332.439 rows=9696701 loops=1)
                           Buffers: shared read=66943, temp read=43418 written=65534
                           ->  Sort  (cost=1603058.83..1628058.83 rows=10000000 width=8) (actual time=2077.877..2592.015 rows=9696701 loops=1)
                                 Sort Key: e.dep_id
                                 Sort Method: external merge  Disk: 176200kB
                                 Buffers: shared read=66943, temp read=43418 written=44228
                                 ->  Seq Scan on empregados e  (cost=0.00..166943.00 rows=10000000 width=8) (actual time=1.001..871.059 rows=10000000 loops=1)
                                       Buffers: shared read=66943
 Planning:
   Buffers: shared hit=72 read=19
 Planning Time: 6.226 ms
 JIT:
   Functions: 21
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 4.265 ms, Inlining 92.417 ms, Optimization 162.444 ms, Emission 123.104 ms, Total 382.229 ms
 Execution Time: 7537.207 ms
(35 rows)

                                                                          QUERY PLAN                                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1975815.06..1975819.51 rows=1780 width=25) (actual time=7326.466..7326.469 rows=32 loops=1)
   Sort Key: (sum(e.salario) OVER (?))
   Sort Method: quicksort  Memory: 27kB
   Buffers: shared hit=3 read=66944, temp read=111693 written=102850
   ->  HashAggregate  (cost=1975701.16..1975718.96 rows=1780 width=25) (actual time=7326.395..7326.404 rows=32 loops=1)
         Group Key: sum(e.salario) OVER (?), d.nome
         Batches: 1  Memory Usage: 73kB
         Buffers: shared read=66944, temp read=111693 written=102850
         ->  WindowAgg  (cost=1603061.00..1925701.16 rows=10000000 width=25) (actual time=2635.109..6492.977 rows=9696700 loops=1)
               Buffers: shared read=66944, temp read=111693 written=102850
               ->  Merge Join  (cost=1603061.00..1775701.16 rows=10000000 width=21) (actual time=2529.297..4417.148 rows=9696700 loops=1)
                     Merge Cond: (d.dep_id = e.dep_id)
                     Buffers: shared read=66944, temp read=43418 written=65534
                     ->  Sort  (cost=2.16..2.24 rows=33 width=17) (actual time=386.517..386.528 rows=33 loops=1)
                           Sort Key: d.dep_id
                           Sort Method: quicksort  Memory: 26kB
                           Buffers: shared read=1
                           ->  Seq Scan on departamentos d  (cost=0.00..1.33 rows=33 width=17) (actual time=386.477..386.482 rows=33 loops=1)
                                 Buffers: shared read=1
                     ->  Materialize  (cost=1603058.83..1653058.83 rows=10000000 width=8) (actual time=2142.751..3402.170 rows=9696701 loops=1)
                           Buffers: shared read=66943, temp read=43418 written=65534
                           ->  Sort  (cost=1603058.83..1628058.83 rows=10000000 width=8) (actual time=2142.747..2658.243 rows=9696701 loops=1)
                                 Sort Key: e.dep_id
                                 Sort Method: external merge  Disk: 176200kB
                                 Buffers: shared read=66943, temp read=43418 written=44228
                                 ->  Seq Scan on empregados e  (cost=0.00..166943.00 rows=10000000 width=8) (actual time=0.954..959.785 rows=10000000 loops=1)
                                       Buffers: shared read=66943
 Planning:
   Buffers: shared hit=72 read=19
 Planning Time: 7.519 ms
 JIT:
   Functions: 21
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 4.279 ms, Inlining 84.503 ms, Optimization 147.880 ms, Emission 153.672 ms, Total 390.335 ms
 Execution Time: 7607.683 ms
(35 rows)

