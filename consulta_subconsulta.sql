Consultas y subconsultas 

JOIN es una consulta que permite combinar filas de dos o mas tablas basandose en una columna
rellacionada entre ellas generalmente una clave foranea en una tabla que apunta a una clave
primaria en otra

Tipos de JOIN

INNER JOIN: Se utiliza para retornar filas cuando haya almenos una coinsidenca en ambas tablas

SELECT nombre_empleado, nombre_departamento 
FROM empleados 
INNER JOIN departamento ON ID_departamento = ID_departamento
________________________________________________________________________________________________
LEFT JOIN: Devuelve todas las filas de la tabla de la fila izquierda (primera tabla mencionada
en la consulta) y las filas considentes de la tabla de la derecha (segunda tabla)

SELECT nombre_empleado, nombre_departamento 
FROM empleados 
LEFT JOIN departamento ON ID_departamento = ID_departamento
________________________________________________________________________________________________
RIGHT JOIN: Funciona de manera inversa al LEFT JOIN, retornando todas las filas de la tabla
derecha y las filas considentes de la tabla izquierda

SELECT nombre_empleado, nombre_departamento 
FROM empleados 
RIGHT JOIN departamento ON ID_departamento = ID_departamento
________________________________________________________________________________________________

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

JOIN tambien se puede utilizar conlas subconsultas:
COUNT:contar los valores en una tabla .
AVG:promedio de los varores dentro de una tabla.
MAX:valor mas alto de una tabla.
MIN:valor minimo de una tabla.
----------------DISTINCT-------------------
DISTINCT:Crea una consulta SQL que enlista los valores de una o mas tablas
tablas sin mostrar valores repetidos.

SELECT DISTINCT columna
FROM tabla
# esta consulta mostrara los valores distintos de una tabla, se peude
agregar mas de una columna a consultar

SELECT DISTINCT tabla_1.columna_1
FROM tabla_1
INNER JOIN tabla_2 ON tabla_1.PRIMARY_KEY = tabla_2.FOREIGN_KEY;
# esta consulta mostrara los valores de las columnas seleccionadas
existentes en dos tablas sin repetir valores uniendolas por sus llaves
primaria de la tablla_1 con la llave foranea de la tabla_2

---EJEMPLO---
SELECT DISTINCT productos.nombre_producto #tabla.columna
FROM productos
INNER JOIN ventas ON productos.id_producto = ventas.id_producto;
#esta consulta mostrara el nombre e id de los productos que conciden
en las tablas ventas y en productos (que se han vendido) sin motrar
valores repedidos.
la traduccion podria ser:   SELECCIONA DIFERENCIAS de tabla_1.valor
                            DE la tabla_1
                            JUNTANDO ventas CON tabla_1.prymary_key = tabla_2.foreign_key

#se pueden agregar los valores de cinsulta necesrios en SELECT DISTINCT

--------------------------COUNT--------------------------------
COUNT: Eta consuta se utiliza para mostrar un conteo(cuantos) de los valores de una tabla
especifica.
-----SYNTAXIS BASICA-----

SELECT COUNT (id_producto)
FROM productos

esta consulta mostrara el total de registros de la columna id_producto
te la tabla productos.
Para utilizarla de manera mas avanzada por ejemplo consultar el total de ventas
de los empleados de una tienda se puede utilizar la siguiente consulta.

SELECT empleados.nombre_empleado,   #selecciona
COUNT(ventas.id_venta)              #contando
FROM empleados                      #desde
INNER JOIN ventas ON empleados.id_empleado = ventas.id_empleado     #juntando,con
GROUP BY empleados.nombre_empleado;

esta consulta mostrara los empleados que presenten ventas de manera
automatica este tipo de consultas se ordenan de manera decendente,
puedes seleccionar la informacion que se mostrara en la sentencia SELECT
por ejemplo el nommbre y el apellido del empleado

-------------------------IS NULL/NOT EXISTS/EXISTS----------------------------------------------------
Estas consultas se utilizan para solicitar valores existentes o nulos en las consultas JOIN
---IS NULL--SYNTAXIS--
SELECT columna
FROM tabla_1
LEFT JOIN tabla2 ON tabla_1.PRIMARY_KEY = tabla_2.FOREIGN_KEY
WHERE tabla_2.FOREIGN_KEY IS NULL;

esta SYNTAXIS es la mas basica consiste en solicitar si un valor es nulo o no se encuentra
en la tabla secundaria ahunque es una consulta simple solo se recomienda en bases pequenas
ya que puede resultar un poco ambigua.

--NOT EXISTS--
SELECT tabla_1.columna
FROM tabla_1
WHERE NOT EXISTS(
    SELECT 1
    FROM tabla_2
    WHERE tabla_1.PRIMARY_KEY = tabla_2.FOREIGN_KEY
);

esta consulta resulta mas eficiente por lo que se utiliza en bases mas grandes
--NOTA: SELECT 1 es una convencion que se utiliza para verificar la existencia de datos--

--------------DISTINCT & NOT EXISTS-------------
estas consultas al usarse juntas muestran el contenido de una tabla que no se encuentra en
otra una de las formas utiles es saber que empleados han realizado compras pero no ventas
o productos con ventas pero sin compras.

---SYNTAXIS---
SELECT DISTINCT columna
FROM tabla_1
INNER JOIN tabla_2 ON tabla_1.prymary_key = tabla_2.foreign_key
WHERE NOT EXISTS (
    SELECT 1
    FROM tabla_3
    WHERE tabla_3.foreign_key = tabla_1.prymary_key
);

