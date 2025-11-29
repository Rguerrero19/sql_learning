Manejo A-C-I-D

Atomicity (atomicidad)
Consistency (coerencia)
Insolation (aislamiento)
Durability (Durabilidad)

Atomicity: Las operaciones que forman parte de una transaccion deben completarse con exito

Consistency: Asegurar que cada tranzaccion lleva la base de datos de un estado valido a otro
tambien valido

Insolation: Capacidad de una transaccion para operar de manera independiente de otras que se ejecuten de manera simultanea

Durability: Asegura que una ves realizada una tranzaccion a sido realizada permanecera asi incluso durante un fallo de sistema o suceso fortuito

Algunos comando para controlar tranzacciones en sql son 

START TRANSACTION: Marca el inicio de una transaccion manual. Permite al usuario definir el bloque de operaciones que deben tratarse comouna unidad

COMMIT: Es un comando utilizado para finalizar una transaccion con exito. Al ejecutar COMMIT, todas las operaciones desde el ultimo SATART TRANSACCION se hacen permanentes en la base de datos

ROLLBACK: Se utiliza para deshacer todas las operaciones realizadas dentro de una transaccion actual, volviendo l estado que tenia al momento que se inicio la transaccion

                        Ejemplo consulta

CREATE TABLE cuentas(
    ID_cuenta INT PRYMARY KEY,
    saldo DECIMAL (10,2)
),

CREATE TABLE Transacciones (
    ID_transaccion INT AUTO_INCREMENT PRYMARY KEY,
    cuenta_origen INT,
    cuenta_destino INT,
    monto DECIMAL (10,2)
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--Insetar registros en la tabla cuentas--
INSERT INTO cuentas (ID_cuenta, saldo) VALUES (1, 100.00)
INSERT INTO cuentas (ID_cuenta, saldo) VALUES (2, 150.00)
INSERT INTO cuentas (ID_cuenta, saldo) VALUES (3, 300.00)

--Insertar registros en la tabla transacciones--
INSERT INTO transacciones (ID_cuenta, saldo) VALUES (1,2 200.00)
INSERT INTO transacciones (ID_cuenta, saldo) VALUES (2,3 150.00)
INSERT INTO transacciones (ID_cuenta, saldo) VALUES (3,1 100.00)

START TRANSACTION,

UPDATE cuentas
SET saldo = saldo - 100.00
WHERE ID_cuenta = 1;

UPDATE cuentas
SET saldo = saldo + 100.00
WHERE ID_cuenta = 2;

INSERT INTO transacciones (cuenta_origen, cuenta_destino, monto)
VALUES(1,2,100.00)

--Confirmar las transaccion si todas las operaciones son exitosas
COMMIT;

--Si ocurre algun error, revertir las operaciones--
ROLLBACK