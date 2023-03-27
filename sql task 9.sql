
use task9

create table Student_details(Student_id int,Student_name varchar(30),semester varchar(25),securedmarks int,totalmark int)

insert into Student_details values(1,'Hari','Sem 1',499,500),(2,'Harshan','Sem 1',490,500),(3,'Karthi','Sem 1',480,500),(4,'Siva','Sem 1',485,500)
insert into Student_details values(5,'Hari','Sem 2',496,500),(6,'Harshan','Sem 2',495,500),(7,'Karthi','Sem 2',485,500),(8,'Siva','Sem 2',487,500)
insert into Student_details values(9,'Hari','Sem 3',498,500),(10,'Harshan','Sem 3',496,500),(11,'Karthi','Sem 3',484,500),(12,'Siva','Sem 3',488,500)

select * from Student_details

truncate  table student_details


---1. Write a Stored Procedure in SQL using conditional statements to search for a record from the students table (created in SQL Task 8) based on studentname column.
create procedure SP_studentname (@student_name varchar(25))
as 
begin 
select * from student_details where Student_name=@student_name
end
--exec Type
exec Sp_studentname  @Student_name='Hari'
--or
exec Sp_studentname 'Hari'


--2. Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.
alter procedure Sp_remarks 
as 
begin 
select * ,
case  
   when (securedmarks >= 495 and securedmarks<= 500) then 'Very Good,Keep it Up'
   when (securedmarks >= 490 and securedmarks< 495) then 'Very Good,Need Improvement'
   when (securedmarks >= 485 and securedmarks< 490) then 'Focus more on lagging concepts'
   when (securedmarks >= 480 and securedmarks< 485)  then 'Need more hardWork and focus more on concpets'
   end as 'Remarks'
   from Student_details
   end
   
   --exec 
   exec Sp_remarks


--3. Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)

--local stored procedure
create procedure #temp_local
as 
begin
print 'Local Variable'
end
--execution of local procedure
exec #temp_local


--global Stored procedure
create procedure ##temp_global
as 
begin
print 'global Variable'
end

--execution of Global procedure
exec ##temp_global

---------------------------------------------------------------------------------
--Local temp Table
create table #temp_table_local(id int,name varchar(20))

insert Into #temp_table_local values (101,'Hari')

--execution of local table
select * from #temp_table_local


---global temp table

create table ##temp_table_global(id int,name varchar(20))

insert into ##temp_table_global values(101,'Harshan')

--execution of Global Table
select * from ##temp_table_global

----------------------------------------------------------------
--local table  variable


declare @local_variable table (id int, name varchar(25))

insert into @local_variable values(101,'sharon')

select * from @local_variable


--global table variable 


declare @@global_variable table (id int, name varchar(25))
insert into @@global_variable values(102,'Karthi')
select * from @@global_variable

-----------------------------------------------------------------