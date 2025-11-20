Consultas y subconsultas 

JOIN es una consulta que permite combinar filas de dos o mas tablas basandose en una columna
rellacionada entre ellas generalmente una clave foranea en una tabla que apunta a una clave
primaria en otra

Tipos de JOIN

INNER JOIN: Se utiliza para retornar filas cuando haya almenos una coinsidenca en ambas tablas

SELECT nombre_empleado, nombre_departamento 
FROM empleados 
INNER JOIN departamento ON ID_departamento = ID_departamento

LEFT JOIN: Devuelve todas las filas de la tabla de la fila izquierda (primera tabla mencionada
en la consulta) y las filas considentes de la tabla de la derecha (segunda tabla)

SELECT nombre_empleado, nombre_departamento 
FROM empleados 
LEFT JOIN departamento ON ID_departamento = ID_departamento

RIGHT JOIN: Funciona de manera inversa al LEFT JOIN, retornando todas las filas de la tabla
derecha y las filas considentes de la tabla izquierda

SELECT nombre_empleado, nombre_departamento 
FROM empleados 
RIGHT JOIN departamento ON ID_departamento = ID_departamento

FULL OUTER JOIN: combina LEFT JOIN y RIGHT JOIN, devolviendo filas cuando hay conisedencia
en una de las tablas. Si no hay considencia retornara valor NULL de le lado sin correspondencia.
Cabe mencionar que SQL no soporta esta consulta de manera directa pero si se puede realizar una
simulacion utilizando LEFT JOIN y RIGHT JOIN agregando la consulta UNION


SELECT nombre_empleado, nombre_departamento 
FROM empleados 
LEFT JOIN departamento ON ID_departamento = ID_departamento

UNION

SELECT nombre_empleado, nombre_departamento 
FROM empleados 
RIGHT JOIN departamento ON ID_departamento = ID_departamento