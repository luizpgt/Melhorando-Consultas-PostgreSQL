# funcao \timing do psql
---

|qid| query | timing 1 | timing 2 | timing 3 |
|---|-------|----------|----------|----------|
| 1 |SELECT e.nome AS empregado FROM empregados e JOIN empregados c ON e.supervisor_id = c.emp_id WHERE e.salario > c.salario;| 1605.848 ms (00:01.606)| 1559.178 ms (00:01.559)| 1585.968 ms (00:01.586)|
| 2 |SELECT dep_id, MAX(salario) FROM empregados group by dep_id order by dep_id;| 379.979 ms| 390.138 ms| 383.501 ms |
| 3 |with ms AS (SELECT dep_id, MAX(salario) FROM empregados group by dep_id) SELECT e.dep_id, e.nome, salario FROM empregados e JOIN ms ON ms.dep_id = e.dep_id WHERE ms.MAX = e.salario;| 1104.431 ms (00:01.104) |  1111.407 ms (00:01.111) |  1101.001 ms (00:01.101) |
| 4 | SELECT d.nome FROM departamentos d JOIN (SELECT dep_id, COUNT(dep_id) FROM empregados group by dep_id) dc ON d.dep_id = dc.dep_id WHERE dc.COUNT < 3 order by nome; | 333.807 ms |  367.313 ms |  329.088 ms |
| 5 | SELECT d.nome, dc.COUNT FROM departamentos d JOIN (SELECT dep_id, COUNT(dep_id) FROM empregados group by dep_id) dc ON d.dep_id = dc.dep_id order by nome; |  335.522 ms |  365.283 ms |  365.389 ms |
| 6 | SELECT e.nome, e.dep_id FROM empregados e JOIN empregados em ON em.emp_id = e.supervisor_id WHERE e.dep_id != em.dep_id; |  2915.966 ms (00:02.916) |  2875.853 ms (00:02.876) |  2850.773 ms (00:02.851) |
| 7 | SELECT distinct sum(e.salario) over(partition by d.dep_id), d.nome FROM empregados e JOIN departamentos d ON e.dep_id = d.dep_id order by sum; |  5359.086 ms (00:05.359)|  5367.406 ms (00:05.367)|  5382.854 ms (00:05.383) |
| 8 | SELECT e.nome, e.salario FROM empregados e JOIN (SELECT dep_id, AVG(salario) AS salario FROM empregados group by dep_id) s ON e.dep_id=s.dep_id WHERE e.salario > s.salario;|  2668.500 ms (00:02.668)|   2697.292 ms (00:02.697) |  2683.759 ms (00:02.684) |
| 9 | SELECT e.dep_id, e.nome, e.salario, cast(AVG(salario) over(partition by dep_id) AS integer) FROM empregados e; |  5488.944 ms (00:05.489) |  5643.421 ms (00:05.643) |  5536.767 ms (00:05.537) |
| 10| SELECT em.nome, em.salario, em.dep_id, avg AS avg_salary FROM (SELECT e.emp_id, e.dep_id, cast(AVG(salario) over(partition by dep_id) AS integer) FROM empregados e) s JOIN empregados em ON em.emp_id = s.emp_id WHERE em.salario >= s.AVG order by dep_id; |  9436.666 ms (00:09.437) | 9292.362 ms (00:09.292) |  9489.088 ms (00:09.489) |
