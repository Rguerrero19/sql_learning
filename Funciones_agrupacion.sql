Funciones avanzadas y agupacion de objetos

Juega un papel esencial en la orzanizacion y resumen de datos, permitiendo a los usuarios
realizar analisis estadisticos y generar informes precisos apartir de grandes conjuntos de datos

Algunas de las principales funciones de agregacion son SUM,COUNT,MAX,MIN,AVG estas funciones
se complementan con la consulta GROUP BY

COUNT: Es utilizada para contar el numero de filas que cumplen con un criterio especifico
dentro de un conjunode datos.

                            Ejemplo consulta 
        Cuantos empleados estan registrados en una tabla
                SELECT COUNT (*) FROM empleados

En este ejemplo el resultado sera un conteo de todos los registros en la tabla indicada

SUM: Permite sumar valores numericos dentro de una columna especifica.

                            Ejemplo consulta
        Calcular el total de venta del dia de una tienda
                    SELECT SUM (venta) from ventas

AVG: Calcula el promedio de un conjunto de valores numericos. Esta es escencial para analisis
estadisticos donde necesitas entender el valor medio de un conjunto de datos.

                            Ejemplo consulta
        Consultar el salario promedio de los empleados en una empresa
                    SELECT AVG (salario) FROM empleados

MIN() y MAX(): Estas funciones son usadas para encontrar el valor minimo y maximo en un conjunto
de datos
                                Ejemplo consulta
                        Precio mas alto de un producto vendido
                        SELECT MAX(precio) FROM productos

                        Precio mas bajo de un producto vendido
                        SELECT MIN(precio) FROM productos

GROUP BY: Es utilizasa para segmentar datos en grupos distintos, lo que es epecialmente util para
realizar  calculos agregados, como sumas, promedios y conteos sobre cada grupoo de manera independiente

                                Ejemplo consulta
SELECT                                                  
        t.nombre_tienda,
        p.categoria
        SUM(v.cantidad * v.precio) AS total_ventas,     |calcular total de ventas
        COUNT(v.ID_venta) AS numero_transacciones       |contar numero de transacciones 
FROM ventas

INNER JOIN tiendas t ON v.ID_tienda = t.ID_tienda       |conectar las tablas ventas,tiendas, productos
INNER JOIN productos p ON v.ID_producto = p.ID_producto |y acceder a la informacion cruzada de estas

GROUP BY t.nombre_tienda , p.categoria                  |agrupar los resultados por nombre de tienda y categoria

ORDER BY total ventas DESC;                             |ordenar el total de ventas en orden secendente

HAVING: Se utiliza para filtrar los resutados de una consulta. A diferencia de WHERE que filtra
filas individuales antes de aguparlas, HAVING filtra los grupos despues de que se han aplicado funciones 
de agregacion como SUM(),COUNT() o AVG().

                                Ejemplo consulta
                SELECT                                  
                        ID_producto,
                        SUM(cantidad) AS total_cantidad |sumas la cantidad vendidapor cada producto
                FROM ventas
                GROUP BY ID_producto                    |agrupacion de productos                          
                HAVING SUM(cantidad) > 10;              |filtrar los grupos por la suma de cantidad vendida
