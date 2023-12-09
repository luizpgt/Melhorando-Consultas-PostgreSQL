# Medições

### Limpar cache 
```sql
sudo systemctl stop postgresql.service
sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
sudo systemctl start postgresql.service
```

### Capturar plano de execução:
```sql
EXPLAIN (ANALYZE, COSTS, BUFFERS, TIMING, WAL) + _consulta_
```

### Valores de "Execution Time":
(5x):
``` bash
psql -U postgres -d dojo -h localhost -f script.sql >> results.sql
sudo reboot 
```

``` bash
cat results.sql | grep "Execution Time"
```


# Consulta mais Cara: Questão 10

### Query Inicial:

``` sql
    SELECT em.nome, em.salario, em.dep_id, avg AS avg_salary 
        FROM (SELECT e.emp_id, e.dep_id, 
                cast(AVG(salario) over(partition by dep_id) AS integer)
                FROM empregados e) s
        JOIN empregados em 
        ON em.emp_id = s.emp_id
        WHERE em.salario >= s.AVG
        ORDER BY dep_id;
```

### Tempo gasto na Consulta 

    Execution Time: 11317.595 ms
    Execution Time: 11401.590 ms
    Execution Time: 11123.518 ms
    Execution Time: 11106.900 ms
    Execution Time: 11269.210 ms

### Query Plan capturado com cache vazio

``` sql
                                                                       QUERY PLAN                                                                 ---------------------------------------------------------------------------------------------------------------------------------------------------------
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
```

### Média e Desvio padrão de 5 execuções com os buffers limpos:

| Média Aritmética | Desvio Padrão | Unidade Medida |
|:--------:|:-------------:|:------|
| 11226.9626 |  104.07715 | ms |

### Explicando Plano de Consulta:

```
->  Seq Scan on empregados e
->  Sort
      Sort Key: e.dep_id
->  WindowAgg
->  Subquery Scan on s
->  Seq Scan on empregados em
->  Hash
->  Hash Join
      Hash Cond: (s.emp_id = em.emp_id)
      Join Filter: (em.salario >= s.avg)
      Rows Removed by Join Filter: 4941633
-> Sort
      Sort Key: em.dep_id
      Sort Method: external merge  Disk: 154584kB
```

#### Descrições:

1. Seq Scan na tabela `empregados` retorna todos os empregados cadastrados para o apelido `e`;
2. Os registros são então ordenados pela coluna `dep_id`, que é chave primária de `departamentos`;
3. A Window Function é então aplicada. Essa função é causada pelo statement `OVER` na Query;
4. Subquery Scan faz a leitura na subquery `s`, a qual apresenta a Window Function;
5. Novamente performa Seq Scan na tabela `empregados` retorna todos os empregados cadastrados para o apelido `em`;
6. É feito um hash nos registros de `em`;
7. Acontece o `JOIN`, usando os registros da subquery `s` e o hash dos registros vindos de `em`;
8. Finalmente o resultado é ordenado pela coluna `dep_id`;

#### Observações:

- É possível notar em (1 ^ 5) Seq Scans sobre a mesma tabela. E que os tempos de início das operações se sobrepõem - elas parecem acontecer simultaneamente.
- Em (1 ^ 5), é notável uma grande quantidade de registros sendo capturados por `shared read`, o que indica que registros capturados pela primeira execução não estão sendo mantidos em disco.
- Em (2), os registros são ordenados usando o método `external merge Disk`, o que é indício de pouca memória disponível para a operação.
- (4) novamente é possíven notar grande quantia de `shared read`, indicando muitos registros sendo buscados no disco, e poucos em buffers em RAM.
- O algoritmo de `JOIN` usado na operação (7) é o `HASH JOIN`, que tem condição equivalente a um `NATURAL JOIN`, e filtra pela condição de `empregados` que possuam salário maior que a média de seus departamentos. A maioria
dos registros é descartado nesse passo.
- Os registros resultantes são ordenados usando novamente o algoritmo `external merge Disk`, indicando pouca memória disponível para a operação.

### Tentativas de melhoria

Resumo: 
- Alteração em `parâmetros` do SGBD;
- Criação de `índices`;

Alterando PostgreSQL configuration file:

```bash
sudo vim /var/lib/postgres/data/postgresql.conf
```

| Parameter | Old/Default value | New Value |
|:--------:|:-------------:|:------|
| work_mem | 4MB | 500MB |
| shared_buffers | 128MB | 1GB |
| random_page_cost | 4.0 | 1.0 |

Novo índice criado para a Tabela `empregados`:

```sql 
dojo=# create index dep_id_empregados on empregados (dep_id);
```

* Tentativas de modificação na `query` não apresentaram mudanças significativas de performance.


### Resultados encontrados

* Alteração de parâmetros e Criação de índice na coluna `dep_id` **não** apresentaram mudança significativa no **tempo de execução**,
apesar de (a princípio) **melhorarem o plano de execução**.

```sql
                                                                                QUERY PLAN                                                                                ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1428489.63..1436822.97 rows=3333333 width=19) (actual time=11449.171..11583.800 rows=5058367 loops=1)
   Sort Key: em.dep_id
   Sort Method: quicksort  Memory: 455572kB
   Buffers: shared hit=2186196 read=75999
   ->  Hash Join  (cost=291942.43..1067347.44 rows=3333333 width=19) (actual time=3802.820..10902.120 rows=5058367 loops=1)
         Hash Cond: (e.emp_id = em.emp_id)
         Join Filter: (em.salario >= ((avg(e.salario) OVER (?))::integer))
         Rows Removed by Join Filter: 4941633
         Buffers: shared hit=2186193 read=75999
         ->  WindowAgg  (cost=0.43..400405.43 rows=10000000 width=12) (actual time=1539.494..5887.627 rows=10000000 loops=1)
               Buffers: shared hit=2119919 read=75331
               ->  Index Scan using dep_id_empregados on empregados e  (cost=0.43..225405.43 rows=10000000 width=12) (actual time=338.081..3518.849 rows=10000000 loops=1)
                     Buffers: shared hit=2119919 read=75331
         ->  Hash  (cost=166942.00..166942.00 rows=10000000 width=19) (actual time=2251.320..2251.322 rows=10000000 loops=1)
               Buckets: 16777216  Batches: 1  Memory Usage: 650827kB
               Buffers: shared hit=66274 read=668
               ->  Seq Scan on empregados em  (cost=0.00..166942.00 rows=10000000 width=19) (actual time=0.029..554.620 rows=10000000 loops=1)
                     Buffers: shared hit=66274 read=668
 Planning:
   Buffers: shared hit=59 read=18
 Planning Time: 9.165 ms
 JIT:
   Functions: 17
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 3.520 ms, Inlining 79.287 ms, Optimization 148.173 ms, Emission 108.800 ms, Total 339.780 ms
 Execution Time: 11978.142 ms
(26 rows)
```

Resumo Descrição/Observações:

```
->  Index Scan using dep_id_empregados on empregados e
->  WindowAgg
->  Seq Scan on empregados em
->  Hash
->  Hash Join
      Hash Cond: (e.emp_id = em.emp_id)
      Join Filter: (em.salario >= ((avg(e.salario) OVER (?))::integer))
-> Sort
      Sort Key: em.dep_id
      Sort Method: quicksort  Memory: 455572kB
```

1. Pode-se notar uma clara diminuição na quantidade de Operações para obter o resultado final.
2. A quantia de acessos ao disco diminuiu, visto o aumento e diminuição no número de `shared hits` e `shared reads`, respectivamente.
3. Além de diminuir pela metade o número de operações de ordenação, agora o método usado é o `quicksort`, performado em memória.


# Úteis 

Para listar colunas e índices e outras informações da tabela:
``` sql
\d tablename
```
