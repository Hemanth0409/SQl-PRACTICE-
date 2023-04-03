--Show the working of the following concepts for the students table created in the earlier tasks.
create database task15

use task15

create table Student_details (student_id int primary key identity(1,1),student_name varchar(25),departmant varchar(25),score int)
insert into Student_details values('Hemanth','Bsc-It',500)
insert into Student_details values('Harshan','Bsc-It',490),('Sharon','Bsc-It',480),('Karthi','Bsc-Ct',495),('Siva Barath','BCA',450),('Hari','BCA',460),('Vasanth','BCA',490),('Vikram','BCA',478),('Rinita','Bsc-ct',460)
insert into Student_details values('Harita','Bsc-It',480),('Yamini','Bsc-Ct',478),('Harishmitha','BCA',496),('Srikanth','BCA',454),('Priyadharshan','Bsc-Ct',465),('Selva','BCA',492),('Dhanaprakash','Bsc-it',479),('Arun','BCA',461),('venkit','BCA',478),('Vignesh','BCA',455)
insert into Student_details values('DivyaPrakash','Bsc-It',498),('Raina','Bsc-It',480),('Dhoni(captian cool)','Bsc-Ct',500),('Virat','BCA',550),('Bajji Boy','BCA',465),('R aswin','BCA',490)

select * from Student_details
-----------------------------------------------------
--1. Auto-commit and Auto-rollback transactions.
--auto rollback
begin tran 
insert into Student_details values('kevin 11','BCA',487)
update Student_details set score=495 where student_id=21
select * from Student_details
commit tran
--auto-commit
insert into Student_details values('Diamond head','Bca',479) 

SET IDENTITY_INSERT student_details on
----------------------------------------------------------------------------------------
--2. Implicit transactions
set IMPLICIT_TRANSACTIONS on 
update Student_details set student_id=30 where student_name ='s smith'
select iif(@@OPTIONS & 2=2,'Implicit_transactions mode ON','Implicit_transactions mode OFF')as Tranaction_mode
SELECT 
    @@TRANCOUNT AS Before_OpenTransactions 
COMMIT TRANSACTION
insert into Student_details values('Grandpa max','Bcs -it',480) 
SELECT 
    @@TRANCOUNT AS After_OpenTransactions
SET IMPLICIT_TRANSACTIONS OFF

--3. Explicit transactions
   --a. Only Commit - insert statement
  begin tran
  insert into Student_details values ('Vilgax','bsc-ct',477)
  select @@ 


    --b. Only Rollback - update statement
    --c. Savepoint - commit update and insert statements, rollback delete statement