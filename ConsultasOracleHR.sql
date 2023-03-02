SELECT job_id||' '||first_name||', '||last_name AS "TRABAJADORES POR PUESTO" 
FROM employees;
SELECT  LAST_NAME, department_id FROM employees 
WHERE department_id =80 
AND  FIRST_NAME LIKE '%A%';

SELECT LAST_NAME, SALARY FROM employees WHERE SALARY BETWEEN 7500 AND 12000;

SELECT LAST_NAME,job_id FROM employees 
WHERE (last_name = 'Gietz' 
OR LAST_NAME= 'Jones') 
ORDER BY HIRE_DATE DESC;

SELECT LAST_NAME,salary FROM employees 
WHERE salary NOT BETWEEN 6000 AND 10000 
AND DEPARTMENT_ID=50
OR department_id=80;

SELECT MAX (salary) as Salario_maximo, MIN (salary) as Salario_Minimo,
AVG (salary)AS MEDIA_SALARIAL,SUM (salary) AS SUMA_TOTAL  from
    employees

SELECT  DISTINCT MANAGER_ID AS Numero_de_Jefes FROM employees 

select department_id, count (employee_id)  from employees group by department_id 

SELECT employee_id, FIRST_NAME, last_name,salary 
FROM employees 
WHERE SALARY >=(SELECT AVG (SALARY) FROM employees)
ORDER BY salary

SELECT employee_id, last_name 
FROM employees
WHERE department_id IN (SELECT department_id
FROM employees
WHERE last_name like '%P%');

SELECT location_id, street_address, city,  country_name
FROM locations
NATURAL JOIN countries;

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID 
FROM employees
WHERE DEPARTMENT_ID=50
OR DEPARTMENT_ID=60
OR DEPARTMENT_ID=80
