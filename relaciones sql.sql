relaciones sql

Rellacion 1 a 1 : esta se refiere a una relacion en la que el valor de una tabla asocia
a una valor en otra tabla.

sintaxis

  CREATE TABLE ususarios (
    ID_ususario INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(30),
    direccion VARCHAR(30),
  );

  CREATE TABLE credenciales(
    ID_ususario INT AUTO_INCREMENT PRIMARY KEY, 
    nombre_ususario VARCHAR (30) NOT NULL,
    contrasena VARCHAR (30) NOT NULL,
    FOREIGN KEY (ID_ususario) REFERENCES ususarios(ID_ususario)
  );

  Esto hace una relacion de ID_ususario en la tabla ususarios hacia ID_ususario de la tabla 
  credenciales
_______________________________________________________________________________________________________
Relacion 1 a muchos esto se refiere a que un valor de una fila se asocia con uno o varios 
valores en otra tabla, pero en la tabla recionada solo puede estar asociada una fila en la tabla
principal

  CREATE TABLE bibliotecas (
    ID_bibilotecas INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (30),
    ubicacion VARCHAR (30),
  );

  CREATE TABLE libros(
    ID_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR (30),
    autor VARCHAR (30),
    ID_bibilotecas INT,
    FOREIGN KEY (ID_bibilotecas) REFERENCES bibliotecas(ID_bibilotecas)
  );
________________________________________________________________________________________________________________
Reracion muchos a muchos esto se refieere a una base de datos en la cual multiples filas
en una tabla pueden estar ralacionadas con multiples filas en otra tabla.
para manejar este tipo de base de datos en necesario crear un tabla intermedia que contenga
claves foraneas que apunten a las claves primarias de las tablas relacionadas

  CREATE TABLE estudiantes (
    ID_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (30)
    email VARCHAR (30)
  );

  CREATE TABLE cursos(
    ID_curso INT AUTO_INCREMENT PRIMARY KEY
    nombre_curso VARCHAR (30)
    descripcion VARCHAR (30)
  );

  CREATE TABLE inscripciones(
    ID_estudiante INT
    ID_curso INT
    PRIMARY KEY (ID_estudiante,ID_curso),
    FOREIGN KEY (ID_estudiante) REFERENCES estudiantes(ID_estudiante),
    FOREIGN KEY (ID_curso) REFERENCES cursos(ID_curso),
  )
  Inscripciones es la tabla que crea las relaciones a las tablas estudiantes y cursos
_______________________________________________________________________________________________________
Metodos para la implementacion de relaciones:
1.- Definicion de claves foraneas durante la creacion de la tabla
2.- Adicion de claves foraneas a tablas ya existentes con el comando ALTER TABLE

CREACION DIRECTA DE CLAVES FORANES 
Consiste en especificar la clave foranea como parte de la definicion de la tabla que actuara
como clave foranea

  CREATE TABLE departamentos(
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR (30)
  );

  CREATE TABLE empleados(
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
  );

