CREATE DATABASE ignacio_tienda

----------------------------TABLES---------------------------
CREATE TABLE empleados
(id_empleado  SERIAL PRIMARY KEY ,
nombre_empleado VARCHAR(20) NOT NULL,
apellido VARCHAR(20) NOT NULL,
fecha_contrato DATE DEFAULT CURRENT_DATE);

CREATE TABLE productos
(id_producto INTEGER PRIMARY KEY,
nombre_producto VARCHAR(30) NOT NULL,
categoria VARCHAR(20) NOT NULL,
cantidad INTEGER NOT NULL);

CREATE TABLE proveedores
(id_proveedor SERIAL PRIMARY KEY,
nombre_empresa VARCHAR(30),
contacto VARCHAR(30) NOT NULL);

CREATE TABLE ventas
(id_venta SERIAL PRIMARY KEY,
id_empleado INTEGER,
id_producto INTEGER,
FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
FOREIGN KEY (id_producto) REFERENCES productos (id_producto));

CREATE TABLE  compras
(id_compra SERIAL PRIMARY KEY,
id_proveedor INTEGER,
id_producto INTEGER,
id_empleado INTEGER,
FOREIGN KEY (id_proveedor) REFERENCES proveedores (id_proveedor),
FOREIGN KEY (id_producto)  REFERENCES productos (id_producto), 
FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado));

----------------------INSERTS---------------------------------

--inserta 3 empleados nuevos
INSERT INTO empleados (nombre_empleado,apellido)
VALUES('Ignacio,mendoza');

INSERT INTO empleados (nombre_empleado,apellido)
VALUES('Daniela','flores');

INSERT INTO empleados (nombre_empleado,apellido)
VALUES('Norma','Silvina');

--Inserta 5 productos en distintas categorías.--
INSERT INTO productos VALUES
(750767676,'sidral mundet 2L','refrescos familiares',12),
(750232323,'sabritas original 50g','frituras',12),
(750123456,'pan dulce','frescos',12),
(750555111,'leche monarca 1.8L','lacteos',12),
(750333555,'vino tinto cavernet','vinos y licores',12);

--Inserta 3 proveedores.
INSERT INTO proveedores (nombre_empresa,contacto)
VALUES ('sabritas','5551234567');

INSERT INTO proveedores (nombre_empresa,contacto)
VALUES ('coca cola','5557654321');

INSERT INTO proveedores (nombre_empresa,contacto)
VALUES('lala','correo_lala.com')

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

SELECT id_venta,nombre,nombre_producto
FROM empleados,productos
WHERE empleados.id_venta = ventas.id_venta
--incompleto--



