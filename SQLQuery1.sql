create database demo


use master

use demo



create table Emp_Details(Emp_id int,Emp_name varchar(20),designation varchar(20),Salary int)
select * from Emp_Details
insert into Emp_Details values (101,'hemanth','tester',50000),(102,'harshan','designer',60000),(103,'ramji','developer',70000),(104,'karthi','developer',90000)


alter table Emp_Details  drop column designation

truncate table Emp_Details
drop table Emp_Details