                CREACION DE TABLAS NECESARIAS
    CREATE TABLE empleados
    (ID_empleado INT(5) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    fecha_contrato DATE NOT NULL);

    ALTER TABLE compras ADD CONSTRAINT empleado_compra FOREIGN KEY (ID_empleado) REFERENCES empleados(ID_empleado)


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
