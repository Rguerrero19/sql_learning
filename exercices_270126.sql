CREATE DATABASE ignacio_tienda

                CREACION DE TABLAS NECESARIAS
    CREATE TABLE empleados
    (ID_empleado INTEGER PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    fecha_contrato DATE NOT NULL);

    CREATE TABLE productos
    (ID_producto INTEGER PRIMARY KEY,
    nombre_producto VARCHAR(30)NOT NULL, 
    categoria VARCHAR(30)NOT NULL, 
    cantidad INTEGER NOT NULL);

    CREATE TABLE proveedores
    (ID_proveedor INTEGER PRIMARY KEY, 
    empresa VARCHAR(20), 
    nombre_proveedor VARCHAR(20), 
    contacto VARCHAR(20) NOT NULL);

    CREATE TABLE ventas 
    (ID_venta INTEGER NOT NULL,
    ID_empleado INTEGER NOT NULL,
    ID_producto INTEGER NOT NULL);

    CREATE TABLE compras 
    (ID_compra INTEGER NOT NULL,
    ID_empleado INTEGER NOT NULL,
    ID_producto INTEGER NOT NULL,
    ID_proveedor INTEGER NOT NULL);



                    INSERTS

Inserta 3 empleados nuevos.
    INSERT INTO empleados VALUES
    (1001,'Ignacio','Mendoza','2026-01-27'),
    (1002,'Daniela','Flores','2026-01-27'),
    (1003,'Norma','Silvina','2026-01-27');

Inserta 5 productos en distintas categorías.
    INSERT INTO productos VALUES
    (750767676,'sidral mundet 2L','refrescos familiares',12),
    (750232323,'sabritas original 50g','frituras',12),
    (750123456,'pan dulce','frescos',12),
    (750555111,'leche monarca 1.8L','lacteos',12),
    (750333555,'vino tinto cavernet','vinos y licores',12);

Inserta 2 proveedores.
    INSERT INTO proveedores VALUES
    (000456,'sabritas','carlos','5551234567'),
    (001782,'coca cola','abraham','5557654321');

creacion de ralaciones (llaves foraneas)
    ALTER TABLE ventas
    ADD CONSTRAINT ventas_empleado
    FOREIGN KEY (ID_empleado) 
    REFERENCES empleados(ID_empleado);

    ALTER TABLE compras 
    ADD CONSTRAINT empleado_compra 
    FOREIGN KEY (ID_empleado) 
    REFERENCES empleados(ID_empleado);

registra 3 compras a distintos proveedores
    INSERT INTO compras (ID_compra, ID_empleado, ID_producto, ID_proveedor) 
    VALUES (10,1001,750232323,000456)
