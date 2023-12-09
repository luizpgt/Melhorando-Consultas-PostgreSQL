# Melhorando-Consultas-PostgreSQL

Terceira entrega da disciplina de Banco de Dados 2023.2 (UFFS)

Aluno: Luiz Paulo Grafetti Terres;

# Medições

## Query para capturar plano de execução:

```sql
EXPLAIN (ANALYZE, COSTS, BUFFERS, TIMING, WAL) + _consulta_
```

## Para valores de "Execution Time" foi utilizado:

Executar 5 vezes:
``` bash
psql -U postgres -d dojo -h localhost -f query.sql >> results.sql
sudo reboot 
```

``` bash
cat results.sql | grep "Execution Time" | tail -n 5
```

## Rotina alternativa para capturar Execution Time sem reboot da máquina:

```bash 
#!/bin/sh
set -xe 

cat script.sql

for i in {0..4}
do
    # clear cache 
    sudo systemctl stop postgresql.service
    sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
    sudo systemctl start postgresql.service
    # capture explain results
    psql -U postgres -d dojo -h localhost -f script.sql >> results.sql
done
    cat results.sql | grep "Execution Time" | tail -n 5
```

## Para atualizar o catálogo

``` sql
analyze tablename;
```

# Úteis

Acessar/alterar parâmetros PostgreSQL:
```bash
sudo vim /var/lib/postgres/data/postgresql.conf
```

Visualizar informações sobre uma tabela:
``` sql
\d tablename
```

# Links de Referência:

Alguns parâmetros podem ser alterados at run time : https://www.postgresql.org/docs/current/runtime-config-resource.html

Parallel Aggregation : https://www.postgresql.org/docs/16/parallel-plans.html#PARALLEL-AGGREGATION

PgMustard - EXPLAIN Glossary : https://www.pgmustard.com/docs/explain

Site com dicas de SQL : https://learnsql.com/blog/sql-window-functions-cheat-sheet/
