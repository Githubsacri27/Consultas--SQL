SET SERVEROUTPUT ON;
--declaración de la función--
create or replace function getNombreApellidos
(v_id hr.employees.employee_id%TYPE) 
--tipo de valor que se devuelve--
RETURN varchar2 
IS 
--declaración de variables--
NOM employees.first_name %TYPE; 
APELL employees.last_name %TYPE; 
nom_apell VARCHAR2(40);

BEGIN
-- concatenación de nombre y apellidos--
SELECT first_name||last_name
--variable donde se guarda--
into nom_apell
from HR.employees
where employee_id = v_id;
--lo que nos devuelve--
RETURN nom_apell;
--Bloque de excepciones--
EXCEPTION 
--si el número de ID que se introduce no existe--
 WHEN no_data_found THEN 
      dbms_output.put_line('No existe el empleado con el id: '||v_id); 

END;

BEGIN
DBMS_OUTPUT.PUT_LINE ('El empleado es:  ' ||getNombreApellidos(&vv_id));
END;
