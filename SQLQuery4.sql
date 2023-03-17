
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