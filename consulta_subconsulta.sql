Consultas y subconsultas 

JOIN es una consulta que permite combinar filas de dos o mas tablas basandose en una columna
rellacionada entre ellas generalmente una clave foranea en una tabla que apunta a una clave
primaria en otra

Tipos de JOIN

INNER JOIN: Se utiliza para retornar filas cuando haya almenos una coinsidenca en ambas tablas

SELECT nombre_empleado, nombre_departamento 
FROM empleados 
INNER JOIN departamento ON ID_departamento = ID_departamento

LEFT JOIN:

RIGHT JOIN

FULL OUTER JOIN