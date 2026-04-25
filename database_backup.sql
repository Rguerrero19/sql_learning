CREATE DATABASE ignacio_tienda

----------------------------TABLES---------------------------
CREATE TABLE productos(
	id_producto SERIAL PRIMARY KEY NOT NULL,
	nombre_producto VARCHAR(30) NOT NULL,
	precio_venta NUMERIC(6,2) NOT NULL,
	cantidad INTEGER NOT NULL,
	categoria VARCHAR(20) NOT NULL
);

CREATE TABLE empleados(
	id_empleado SERIAL PRIMARY KEY NOT NULL,
	nombre_empleado VARCHAR(20) NOT NULL,
	apellidos VARCHAR(20) NOT NULL,
	fecha_contrato TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE empleados
ADD COLUMN fecha_recesion DATE;

CREATE TABLE proveedores(
	id_proveedor SERIAL PRIMARY KEY NOT NULL,
	nombre_empresa VARCHAR(30) NOT NULL,
	email VARCHAR(20),
	numero INTEGER NOT NULL
);

CREATE TABLE orden_compra(
	id_orden SERIAL PRIMARY KEY NOT NULL,
	id_proveedor INTEGER NOT NULL,
	orden_proveedor INTEGER NOT NULL,
	fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_proveedor) REFERENCES proveedores (id_proveedor)
);

CREATE TABLE detalle_compra(
	id_detalle SERIAL PRIMARY KEY NOT NULL
	id_orden INTEGER NOT NULL,
	id_proveedor INTEGER NOT NULL,
	id_empleado INTEGER NOT NULL,
	id_producto INTEGER NOT NULL,
	cantidad INTEGER NOT NULL,
	FOREIGN KEY (id_orden) REFERENCES orden_compra (id_orden),
	FOREIGN KEY (id_proveedor) REFERENCES proveedores (id_proveedor),
	FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
	FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);

CREATE TABLE ventas(
	id_venta SERIAL PRIMARY KEY NOT NULL,
	id_empleado INTEGER NOT NULL,
	fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE detalle_venta(
	id_detalleventa SERIAL PRIMARY KEY NOT NULL,
	id_venta INTEGER NOT NULL,
	id_empleado INTEGER NOT NULL,
	id_producto INTEGER NOT NULL,
	cantidad integer NOT NULL,
	FOREIGN KEY (id_venta) REFERENCES ventas (id_venta),
	FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
	FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);

----------------------INSERTS---------------------------------

--inserta empleados nuevos
INSERT INTO empleados(nombre_empleado,apellidos)
VALUES	('Ramon Ignacio','Mendoza Guerrero'),
		('Daniela','Flores Leyva'),
		('Norma','Silvina Guerrero');

--Inserta productos en distintas categorías.--
INSERT INTO productos(id_producto,nombre_producto,precio_venta,cantidad,categoria)
VALUES	(750111,'sabritas sal 100g',20,0,'frituras'),
		(750222,'sabritas limon 100g',20,0,'frituras'),
		(750333,'pan bimbo integral 150g',52,0,'abarrotes'),
		(750444,'pan bimbo blanco 150g',50,0,'abarrotes');

--Inserta proveedores.
INSERT INTO proveedores(nombre_empresa,email,numero)
VALUES 	('sabritas','sabritas_email.com',55512345),
		('bimbo','bimbo_email.com',55598765);

--registra 3 compras a distintos proveedores
INSERT INTO compras (id_proveedor,id_producto,id_empleado)
VALUES (2,750767676,1);

INSERT INTO compras (id_proveedor,id_producto,id_empleado)
VALUES (1,750232323,3)

INSERT INTO compras (id_proveedor,id_producto,id_empleado)
VALUES(3,750555111,2)

--incrementa en 5 unidades la cantidad de los productos de una categoria
    UPDATE productos
    SET cantidad = cantidad + 5  #orden
    WHERE categoria = 'frituras'   #donde/como ejecutara
    
--actualiza la fecha de contrato de los ampleados contratados antes de 2020
    UPDATE empleados
    SET fecha_contrato = GETDATE() #se actualizara a la fecha corriente
    WHERE fecha_contrato < '2020-01-01'; #ejercicio conseptual 

--inserta una venta y resta una unidad al producto vendido--
INSERT INTO ventas (id_empleado,id_producto)

VALUES(1,750767676);

UPDATE productos
SET cantidad = cantidad - 1
WHERE id_producto = 750767676;

--inserta una compra y suma una unidad al producto comprado--
INSERT INTO compras(id_proveedor,id_producto,id_empleado)

VALUES (3,750555111,1);

UPDATE productos
SET cantidad = cantidad + 3
WHERE id_producto = 750555111;


                    --CONSULTAS--

--muestra el nombre y apellido de los empleados junto con el ide de venta que hayan realizado
SELECT nombre_empleado,apellido,id_venta
FROM empleados,ventas
WHERE empleados.id_empleado = ventas.id_venta;

--Lista todas las ventas mostrando:
    --ID de la venta 
    --nombre del empleado 
    --nombre del producto

SELECT ventas.id_venta,empleados.nombre_empleado,productos.nombre_producto
FROM ventas
JOIN empleados ON ventas.id_empleado = empleados.id_empleado
JOIN productos ON ventas.id_producto = productos.id_producto;

--lista todas las ventas mostrando--
--nombre del empleado--
--nombre del producto--
--nombre del proveedor--

SELECT nombre_empleado,nombre_producto,nombre_empresa
FROM compras
INNER JOIN 	empleados ON compras.id_empleado = empleados.id_empleado
INNER JOIN productos ON compras.id_producto = productos.id_producto
INNER JOIN proveedores ON compras.id_proveedor = proveedores.id_proveedor;

--obten una lista de productos vendidos ,sin repetir productos--
SELECT DISTINCT nombre_producto
FROM productos
INNER JOIN ventas ON productos.id_producto = ventas.id_producto;--se motraran los nombres--
------------------tambien se puede agregar el id del producto a la consulta-----------------------------
SELECT DISTINCT productos.nombre_producto,productos.id_producto
FROM productos
INNER JOIN ventas ON productos.id_producto = ventas.id_producto;

-----------------muestra las ventas realizadas por los empleados mostrando nombre,apellido y ventas-------------
SELECT empleados.nombre_empleado,empleados.apellido,
COUNT (ventas.id_venta)
FROM empleados
INNER JOIN ventas ON empleados.id_empleado = ventas.id_empleado
GROUP BY empleados.nombre_empleado,empleados.apellido;

-----------------------------lista los productos que nunca se han vendido---------------------------------------
--manera simple solo recomdada en bases pequnas--
SELECT nombre_producto
FROM productos 
LEFT JOIN ventas ON productos.id_producto = ventas.id.producto
WHERE ventas id_producto IS NULL;

--recomendada, mas completa y eficiente en bases grandes--
SELECT productos.nombre_producto
FROM productos
WHERE NOT EXISTS(
    SELECT 1
    FROM ventas
    WHERE ventas.id_producto = productos.id_producto
);

----------------------------muestra los empleados que han relizado  compras pero no ventas---------------------------------
SELECT DISTINCT nombre_empleado
FROM empleados
INNER JOIN compras ON empleados.id_empleado = compras.id_empleado
WHERE NOT EXISTS(
	SELECT 1
	FROM ventas
	WHERE ventas.id_empleado = empleados.id_empleado
);

------------------------------------------Bloque 2 exercices_01026------------------------------------------
---crea tabla clientes----
CREATE TABLE clientes
(id_cliente SERIAL PRIMARY KEY,
nombre_cliente VARCHAR(30)NOT NULL,
apellidos VARCHAR (30) NOT NULL,
telefono INTEGER NOT NULL,
email VARCHAR(30),
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP)

---registra una venta a un cliente--
INSERT INTO ventas(id_empleado,id_producto,id_cliente)
VALUES(1,750123456,1);

----crea tabla intermedia: detalle_ventas---
CREATE TABLE detalle_ventas(
id_detalle SERIAL PRIMARY KEY,
id_venta INTEGER NOT NULL,
id_producto INTEGER NOT NULL,
id_cliente INTEGER NOT NULL,
FOREIGN KEY (id_venta) REFERENCES ventas (id_venta),
FOREIGN KEY (id_producto) REFERENCES productos (id_producto),
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
cantidad INTEGER,
precio_unitario NUMERIC (6,2),
fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-------agregar columna fecha_creacion,fecha atualizacion en todas las tablas-----
---repite esta sentencia en cada una de tus tablas cambiando el nombre de la tabla----
--------------a modificar en la linea ALTER TABLE---------
ALTER TABLE clientes
ADD COLUMN fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

--------------elimina la relacion directa entre ventas y productos -------------------
ALTER TABLE ventas
DROP CONSTRAINT ventas_id_producto_fkey,
ALTER TABLE ventas
DROP COLUMN id_producto;

---------------Muestra para un cliente específico, todas las ventas realizadas:-----------------
SELECT
clientes.nombre_cliente,
ventas.fecha_creado,
empleados.nombre_empleado
FROM clientes
INNER JOIN ventas ON clientes.id_cliente = ventas.id_cliente
INNER JOIN empleados ON ventas.id_empleado = empleados.id_empleado
WHERE clientes.nombre_cliente = 'Juan'
ORDER BY ventas.fecha_creado DESC;

--obten el producto mas vendido--
SELECT productos.nombre_producto,
SUM (ventas.id_venta) AS total_venta
FROM productos
INNER JOIN ventas ON productos.id_producto = ventas.id_producto
GROUP BY productos.nombre_producto
ORDER BY total_venta DESC
LIMIT 1;

---Muestra el inventario actual calculado así: suma de compras - menos suma de ventas---
SELECT
(SELECT SUM(precio) FROM ventas JOIN productos ON ventas.id_producto = productos.id_producto)
-
(SELECT SUM (precio) FROM compras JOIN productos ON compras.id_producto = productos.id_producto)
AS ganancia 



-------------------------------------------------------------------------------
------------------------BACKUP TABLA COMPRAS-----------------
INSERT INTO proveedores(nombre_empresa,email,numero)
VALUES 	('sabritas','sabritas_email.com',55512345),
		('bimbo','bimbo_email.com',55598765);

INSERT INTO productos(id_producto,nombre_producto,precio_venta,cantidad,categoria)
VALUES	(750111,'sabritas sal 100g',20,0,'frituras'),
		(750222,'sabritas limon 100g',20,0,'frituras'),
		(750333,'pan bimbo integral 150g',52,0,'abarrotes'),
		(750444,'pan bimbo blanco 150g',50,0,'abarrotes');

INSERT INTO detalle_compra(id_orden,id_proveedor,id_empleado,id_producto,cantidad)
VALUES	(1,1,1,750111,12);
UPDATE	productos
SET cantidad = cantidad + (
	SELECT SUM(cantidad)
	FROM detalle_compra
	WHERE detalle_compra.id_producto = productos.id_producto
	AND detalle_compra.id_orden = 1)
WHERE productos.id_producto IN(SELECT id_producto FROM detalle_compra WHERE id_orden = 1);

----VENTA--------
INSERT INTO ventas(id_empleado)
VALUES (1)

INSERT INTO detalle_venta(id_venta,id_empleado,id_producto,cantidad)
VALUES (1,1,750111,3);
UPDATE productos
SET cantidad = cantidad - (
	SELECT SUM(cantidad)
	FROM detalle_venta
	WHERE detalle_venta.id_producto = productos.id_producto
	AND detalle_venta.id_venta = 1)
WHERE productos.id_producto IN(SELECT id_producto FROM detalle_venta WHERE id_venta =1);