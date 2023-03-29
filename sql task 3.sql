
--creating data base
create database normalization
use normalization

--table creation Department 
create table department (
DEPTID int primary key,
DEPARTNAME varchar(25) unique not null,
)

insert into department values(100,'DEVELOPER'),(101,'UI/UI')--inserting the values

insert into department values (100,'tester')--checking the primary key 

select * from department


--table creation Address 

create table address (
addressid int primary key,
city varchar(25) unique not null,
state varchar(25)unique not null,
pincode int unique not null
)

insert into address values (1,'Mannford','Oklahoma(OK)',74044),(2,'Sidney','Ohio(OH)',45365)--inserting the values for address

insert into address values (1,'victoria','Melbourne',60909)--cheching primary key

select * from address


--creating an employee table 

create table employee (
id int primary key,
name varchar(25)not null ,
designation varchar(25) references department(DEPARTNAME),
DEPTID int references department(DEPTID),
mobile1 bigint unique not null,
mobile2 bigint unique ,
"Street_adddress" varchar(25) not null,
addressID int references address(addressid)
)
insert into employee values (1,'john','developer',100,9865741236,6325478962,'234 hinton Rd',1)--inserting values
select * from employee

insert into employee(id,name,designation,Deptid,mobile1,street_adddress,addressid) values (2,'jamie','ui/ui',101,789325698,'214 Doorley Rd',2)--inserting values and mobilenum2 is null


insert into employee values (3,'jack','developer',100,5647896523,9876543210,'236 hinton Rd',1)--inserting values


insert into employee values(4,'saron','developer',101,123476743,0987654321,'465 Hinton Rd',3)-- checking the use of primary and forgien key



select * from employee
select * FRom department
select * from address


-----------------------------------------------------------------------------------------


--demo normalization table


create table  project_details(
Project_code varchar(20) primary key,
project_name varchar(25) unique not null,
Project_manager varchar(20) unique not null,
project_budget int unique not null,

)

insert into project_details values 
('PC010','Reservation System','Mr.Ajay',120500),
('PC011','HR system','Mrs.charu',500500),
('PC012','Attendence system','Mr.Rajesh',710700)


select * from project_details

--Department table

create table Department1 (
Department_no varchar(20) primary key,
Department_name varchar(20) unique not null)

insert into Department1 values ('D01','IT'),
('D02','Testing'),('D03','Database')




--Creating main table

create table Employee3
(
Project_code varchar(20) references project_details(Project_code),
Employee_no varchar(20),
Employee_name varchar(30),
Department_no varchar(20) references Department1(Department_no),
Hourly_Rate decimal(2,2),

)
insert into Employee3 values
('PC010','S100','Mohan','D03',21.00),
('PC011','S104','Jitendra','D02',17.00),
('PC012','S109','Vikas','D01',20.60)

select * from Employee3
select * from Department1
select * from project_details

alter table employee3 alter column hourly_rate numeric (2,2)