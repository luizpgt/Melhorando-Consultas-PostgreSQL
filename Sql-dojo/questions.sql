-- \timing func on psql

1  Listar os empregados (nomes) que tem salário maior que seu chefe (usar o join)


--  empregado | 
-- -----------+
--  Maria     |
--  Claudia   |
--  Ana       |
--  Luiz      |

select e.nome as empregado from empregados e join empregados c on e.supervisor_id = c.emp_id where e.salario > c.salario;
Time: 1605.848 ms (00:01.606)

2 Listar o maior salario de cada departamento (usa o group by )

--  dep_id |  max  
-- --------+-------
--       1 | 10000
--       2 |  8000
--       3 |  6000
--       4 | 12200

select dep_id, max(salario) from empregados group by dep_id order by dep_id;
Time: 0.614 ms

3 Listar o dep_id, nome e o salario do funcionario com maior salario dentro de cada departamento (usar o with)
--  dep_id |  nome   | salario 
-- --------+---------+---------
--       3 | Joao    |    6000
--       1 | Claudia |   10000
--       4 | Ana     |   12200
--       2 | Luiz    |    8000

with ms as (select dep_id, max(salario) from empregados group by dep_id) select e.dep_id, e.nome, salario from empregados e join ms on ms.dep_id = e.dep_id where ms.max = e.salario;
Time: 0.960 ms

4 Listar os nomes departamentos que tem menos de 3 empregados;

--    nome    
-- -----------
--  Marketing
--  RH
--  Vendas

select d.nome from departamentos d join (select dep_id, count(dep_id) from empregados group by dep_id) dc on d.dep_id = dc.dep_id where dc.count < 3 order by nome;
Time: 1.499 ms

5 Listar os departamentos  com o número de colaboradores

    
--    nome    | count 
-- -----------+-------
--  Marketing |     1
--  RH        |     2
--  TI        |     4
--  Vendas    |     1

select d.nome, dc.count from departamentos d join (select dep_id, count(dep_id) from empregados group by dep_id) dc on d.dep_id = dc.dep_id order by nome;
Time: 0.922 ms

6 Listar os empregados que não possue o seu  chefe no mesmo departamento/ 

--  nome | dep_id 
-- ------+--------
--  Joao |      3
--  Ana  |      4

select e.nome, e.dep_id from empregados e join empregados em on em.emp_id = e.supervisor_id where e.dep_id != em.dep_id;
Time: 0.723 ms

7 Listar os nomes dos  departamentos com o total de salários pagos (sliding windows function)

--   sum  |   nome    
-- -------+-----------
--   6000 | Vendas
--  12200 | Marketing
--  15500 | RH
--  32500 | TI

select distinct sum(e.salario) over(partition by d.dep_id), d.nome from empregados e join departamentos d on e.dep_id = d.dep_id order by sum;
Time: 0.995 ms

8 Listar os nomes dos colaboradores com salario maior que a média do seu departamento (dica: usar subconsultas);

--   Nome   | Salário 
-- ---------+---------
--  Maria   |    9500
--  Claudia |   10000
--  Luiz    |    8000

select e.nome, e.salario from empregados e join (select dep_id, avg(salario) as salario from empregados group by dep_id) s on e.dep_id=s.dep_id where e.salario > s.salario;
1.989 ms

 9  Faça uma consulta capaz de listar os dep_id, nome, salario, e as médias de cada departamento utilizando o windows function;

--  dep_id |   nome    | salario |  avg  
-- --------+-----------+---------+-------
--       1 | Jose      |    8000 |  8125
--       1 | Claudia   |   10000 |  8125
--       1 | Guilherme |    5000 |  8125
--       1 | Maria     |    9500 |  8125
--       2 | Luiz      |    8000 |  7750
--       2 | Pedro     |    7500 |  7750
--       3 | Joao      |    6000 |  6000
--       4 | Ana       |   12200 | 12200


select e.dep_id, e.nome, e.salario, cast(avg(salario) over(partition by dep_id) as integer) from empregados e;
Time: 0.804 ms

10 - Encontre os empregados com salario maior ou igual a média do seu departamento. Deve ser reportado o salario do empregado e a média do departamento (dica: usar window function com subconsulta)

--   nome   | salario | dep_id |       avg_salary       
-- ---------+---------+--------+------------------------
--  Claudia |   10000 |      1 |  8125.0000000000000000
--  Maria   |    9500 |      1 |  8125.0000000000000000
--  Luiz    |    8000 |      2 |  7750.0000000000000000
--  Joao    |    6000 |      3 |  6000.0000000000000000
--  Ana     |   12200 |      4 | 12200.0000000000000000

select em.nome, em.salario, em.dep_id, avg as avg_salary from (select e.emp_id, e.dep_id, cast(avg(salario) over(partition by dep_id) as integer) from empregados e) s join empregados em on em.emp_id = s.emp_id where em.salario >= s.avg order by dep_id; 
Time: 0.951 ms
