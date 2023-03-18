CREATE DATABASE ORG;

USE ORG;

CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT VARCHAR(25)
);

SELECT * FROM WORKER
TRUNCATE TABLE WORKER

INSERT INTO Worker VALUES

(001, 'Monika', 'Arora', 100000, '2020-02-14 09:00:00 ', 'HR'),

(002, 'Niharika', 'Verma', 80000, '2011-06-14 09:00:00 ', 'Admin'),

(003, 'Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),

(004, 'Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),

(005, 'Vivek', 'Bhati', 500000, '2011-06-14  09:00:00', 'Admin'),

(006, 'Vipul', 'Diwan', 200000, '2011-06-14  09:00:00', 'Account'),

(007, 'Satish', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),

(008, 'Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin');

CREATE TABLE Bonus (WORKER_REF_ID INT,BONUS_AMOUNT INT,BONUS_DATE DATETIME,FOREIGN KEY (WORKER_REF_ID)REFERENCES 
Worker(WORKER_ID)ON DELETE CASCADE);

SELECT * FROM BONUS
TRUNCATE TABLE BONUS

INSERT INTO Bonus VALUES
(001, 5000, '2020-02-16'),
(002, 3000, '2011-06-16'),
(003, 4000, '2020-02-16'),
(001, 4500, '2020-02-16'),
(002, 3500, '2011-06-16');


CREATE TABLE Title (WORKER_REF_ID INT,WORKER_TITLE VARCHAR(25),AFFECTED_FROM DATETIME,FOREIGN KEY (WORKER_REF_ID)REFERENCES
Worker(WORKER_ID)ON DELETE CASCADE);

INSERT INTO Title(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

SELECT * FROM TITLE

SELECT * FROM BONUS

SELECT * FROM WORKER

------Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker tableusing the alias name as <WORKER_NAME>. 


        select FIRST_NAME as WORKER_NAME from WORKER



---------Q-2. Write an SQL query to fetch “FIRST_NAME” fromWorker table in upper case. 

        SELECT UPPER(FIRST_NAME) FROM WORKER 


---------Q-3. Write an SQL query to fetch unique values of DEPARTMENTfrom Worker table. 

         SELECT DISTINCT DEPARTMENT FROM WORKER 

------------Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table. 

         SELECT  SUBSTRING (FIRST_NAME,1,3) FROM WORKER

-----------Q-5. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

          SELECT DISTINCT DEPARTMENT,LEN(DEPARTMENT) AS LENGTH_DEPARTMENT FROM WORKER

-----------Q-6. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. Aspacechar should separate them. 

             SELECT CONCAT(CONCAT(FIRST_NAME,' '),LAST_NAME) AS COMPLETE_NAME  FROM WORKER


----------Q-7. Write an SQL query to print details for Workers with the first nameas “Vipul” and “Satish” from Worker table. 

           SELECT * FROM WORKER WHERE FIRST_NAME= 'VIPUL' OR FIRST_NAME= 'SATISH'

----------Q-8. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”. 

            SELECT * FROM WORKER WHERE DEPARTMENT='ADMIN'


-----------Q-9. Write an SQL query to print details of the Workers whoseFIRST_NAME ends with ‘a’. 

             SELECT  * FROM WORKER WHERE FIRST_NAME  LIKE '%A'


-----------Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

           SELECT * FROM WORKER WHERE FIRST_NAME LIKE'%A%'