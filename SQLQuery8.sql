create database task7

use task7

create table Student_details (student_id int primary key identity(1,1),student_name varchar(25),departmant varchar(25),score int)
insert into Student_details values('Hemanth','Bsc-It',500)
insert into Student_details values('Harshan','Bsc-It',490),('Sharon','Bsc-It',480),('Karthi','Bsc-Ct',495),('Siva Barath','BCA',450),('Hari','BCA',460),('Vasanth','BCA',490),('Vikram','BCA',478),('Rinita','Bsc-ct',460)
insert into Student_details values('Harita','Bsc-It',480),('Yamini','Bsc-Ct',478),('Harishmitha','BCA',496),('Srikanth','BCA',454),('Priyadharshan','Bsc-Ct',465),('Selva','BCA',492),('Dhanaprakash','Bsc-it',479),('Arun','BCA',461),('venkit','BCA',478),('Vignesh','BCA',455)
insert into Student_details values('DivyaPrakash','Bsc-It',498),('Raina','Bsc-It',480),('Dhoni(captian cool)','Bsc-Ct',500),('Virat','BCA',550),('Bajji Boy','BCA',465),('R aswin','BCA',490)

select * from Student_details

--1. Create a non-clustered index for department.

Create nonclustered index non_cluster_department on Student_details ( departmant asc)
exec Sp_helpindex 'Student_details'

--2. Create a filtered index for department='BCA'
CREATE NONCLUSTERED INDEX noncluster_Department ON Student_details (Departmant asc) WHERE Departmant = 'BCA'


--3. Create a view for students in BCA department.

create view Depatment_BCA as Select * from Student_details where Departmant = 'BCA'

select * from Depatment_BCA

--4. Apply Rank() for all the students based on score.

select *  ,Rank() over(order by score desc) as RANK_Order from Student_details

--5. Apply Dense_Rank() for students in each department based on score.
select * ,DENSE_RANK() over(partition by Departmant order by Score desc ) as DEPARTMENT_RANK from Student_details 