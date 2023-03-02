--Crear una tabla de llamada APP_LOG con tres campos (ID_LOG, ACCION, FECHA) y sus restricciones correspondientes--
CREATE TABLE APP_LOG
( ID_LOG number(10) NOT NULL,
  ACCION varchar2(50) NOT NULL,
  FECHA DATE,
  CONSTRAINT ID_LOG_pk PRIMARY KEY (ID_LOG)
);
--Agrega una nueva columna llamada persona a la tabla APP_LOG--
ALTER TABLE APP_LOG 
ADD persona VARCHAR2(20);

--Insertar 2 registros diferentes en la tabla APP_LOG--
INSERT INTO APP_LOG (ID_LOG, ACCION, FECHA, PERSONA)
VALUES
(12, 'CANTAR', '27/05/2022', 'RAUL');

INSERT INTO APP_LOG (ID_LOG, ACCION, FECHA, PERSONA)
VALUES
(11, 'REIR', '28/05/2022', 'RUBEN');
--Mostrar todo el contenido de la tabla APP_LOG--
SELECT
    * FROM APP_LOG;

--Crear un punto de restauración en la transacción actual llamado INICIO--
SAVEPOINT INICIO;

--Insertar 3 registros diferentes en la tabla APP_LOG--
INSERT INTO APP_LOG (ID_LOG, ACCION, FECHA, persona)
VALUES
	(13,'CORRER', '26/05/2022', 'ramon');

INSERT INTO APP_LOG (ID_LOG, ACCION, FECHA, persona)
VALUES
	(14,'BUSCAR', '25/05/2022', 'fernando');

INSERT INTO APP_LOG (ID_LOG, ACCION, FECHA, persona)
VALUES
	(15,'bailar', '24/05/2022', 'sandra');
--Volver al punto de restauración llamado INICIO--
ROLLBACK TO SAVEPOINT INICIO;

--Mostrar todo el contenido de la tabla APP_LOG--
SELECT * FROM APP_LOG;

--Modificar la tabla APP_LOG para que sea una tabla de solo lectura--
CREATE VIEW vista_log AS
SELECT ID_LOG, ACCION, FECHA, PERSONA
FROM APP_LOG;

--Eliminar la tabla APP_LOG--
DROP TABLE APP_LOG;

--Mostrar todos los comerciales--
SELECT * FROM COMERCIALES;

--Mostrar nombre, apellidos, DNI, teléfono y email de todos los comerciales--
SELECT NOMBRE, APELLIDOS, DNI, TELEFONO, EMAIL FROM COMERCIALES;

--Mostrar de todos los comerciales el nombre, apellidos, DNI, teléfono, email, salario y una nueva columna llamada SUBIDA_PROPUESTA que contendrá el salario incrementado en 1000--
SELECT NOMBRE, APELLIDOS, DNI, TELEFONO, EMAIL, SALARIO 
AS SUBIDA_PROPUESTA 
FROM COMERCIALES
WHERE SALARIO=SALARIO+1000;

--Mostrar los comerciales cuyo ID_CONCESIONARIO es igual a 1--
SELECT NOMBRE, id_concesionario FROM COMERCIALES
WHERE ID_CONCESIONARIO =1;

--Insertar en la tabla de los comerciales un nuevo registro con tus datos reales--
INSERT INTO COMERCIALES (ID_COMERCIAL,
NOMBRE,
APELLIDOS,
DNI,
TELEFONO, 
EMAIL,
DIRECCION, 
CP,
LOCALIDAD,
PROVINCIA,
COMUNIDAD_AUTONOMA,
SALARIO,
ID_CONCESIONARIO)
VALUES
(25,'RUBEN','SACRISTAN', '46407574Z',555111345,'RSACRI@CONCESIONARIOPRUEBA.COM','C',29293,'BARCELONA','BARCELONA','CATALUNA',30000,3);
--Mostrar nombre y país de todas las marcas--
SELECT NOMBRE_MARCA, pais FROM MARCA;

--Mostrar id_marca, nombre y país de aquellas marcas cuyo país sea igual a “ALEMANIA”--
SELECT ID_MARCA,NOMBRE_MARCA, pais 
FROM MARCA
WHERE pais='ALEMANIA';

--Mostrar nombre y país de aquellas marcas cuyo país empiece por la letra E--
SELECT NOMBRE_MARCA,pais 
FROM MARCA
WHERE PAIS LIKE 'E%';

--Modificar los datos de la tabla Marcas, para cambiar el nombre del país EE.UU a ESTADOS UNIDOS--
UPDATE MARCA
  SET PAIS = 'ESTADOS UNIDOS'
  WHERE PAIS='EE.UU';
 --Eliminar los registros de la tabla MARCAS cuyo PAIS sea igual a SUECIA--
DELETE FROM MARCA
WHERE PAIS = 'SUECIA';

--Mostrar todas las marcas ordenadas por su nombre--
SELECT nombre_marca
    FROM MARCA
  ORDER BY nombre_marca;

 --Mostrar los datos de todos los coches--
SELECT *
    FROM COCHES;

--Mostrar los datos de aquellos coches cuyo tipo de consumo sea GASOLINA--
SELECT *
    FROM COCHES
    where tipo_consumo='GASOLINA';

--Mostrar los datos de aquellos coches cuyo tipo de consumo sea DIESEL y tengan 5 puertas--
SELECT *
    FROM COCHES
    where tipo_consumo='DIESEL'
    and
    num_puertas=5;

--Mostrar los datos de aquellos coches cuyo color sea ROJO o NEGRO--
SELECT *
    FROM COCHES
    where color = 'ROJO'
    OR 
    COLOR= 'NEGRO';

--Mostrar los datos de aquellos coches cuyo precio sea mayor o igual a 5000 y menor o igual a 10000--
SELECT *
    FROM COCHES
    where PRECIO >=5000
    OR 
    PRECIO <= 10000;
-- Mostrar los datos de los coches que han sido vendidos, es decir, aquellos cuyo coches cuyo ID_CLIENTE es distinto de NULL--
SELECT *
    FROM COCHES
    where id_cliente 
    IS NOT NULL;
-- Mostrar todos los coches de la marca “VOLKSWAGEN”--
SELECT *
    FROM COCHES
    where MODELO = 'VOLKSWAGEN';

ALTER TABLE COCHES ADD MARCA_COCHE VARCHAR2 (20);

UPDATE COCHES SET MARCA_COCHE = 'VOLKSWAGEN'
WHERE MODELO = 'GOLF VII TDI';

UPDATE COCHES SET MARCA_COCHE = 'VOLKSWAGEN'
WHERE MODELO = 'POLO VI';

UPDATE COCHES SET MARCA_COCHE = 'VOLKSWAGEN'
WHERE MODELO = 'POLO 2007';

SELECT MODELO, MARCA_COCHE FROM COCHES
WHERE MARCA_COCHE='VOLKSWAGEN';

-- Mostrar los datos de los coches del concesionario cuyo país de origen sea “ALEMANIA”--
SELECT * FROM COCHES
WHERE ID_MARCA  IN (SELECT ID_MARCA FROM MARCA WHERE PAIS= 'ALEMANIA');

--Mostrar los datos de los coches que hayan estado en estado “Reparación” posteriores al 01/02/2018--
SELECT *FROM COCHES
WHERE ID_COCHE  IN (SELECT ID_COCHE FROM ESTADOS_COCHES WHERE FECHA >'01022018');

--Mostrar los datos de los coches que se encuentran en un estado con nombre “VEHÍCULO DE KM 0--
SELECT *
FROM COCHES
WHERE ID_COCHE IN (SELECT ID_COCHE
 FROM ESTADOS_COCHES
 WHERE ID_ESTADO IN (SELECT ID_ESTADO
 FROM ESTADOS
 WHERE NOMBRE_ESTADO = 'VEHÍCULO DE KM 0'));

