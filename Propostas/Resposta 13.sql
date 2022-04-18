SELECT SUM(e.salario) AS SOMA,
       d.nm_departamento,
       e.nm_funcao
  FROM "EMPREGADOS" E
 INNER JOIN "DEPARTAMENTOS" d ON (e.cod_departamento = d.id_departamento) 
 WHERE AGE(NOW(), e.data_admissao) > '1 Year' 
   AND d.local LIKE '%Porto Alegre' 
 GROUP BY nm_departamento, e.nm_funcao 