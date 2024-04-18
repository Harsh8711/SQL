use hr;


-- 1. Display all information in the tables EMP and DEPT. 
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- 2. Display only the hire date and employee name for each employee. 
SELECT HIRE_DATE,FIRST_NAME FROM EMPLOYEES;

-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME,' AND ',JOB_ID)AS EMPLOYEES_AND_TITLE FROM EMPLOYEES;

-- 4. Display the hire date, name and department number for all clerks. 
SELECT HIRE_DATE,FIRST_NAME,DEPARTMENT_ID FROM EMPLOYEES WHERE JOB_ID ='PU_CLERK';

-- 5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT 
SELECT CONCAT(EMPLOYEE_ID,',',FIRST_NAME,',',LAST_NAME,',',EMAIL,',',PHONE_NUMBER,',',HIRE_DATE,',',JOB_ID,',',SALARY,',',COMMISSION_PCT,',',MANAGER_ID,',',DEPARTMENT_ID)AS THE_OUTPUT FROM EMPLOYEES;

-- 6. Display the names and salaries of all employees with a salary greater than 2000. 
SELECT FIRST_NAME FROM EMPLOYEES WHERE SALARY > 8000;

-- 7. Display the names and dates of employees with the column headers "Name" and "Start Date" 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME)AS NAME,(HIRE_DATE)AS START_DATE FROM EMPLOYEES;

-- 8. Display the names and hire dates of all employees in the order they were hired. 
SELECT FIRST_NAME,HIRE_DATE FROM EMPLOYEES ORDER BY HIRE_DATE;

-- 9. Display the names and salaries of all employees in reverse salary order. 
SELECT FIRST_NAME,SALARY FROM EMPLOYEES ORDER BY SALARY DESC;

-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME)AS FULL_NAME,DEPARTMENT_ID,COMMISSION_PCT,SALARY FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL ORDER BY SALARY DESC;

-- 11. Display the last name and job title of all employees who do not have a manager 
SELECT LAST_NAME,JOB_ID FROM EMPLOYEES WHERE MANAGER_ID IS NULL;

-- 12. Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
SELECT LAST_NAME,JOB_ID,SALARY FROM EMPLOYEES WHERE (JOB_ID = 'S	A_MAN' OR JOB_ID = 'ST_CLEARK') AND SALARY NOT IN (2500,3500,5000);




-- 1) Display the maximum, minimum and average salary and commission earned. 
SELECT MAX(SALARY),MIN(SALARY),MAX(SALARY) - MIN(SALARY)AS AVERAGE_SALARY FROM EMPLOYEES;

-- 2) Display the department number, total salary payout and total commission payout for each department.
SELECT department_ID,SUM(salary) AS total_salary_payout,SUM(commission_PCT) AS total_commission_payout FROM EMPLOYEES GROUP BY department_ID;

-- 3) Display the department number and number of employees in each departmen
SELECT DEPARTMENT_ID,COUNT(EMPLOYEE_ID)AS NUMBER_OF_EMPLOYEES FROM EMPLOYEES GROUP BY EMPLOYEE_ID;

-- 4) Display the department number and total salary of employees in each department. 
 SELECT DEPARTMENT_ID,SUM(SALARY)AS TOTAL_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
 
-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name
SELECT FIRST_NAME FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL ORDER BY 1;

-- 6) Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately
select concat(first_name,' ',last_name)as full_name,department_id,commission_pct from employees where commission_pct is null;

SELECT * FROM EMPLOYEES;
-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME)AS EMPLOYEES_NAME,SALARY,IF(COMMISSION_PCT IS NOT NULL,COMMISSION_PCT * 2,'NO COMMISSION') AS COMMISSION_PCT FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL OR COMMISSION_PCT IS NOT NULL ;

-- 8) Display the employee's name, department id who have the first name same as another employee in the same department
SELECT E.FIRST_NAME AS EMPLOYEES_NAME,E.DEPARTMENT_ID AS EMPLOYEE FROM EMPLOYEES E LEFT JOIN EMPLOYEES S ON S.FIRST_NAME =E.FIRST_NAME;

-- 9) Display the sum of salaries of the employees working under each Manager.
SELECT SUM(SALARY)AS SALARY,MANAGER_ID FROM EMPLOYEES GROUP BY MANAGER_ID;

-- 10) Select the Managers name, the count of employees working under and the department ID of the manager. 
select count(*),department_id from employees group by department_id;

-- 11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!
SELECT M.Manager_ID, E.FIRST_NAME, E.Department_ID, E.Salary FROM Employees E JOIN EMPLOYEES M ON E.Employee_ID = M.Manager_ID WHERE SUBSTRING(E.FIRST_Name, 2, 1) = 'a'GROUP BY M.Manager_ID, E.FIRST_Name, E.Department_ID, E.Salary;

-- 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.   
SELECT DEPARTMENT_ID,AVG(SUM_SALARY) AS AVG_SALARY FROM (SELECT DEPARTMENT_ID,SUM(SALARY)AS SUM_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT_ID) AS DEPARTMENT_SALARIES GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID ;

-- 13) Select the maximum salary of each department along with the department id 
SELECT DEPARTMENT_ID,MAX(SALARY)AS MAX_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1
SELECT COMMISSION_PCT  FROM EMPLOYEES WHERE (COMMISSION_PCT * 0.10) LIMIT 1;

SELECT * FROM EMPLOYEES;





-- 1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label. 
select upper(substring(last_name,2,1)) || lower(substring(last_name,3)) as last_name from employees;

-- 2. Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.
select concat(first_name,' ',last_name) as full_name ,month(hire_date) as joining_month from employees;

-- 3. Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label. 
SELECT LAST_NAME,IF ((SALARY*1/2)>10000,(SALARY*1.1),(SALARY*1.115)) AS MODIFY_SALARIES,500 AS BOUNS_AMT FROM EMPLOYEES;

--  4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$! 
SELECT CONCAT(SUBSTRING(employee_id, 1, 2), '00', SUBSTRING(employee_id, 3), 'E') AS modified_employee_id,
department_id,salary,UPPER(REPLACE(first_name, 'z', '$!')) AS modified_first_name FROM employees;

-- 5. Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names
SELECT CONCAT(LOWER(SUBSTRING(LAST_NAME,1,1)),LOWER(SUBSTRING(LAST_NAME,2))) AS "LAST_NAME FORMATTED" FROM EMPLOYEES  WHERE LAST_NAME LIKE 'J%' OR LAST_NAME LIKE 'A%' OR LAST_NAME LIKE 'M%' ORDER BY LAST_NAME;

-- 6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY
SELECT last_name,CONCAT('$', LPAD(salary, 15, '$')) AS SALARY FROM employees;

-- 7. Display the employee's name if it is a palindrome 
select first_name as palindromeEmployees from employees where lower(first_name) =lower(reverse(first_name));

-- 8. Display First names of all employees with initcaps.
SELECT CONCAT(UPPER(SUBSTRING_INDEX(first_Name, ' ', 1)), 
LOWER(SUBSTRING(SUBSTRING_INDEX(first_Name, ' ', -1), 1))) AS FirstNames FROM Employees;

-- 9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column. 
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(STREET_ADDRESS, ' ', 2), ' ', -1) AS WordBetweenFirstAndSecondSpace FROM LOCATIONS;
 
-- 10. Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name.
select concat(lower(left(first_name,1)),last_name,'@systechusa.com')as email_address,first_name from employees;

-- 11. Display the names and job titles of all employees with the same job as Trenna
select first_name,job_id from employees where job_id = (select job_id from employees where job_id = 'trenna');

-- 12. Display the names and department name of all employees working in the same city as Trenna. 
 select e.first_name,d.department_name from employees e join departments d on e.department_id =d.department_id where e.city in (select city from locations where city ='trenna');
 
-- 13. Display the name of the employee whose salary is the lowest
select first_name from employees where salary=(select min(salary) from employees);

-- 14. Display the names of all employees except the lowest paid
select first_name from employees where salary>(select min(salary) from employees);




-- 1. Write a query to display the last name, department number, department name for all employees.
select e.last_name,e.department_id,d.department_name from employees e join departments d on e.department_id =d.department_id ;

-- 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output.
select distinct j.job_title,j.job_id,l.location_id,d.department_id from employees e join departments d on e.department_id=d.department_id and d.department_id=40 join jobs j on e.job_id=j.job_id join locations l on d.location_id=l.location_id ;
select * from employees;

-- 3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.
SELECT e.Last_Name,d.Department_Name,l.Location_ID,l.City FROM Employees e JOIN Departments d ON e.Department_ID = d.Department_ID 
JOIN Locations l ON d.Location_ID = l.Location_ID 
WHERE e.Employee_ID IN (SELECT Employee_ID FROM EMPLOYEES WHERE Commission_PCT IS NOT NULL);

-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name  
SELECT E.LAST_NAME,D.DEPARTMENT_ID FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID WHERE LAST_NAME LIKE "%A%";

-- 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.
SELECT E.LAST_NAME,J.JOB_TITLE,D.DEPARTMENT_ID,D.DEPARTMENT_NAME FROM EMPLOYEES E JOIN JOBS J ON E.JOB_ID = J.JOB_ID JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID  WHERE L.CITY = "South San Francisco";

-- 6. Display the employee last name and employee number along with their manager's last name and manager number. 
SELECT E.LAST_NAME AS EMP_LAST_NAME,E.EMPLOYEE_ID AS EMP_EMPLOYEE_ID,M.LAST_NAME AS MANAGERLAST_NAME,M.EMPLOYEE_ID AS MANAGEREMPLOYEE_ID FROM EMPLOYEES E LEFT JOIN EMPLOYEES M ON  M.MANAGER_ID = E.EMPLOYEE_ID;

-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager). 
select e.employee_id,e.last_name,s.manager_id,s.last_name from employees e join employees s on e.employee_id=s.employee_id;

-- 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 
SELECT e.Last_Name AS EmployeeLastName,
    e.Department_ID AS DepartmentNumber,
    e2.Last_Name AS ColleagueLastName
FROM Employees e
JOIN Employees e2 ON e.Department_ID = e2.Department_ID
WHERE e.Employee_ID = e2.Employee_ID;

-- 10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date
SELECT e.first_Name AS EmployeeName,e.Hire_Date AS emp_hire_date,m.first_Name AS ManagerName,m.Hire_Date AS man_hire_date FROM Employees e JOIN Employees m ON e.Manager_ID = m.Employee_ID WHERE e.Hire_Date < m.Hire_Date;

select * from employees;
select * from departments;





-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES. 
select last_name,hire_date from employees where department_id=(select department_id from departments where department_name ='Sales');

-- 2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary. 
select employee_id,last_name from employees where salary > (select avg(salary) from employees ) order by salary asc;

-- 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u
select employee_id,last_name from employees where department_id in ( select distinct employee_id from employees where last_name like '%u%');

-- 4. Display the last name, department number, and job ID of all employees whose department location is ATLANTA.
select e.last_name,e.department_id,e.job_id,l.state_province from employees e join departments d on e.department_id=d.department_id join locations l on d.location_id=l.location_id where l.state_province="atlanta";


-- 5. Display the last name and salary of every employee who reports to FILLMORE.
select e.last_name,e.salary from employees e join employees m on e.manager_id=m.manager_id where m.last_name='fillmore';

-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department.
select e.last_name,e.job_id,d.department_name from employees e join departments d on e.department_id=d.department_id where d.department_name='operations';

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with a 'u'in their name.
SELECT e.employee_id, e.last_name, e.salary FROM employees e JOIN departments d ON e.department_id = d.department_id WHERE e.salary > 
(SELECT AVG(salary) FROM employees)AND d.department_id IN (
SELECT DISTINCT department_id FROM employees WHERE last_name LIKE '%u%');

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept.  
SELECT e.last_name FROM employees e
JOIN employees s ON e.job_id = s.job_id JOIN departments d ON s.department_id = d.department_id
WHERE d.department_name = 'SALES';

-- 9. Write a compound query to produce a list of employees showing raise percentages, 
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,--  
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are--  
-- given a 15% raise, and employees in department 6 are not given a raise.-- 
select employee_id,salary*1.05  as new_salary from employees where department_id in(10,30);
select employee_id,salary*1.1 as new_salary from employees where department_id in (20);
select employee_id,salary*1.15 as new_salary from employees where department_id in(40,50);
select employee_id,salary*1.15 as new_salary from employees where department_id in(60);

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries. 
select last_name,salary from employees order by salary desc limit 3;

-- 11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column
SELECT last_name, salary, COALESCE(commission_pct, 0) AS commission FROM employees;

-- 12. Display the Managers (name) with top three salaries along with their salaries and department information.  wrong -- 
select concat(e.first_name,'',e.last_name)as mananger_name,e.salary from employees e join employees m on e.employee_id=m.manager_id order by salary desc limit 3;
