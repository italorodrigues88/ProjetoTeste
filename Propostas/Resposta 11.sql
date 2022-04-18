SELECT id_empregado,
       nm_empregado
  FROM "EMPREGADOS"
 WHERE COD_DEPARTAMENTO IN (SELECT COD_DEPARTAMENTO
                              FROM "EMPREGADOS" E1
                             WHERE E1.nm_empregado LIKE '%t%')