create database sqltask2
--1. Create a table with primary key, unique key, check and default constraints.
create table empDetails(
Emp_id int  primary key,
Emp_name varchar(25) unique,
Emp_salary int default  50000,
Emp_age int check(Emp_age>=18)

)



--value insertion
insert into empDetails values(1,'Hemanth',70000,20)

--primary key 
--unique key
insert into empDetails values(1,'Hemanth',70000,20)


--check value less than 18
insert into empDetails values (2,'Harshan',50000,17)


--Default key 
insert into empDetails(Emp_id,Emp_name,Emp_age) values(3,'Karthi',20)

select * from empDetails


--2. Rename a table, database & schema.


--Table Rename
exec sp_rename'empDetails','EMP_DETAILS'

select * from empdetails--invalid db name

select * from emp_details--valid db name

--DATABASE rename
exec sp_renamedb 'sqltask2','SQL_TASK2'

use sqltask2--invalid db name

use SQL_TASK2--valid db nmae


--SCHEMA 

create schema sql2
create table sql2.t1
(id int,
name varchar(25))
insert into sql2.t1 values(101,'hemanth')

insert into sql2.t1 values(102,'harshan')

select * from sql2.t1

----SCHEMA rename
create schema task2

alter schema task2 transfer sql2.t1

select * from task2.t1

--3. Create a table with the following fields:
  --a. id as identity column, name, salary, increment, computed column as Revised salary(sal+inc)
  
create table details (
id int identity (1,1),
name varchar(25),
salary int ,
increment int,
)
select * from details

insert into details values('hemanth',50000,20000)
insert into details values('harshan',50000,10000),('Karthi',70000,5000),('hari',60000,10000)

alter table details add   Revisedsalary as (salary+increment)

----b. Retrieve all the records whose salary is >20000 and move them into a new table using (SELECT INTO)
select * into employee_details from details where salary > 55000

select  * from employee_details