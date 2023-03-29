create database trainees

CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

select * from Trainees

insert into Trainees values (101,'Hemanth','B',50000,23-01-2023,'Developer')

insert into Trainees values (102,'Harshan','A',60000,23-01-2022,'Designer'), (103,'Hari','A',60000,23-06-2022,'Designer'), (104,'Karthi','R',70000,23-01-2022,'Developer'),(105,'Vasanth','Y',90000,20-07-2019,'CyberSecurity')

insert into Trainees values (106,'Vikram','RV',60000,23-05-2022,'Developer'), (107,'Saron','D',70000,23-06-2022,'Hr'), (108,'Siva','Barath',50000,23-09-2022,'Hr'),(109,'Selva','ganapathy',80000,20-07-2020,'Developer')

insert into Trainees values (110,'Priya','Darshan',90000,23-01-2021,'Tester'), (111,'Srikanth','Remo',80000,20-01-2022,'Developer'), (112,'Divya','Prakash',60000,23-05-2022,'Tester'),(113,'Dhana','Prakash',90000,20-01-2019,'Hr'),(114,'venkit','Raman',85000,24-10-2019,'Designer')

insert into Trainees values (115,'Arun','joseph',70000,21-09-2021,'Designer'),(116,'Vignesh','romeo',60000,23-01-2023,'Hr'),(117,'Ramji','K',75000,21-10-2020,'Developer'),(118,'Karthi','Shiva',65000,21-11-2021,'Hr'),(119,'Surya','V',55000,21-04-2021,'Designer'),(120,'Ram','Iyyer',68000,23-01-2023,'Designer')

insert into Trainees values (121,'hemanth','B',50000,23-01-2023,'Developer')



--1. Retrieve all FIRST_NAME STARTING WITH J-T and should differentiate between Uppercase and lowercase.
select * from Trainees where first_name like '[j-t]%' collate SQL_Latin1_General_cp1_cs_as



--2. Retrieve all SALARY BETWEEN 20000 TO 50000
select * from trainees where salary between 70000  and 100000


--3. Retrieve all FIRST_NAME ending with i
select * from trainees where first_name like '%i'


--4. Retrieve all salary without duplications
select distinct salary from trainees


--5. Retrieve all records whose department is Developer and Designer
select * from trainees where department='Developer'or department='designer'


--6. Retrieve all Trainee_ID less than 5
select * from trainees where trainee_id <105

--7. Limit the records by retrieving the 6 to 15 records
select * from trainees where trainee_id between 106 and 115
select * from trainees order by trainee_id offset 0 rows fetch first 5 rows only

--8. Retrieve the top 5 records with Ties
select top 5 with ties  * from  trainees order by salary 
select * from trainees order by trainee_id offset 5 rows fetch next 10 rows only

--9. Retrieve the records in descending order based on department column.
select  * from trainees order by department desc

--10. Retrieve all  last_name with 3rd character as 'a.'
select * from trainees where last_name like '__a%'


