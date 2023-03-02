SET SERVEROUTPUT ON;
    DECLARE 
    --en esta zona haremos la declaración de las variables que usaremos en begin--
NOM HR.employees.first_name %TYPE:='&Introduzca_nombre';
APELL HR.employees.last_name %TYPE:='&Introduzca_apellido';


salario_anual NUMBER;
salario_mensual NUMBER;
--La variable sueldo es la que guarda el sueldo final con el cálculo realizado--
SUELDO NUMBER;

 
BEGIN
--En esta zona estará el código PL/SQL que ejecutaremos--
salario_anual:=&salario_mensual*12;
--La variable de sustitución de salario mensual se puede poner aquí tambíen--
SUELDO:= salario_anual;


--Ahora pongo las condiciones--
    IF salario_anual >21000  then
     SUELDO:= salario_anual+ 3000;
        
     ELSIF salario_anual  BETWEEN 12000 AND 21000 then
        SUELDO:= salario_anual+ 1800;
   
            
    ELSIF salario_anual < 12000  then
             SUELDO:= salario_anual+ 1000;
           
            
    ELSE 
    --Pongo una impresión por pantalla por si falla--
    DBMS_OUTPUT.PUT_LINE ('Error en la introducción de los datos');
    
END IF;
--Impresión por pantalla--
DBMS_OUTPUT.PUT_LINE ('El sueldo anual para el Empleado:  ' ||NOM ||'  '||APELL ||' con un sueldo mensual: ' ||&salario_mensual|| ' es de:  ' ||SUELDO);
          
END;
--Indica el cierre del bloque anónimo--
