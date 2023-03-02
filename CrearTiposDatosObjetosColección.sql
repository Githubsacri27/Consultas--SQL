--Crear un nuevo tipo de dato denominado “tipo_notas”, que sea un VARRAY de NUMBER(2) que almacene las 5 notas de un alumno.--

CREATE OR REPLACE TYPE tipo_notas AS VARRAY (2) OF NUMBER;
--Utilizar el tipo de datos “tipo_notas”, para crear un nuevo tipo de dato denominado “tipo_alumno” que tenga los siguientes atributos:--
--numero_matricula NUMBER--
--nombre VARCHAR2(200)--
--notas tipo_notas--

CREATE OR REPLACE TYPE tipo_alumnos AS OBJECT(
numero_matricula NUMBER,
nombre VARCHAR2(200),
notas tipo_notas
);

--Usar un objeto 'tipo_alumno' para crear una nueva tabla usándolo como plantilla y añadiendo la restricción del que el número de matrícula es la clave primaria.--
CREATE TABLE ALUMNOS OF tipo_alumnos(
numero_matricula CONSTRAINT pk_numero_matricula PRIMARY KEY);

--Insertar un alumno nuevo con los siguientes datos:--
--Numero_matricula = (El DNI del autor de la tarea).--
--Nombre = (Nombre y apellidos del autor de la tarea)--
--Notas = {10, 9, 8, 10, 8}--

INSERT INTO ALUMNOS 
VALUES (46407574,'Ruben Sacristan Mor',tipo_notas(10-9-8-10-10-8));

SELECT * FROM ALUMNOS;