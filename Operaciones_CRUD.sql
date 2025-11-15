Operaciones CRUD

Create
Read
Update
Delete

Comandos de operaciones CRUD INSERT INTO,SELECT,UPDATE 

INSERT: Este comando se utiliza para anadir nuevos registros a una tabla una variante de este comando es INSERT INTO SELECT
este comando permite este permite copiar datos de una tabla  a otra.

Tabla original
CREATE TABLE ClientesActivos(
    ID_cliente INT,
    nombre VARCHAR (30),
    email VARCHAR (30)
);

Tabla copia

INSERT INTO ClientesActivos (ID_cliente,nombre,email)
SELECT ID_cliente,nombre,email
FROM clientes
WHERE activo = 1;

SELECT: Este comando se utiliza para extraer datos de las bases de datos esta se puede usa en cunjunto con otros comandos como
WHERE para filtrar los registros ORDER BY para ordenar los resultados GROUP BY para ordenar datos similares JOIN realizar consultas
que abarcan multiples tablas.

Un ejemplo en el cual se pueden aplicar es una base de datos en la cual se almacenan los ppedidios de clientes 

CREATE TABLE Clientes (
    ID_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (30),
    ciudad VARCHAR (30)
);

CREATE TABLE pedidos (
    ID_pedido INT AUTO_INCREMENT PRIMARY KEY,
    ID_cliente INT,
    fecha_pedido DATE,
    monto DECIMAL (10,2),
    FOREIGN KEY (ID_cliente) REFERENCES clientes(ID_cliente)
);

SELECT c.nombre,c.ciudad, SUM(p.monto) AS total_gastado     | seleccionar daros del cliente
FROM Clientes c # se puede crear un alias                   | desde que tabla se sacara la informacion 
JOIN pedidos p ON c.ID_cliente = p.ID_cliente               | union de las tablas 
WHERE c.ciudad = 'madrid'                                   | filtrado de la tabla
GROUP BY c.nombre,c.ciudad                                  | agrupacion de las tablas
ORDER BY total_gastado DEC;                                 | ordenar de manera

