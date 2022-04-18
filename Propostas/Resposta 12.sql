SELECT e.nm_empregado,
       d.nm_departamento,
       d."local",
       e.nm_funcao
  FROM "EMPREGADOS" e 
 INNER JOIN "DEPARTAMENTOS" d ON (e.cod_departamento = d.id_departamento) 
 WHERE e.salario > (SELECT MIN(salario) FROM "EMPREGADOS" WHERE nm_funcao = 'Gerente')
   AND AGE(NOW(), e.data_admissao) > '5 Year'