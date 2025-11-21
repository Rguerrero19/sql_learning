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