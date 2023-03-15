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

select * from Trainees where first_name like '[J-T]%'

select * from trainees where salary between 70000  and 100000


select * from trainees where first_name like '%i'

select * from Trainees where first_name like '[j-t]%' collate SQL_Latin1_General_cp1_cs_as

select distinct salary from trainees




select * from trainees where department='Developer'or department='designer'


select * from trainees where trainee_id < 107

select * from trainees where trainee_id between 106 and 115


select * from trainees order by trainee_id offset 0 rows fetch first 5 rows only


select  * from trainees order by department desc

select * from trainees where last_name like '__a%'

select * from trainees order by trainee_id offset 5 rows fetch next 10 rows only
