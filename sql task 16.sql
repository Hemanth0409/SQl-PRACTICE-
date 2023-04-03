create database task16 
use task16

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


--1. Create a DML trigger to restrict DML operations on Saturday and Sunday.

create TRIGGER restrict_DML_operations 
ON trainees
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF DATEPART(DW,GETDATE())= 7 or DATEPART(DW,GETDATE())= 1
  BEGIN
    PRINT 'DML OPERATIONS ARE RESTRICTED ON SATURDAY AND SUNDAY'
    ROLLBACK TRANSACTION
  END
END
INSERT INTO Trainees values(010, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin')

--2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM.
create trigger restrict_delete_operations
on trainees
for delete 
as 
begin 
if datepart(hh,getdate()) between 11 and 15
print 'DML trigger to restrict delete operations between 11:00AM to 15:00PM'
rollback transaction
end

delete from Trainees where TRAINEE_ID =007


--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.

create trigger DDL_trigger
on database
for create_table,alter_table,drop_table,rename
as 
begin
print 'Notify whenever a CREATE, ALTER, DROP, RENAME operation is performed'
rollback tran
end
--working ddl triggers
create table emp(id int)--create table 
alter table trainees drop column last_name--alter table
drop table trainees--drop table
EXEC sp_rename 'trainees',' trainees_details'--rename 