Filtrado y ordenamiento de datos

Son operaciones criticas en la gestion de bases de datos que permiten al usuario manipular y
aceeder a la informacion de manera precisa y organizada en MySQL.

WHERE: permite a los usuarios especificar exactamente que registros desean recuperar esta se
puede utilizar en conjunto con las clauslas SELECT,ORDER Y DELETE

ORDER BY: permite organizar los resultados de forma que tenga sentido para el usuario final

                        ejemplo de consulta

SELECT * FROM empleados ORDER BY apellido ASC, nombre ASC

esta consulta muestra todos los datos de la tbla empleados ordenados por apellido y nombre 
de manera ascendente

                        ejemplo consulta

SELECT titulo, fecha_publicacion
FROM libros
WHERE autor = "Gabriel Garcia"
ORDER BY fecha_publicacion DESC;

esta consulta nos permite ralizar una consulta seleccionado el titulo y la fecha_publicacion
de la tabla libros de el autor "Gabriel Garcia" ordenados por su fecha de fecha_publicacion
de manera descendente
_________________________________________________________________________________________________

Clausulas LIMIT y OFFSET

La clausla LIMIT especifica la cantidad maxima de registros que debe retornar la consulta
Se especifica desde que la fila fila comienza a contar los registros definidos por LIMIT

SELECT titulo, fecha_publicacion
FROM libros
WHERE autor = "Gabriel Garcia"
ORDER BY fecha_publicacion DESC
LIMIT 5 OFFSET 5;

esta consulta mustra los resultados limitados a 5 filas y saltando los primeros 5 registros
siendo esto util por ejemplo en una consulta en la que se quiera motras lor resultados a menera
de paginas.

