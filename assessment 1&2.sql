CREATE DATABASE ASSESSMENT;
USE ASSESSMENT;

CREATE TABLE WORKERS (WORKER_ID BIGINT,
FIRST_NAME VARCHAR(15),
LAST_NAME VARCHAR(15),
SALARY INT,
JOINING_DATE TIMESTAMP,
DEPARTMENT TEXT);

INSERT INTO WORKERS (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
VALUE (1,'MONIKA','ARORA',100000,'2014-02-20 9:00','HR'),
(2,'NIHARIKA','VERMA',80000,'2014-06-11 9:00','ADMIN'),
(3,'VISHAL','SINGHAL',300000,'2014-02-20 9:00','HR'),
(4,'AMITABH','SINGH',500000,'2014-02-20 9:00','ADMIN'),
(5,'VIVEK','BHATI',500000,'2014-06-11 9:00','ADMIN'),
(6,'VIPUL','DIWAN',200000,'2014-06-11 9:00','ACCOUNT'),
(7,'SATISH','KUMAR',75000,'2014-01-20 9:00','ACCOUNT'),
(8,'GEETIKA','CHAUHAN',90000,'2014-04-11 9:00','ADMIN');

SELECT * FROM WORKERS;

-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
-- Ascending and DEPARTMENT Descending.--  
SELECT * FROM WORKERS ORDER BY FIRST_NAME ASC,DEPARTMENT DESC; 

-- 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” 
-- from the Worker table. --  
SELECT * FROM Worker WHERE first_name IN ('Vipul', 'Satish'); 

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
-- contains six alphabets.--   
SELECT * FROM WORKERS 
WHERE FIRST_NAME LIKE '_____H';

-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 1.--
  SELECT * FROM WORKERS 
  WHERE SALARY BETWEEN 100000 AND 200000;
  
-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. --
  SELECT FIRST_NAME , LAST_NAME , COUNT(*) 
  FROM WORKERS 
  GROUP BY FIRST_NAME , LAST_NAME HAVING COUNT(*) > 1 ;
  
  -- 6. Write an SQL query to show the top 6 records of a table.--
  SELECT * FROM WORKERS LIMIT 6;
  
  -- 7. Write an SQL query to fetch the departments that have less than five people in them.--
  SELECT DEPARTMENT 
  FROM WORKERS 
  WHERE DEPARTMENT IN (SELECT DEPARTMENT FROM WORKERS GROUP BY DEPARTMENT HAVING COUNT(*) <5);
  
  -- 8. Write an SQL query to show all departments along with the number of people in there.--
  SELECT DEPARTMENT , COUNT(*) 
  FROM WORKERS
  GROUP BY DEPARTMENT HAVING COUNT(*);
  
  --  9. Write an SQL query to print the name of employees having the highest salary in each department.--
  SELECT FIRST_NAME , SALARY , DEPARTMENT 
  FROM WORKERS 
  WHERE SALARY = (SELECT MAX(SALARY) FROM WORKERS GROUP BY DEPARTMENT);
  
  
  
  CREATE TABLE STUDENT(STD_ID INT PRIMARY KEY ,
 STD_NAME VARCHAR (20),
 SEX VARCHAR (20),
 PERCENTAGE TEXT,
 CLASS TEXT,
 SEC VARCHAR(10),
 STREAMS VARCHAR (20),
 DOB DATE 
 );

SELECT * FROM STUDENT;

INSERT INTO STUDENT (STD_ID,STD_NAME,SEX,PERCENTAGE,CLASS,SEC,STREAMS,DOB)
VALUES (1001,'SUREKHA JOSHI','FEMALE',82,12,'A','SCIENCE','1998-03-08'),
(1002,'MAAHI AGARWAL','FEMALE',56,11,'C','COMMERCE','2008-11-23'),
(1003,'SANAM VERMA','MALE',59,11,'C','COMMERCE','2006-06-29'),
(1004,'RONIT KUMAR','MALE',63,11,'C','COMMERCE','1997-11-05'),
(1005,'DIPESH PULKIT','MALE',78,11,'B','SCIENCE','2003-09-14'),
(1006,'JAHANVI PURI','FEMALE',60,11,'B','COMMERCE','2008-11-08'),
(1007,'SANAM KUMAR','MALE',23,12,'F','COMMERCE','1998-03-08'),
(1008,'SAHIL SARAS','MALE',56,11,'C','COMMERCE','2008-11-07'),
(1009,'AKSHRA AGARWAL', 'FEMALE',72,12,'B','COMMERCE','1996-10-01'),
(1010,'STUTI MISHRA','FEMALE',39,11,'F','SCIENCE','2008-11-23'),
(1011,'HARSH AGARWAL','MALE',42,11,'C','SCIENCE','1998-03-08'),
(1012,'NIKUNJ AGARWAL','MALE',49,12,'C','COMMERCE','1998-11-28'),
(1013,'AKRITI SAXENA','FEMALE',89,12,'A','SCIENCE','2008-11-23'),
(1014,'TANI RASTOGI','FEMALE',82,12,'A','SCIENCE','2008-11-23');


SELECT * FROM STUDENT;


-- 1 To display all the records form STUDENT table.-- 
SELECT * FROM STUDENT;

-- 2. To display any name and date of birth from the table STUDENT.--  
SELECT Std_Name, DOB FROM student ;

--  3. To display all students record where percentage is greater of equal to 80 FROM student table.--  
SELECT * FROM student WHERE percentage >= 80; 

-- 4. To display student name, stream and percentage where pe,PERrcentage of student is more than 80 -- 
SELECT STD_NAME,STREAMS,PERCENTAGE FROM STUDENT WHERE PERCENTAGE>80;

-- 5. To display all records of science students whose percentage is more than 75 form student table.-- 
SELECT * FROM STUDENT WHERE STREAMS = 'SCIENCE'AND PERCENTAGE >75;
  
  
  
  
  
  
  


  
  
