SELECT nm_empregado, 
       data_admissao
  FROM "EMPREGADOS" e  
 WHERE nm_empregado NOT LIKE 'Marcelo%'
   AND COD_DEPARTAMENTO IN (SELECT COD_DEPARTAMENTO
                              FROM "EMPREGADOS" E1
                             WHERE E1.nm_empregado LIKE 'Marcelo%')