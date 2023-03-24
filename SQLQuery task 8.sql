create database TASK8

use task8

create table Student_details(Student_id int,Student_name varchar(30),semester varchar(25),securedmarks int,totalmark int)

insert into Student_details values(1,'Hari','Sem 1',499,500),(2,'Harshan','Sem 1',490,500),(3,'Karthi','Sem 1',480,500),(4,'Siva','Sem 1',485,500)
insert into Student_details values(1,'Hari','Sem 2',496,500),(2,'Harshan','Sem 2',495,500),(3,'Karthi','Sem 2',485,500),(4,'Siva','Sem 2',487,500)
insert into Student_details values(1,'Hari','Sem 3',498,500),(2,'Harshan','Sem 3',496,500),(3,'Karthi','Sem 3',484,500),(4,'Siva','Sem 3',488,500)

select * from Student_details

--1. Create User-define Scalar function to calculate percentage of all students after
create function Percentage_mark(@securedmarks int,@totalmark int)
returns numeric(5,2)
as
begin 
declare @percentage decimal(5,2)
set @percentage =(@securedmarks*100)/@totalmark
return @percentage
end

select *,dbo.Percentage_mark(securedmarks,totalmark)as percentage from Student_details

--2. Create user-defined function to generate a table that contains result of Sem 3 students.
Alter function Sem3_result(@semester varchar(20))
returns @result  table(student_id int,student_name varchar(25),semester varchar(20),securedmarks int,totalmarks int)
as
begin 
insert into @result 
select * from Student_details where semester=@semester
return
end

select *  from dbo.Sem3_result('sem 3') as SEM3_result



--3. Write SQL stored procedure to retrieve all students details. (No parameters)

create procedure sp_Display_details 
as
select * from Student_details
go

exec Display_details

--4. Write SQL store procedure to display Sem 1 students details. (One parameter)

create procedure sp_Display_details_sem1 @semester varchar(25)
as 
select * from Student_details where semester =@semester
go

exec Display_details_sem1 @semester ='Sem 1'
--5. Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)

create Procedure sp_Display_output_parameter @student_count int output
as
begin
select @student_count = count(Student_id) from  Student_details
end;

declare @student_count int

exec sp_Display_outpt_parameter @student_count output
print @student_count 

--6. Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.
--Note: Update few values in students details so that you can see the working of UPDATE.


select * into student_details_backup from Student_details ;

select * from Student_details 
 select * from student_details_backup