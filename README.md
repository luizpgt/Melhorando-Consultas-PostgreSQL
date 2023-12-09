# Melhorando-Consultas-PostgreSQL
Terceira entrega da disciplina de Banco de Dados 2023.2 (UFFS)

# Medições

## Capturar plano de execução:
```sql
EXPLAIN (ANALYZE, COSTS, BUFFERS, TIMING, WAL) + _consulta_
```

## Valores de "Execution Time":

Executar 5 vezes:
``` bash
psql -U postgres -d dojo -h localhost -f query.sql >> results.sql
sudo reboot 
```

``` bash
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

Alguns parâmetros podem ser alterados at run time:
    https://www.postgresql.org/docs/8.0/runtime-config.html
