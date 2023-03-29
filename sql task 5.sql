drop table trainees
CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
INSERT INTO Trainees
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

select * from trainees

--1. Write an SQL query to get the count of employees in each department.

Select department,count(Department) as "No of department" from trainees group by department

--2. Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.

select dateadd(day,5,joining_date)as 'induction day' from trainees

--3. Write an SQL query to retrieve the month in words from the Trainees table -JOINING_DATE Column.

SELECT CHOOSE(MONTH([JOINING_DATE]),'January','February','March','April','May','June','July','August','September','October','November','December') AS Joining_month  FROM trainees;

--4. Write an SQL query to perform the total and subtotal of salary in each department.

select COALESCE(department, 'Department Total') as Department,sum(salary) as 'department_salary'from trainees group by rollup (department);


--5. Write an SQL query to retrieve first 3 records randomly.
SELECT TOP 3 * FROM trainees ORDER BY NEWID()

--6. Show the working of composite key with any example.
CREATE TABLE Trainees1 (
TRAINEE_ID INT NOT NULL,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
constraint composite_key primary key (first_name , last_name) 
);
insert into trainees1 values (1,'h','h',10000,'2023-03-21','hr')
select * from Trainees1

--7. Show the working of IIF and CASE for the above table.
select  first_name,salary,iif(salary>300000,'senior developer','developer') as positon_details from trainees
select first_name,salary ,case when salary>300000 then 'senior developer'when salary >70000 then 'developer'else 'Trainee'
end as designation from trainees

--8. Show the working of Sequence. 
create sequence trainee_seq
as int 
start with 1
increment by 2


select  * from sys.sequences where name='trainee_seq';

--9. Show the working of creation of Synonym for a table in DB1 from DB2.
create synonym train for  demo.dbo.address

--10. Show the working of IDENTITY_INSERT.
CREATE TABLE trainees2
    (
        id INT PRIMARY KEY IDENTITY(1, 1) ,
        name VARCHAR(50) ,
        department VARCHAR(150)
    );
	SET IDENTITY_INSERT trainees2 ON;
GO  
INSERT INTO trainees2 ( id ,
                       name ,
                       department )
VALUES ( 3, 'Hemanth', 'developer' );

SET IDENTITY_INSERT trainees2 OFF;

select * from trainees2