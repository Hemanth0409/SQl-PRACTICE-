create database task14

use task14


--Table Hobbies
--a. Create a table Hobbies (HobbyID(pk), HobbyName(uk)) 
create table hobbies (HobbyId int primary key,HobbyName varchar(25) unique)

--1. insert records into the table using a stored procedure.
alter procedure Insertrecord (@hobbyId int,@HobbyName varchar(25))
as
begin 

insert into hobbies values(@hobbyId,@HobbyName)

end 
 
 exec Insertrecord 1,'playing cricket'
 exec Insertrecord 2,'playing video games'
 exec Insertrecord 3,'playing football'



 select * from hobbies

 /*2. insert duplicate records into the table and show the working of exception handling 
 using Try/catch blocks.*/


 create procedure Working_Exception(@hobbyId int,@HobbyName varchar(25))
 as 
 begin
 begin try 
 
insert into hobbies values(@hobbyId,@HobbyName)
end try 

begin catch
print 'Insertion of dupilcate values'
end catch
end


 exec Working_Exception 5,'Solving cube'
 exec Working_Exception 6,'playing video games'----unique constraint

 --3. Store the error details in an errorbackup table.


CREATE TABLE Errors_details
         (ErrorID        INT IDENTITY(1, 1),
          UserName       VARCHAR(100),
          ErrorNumber    INT,
          ErrorState     INT,
          ErrorSeverity  INT,
          ErrorLine      INT,
          ErrorProcedure VARCHAR(MAX),
          ErrorMessage   VARCHAR(MAX),
          ErrorDateTime  DATETIME)

create PROCEDURE sp_error_db (@hobbyId int,@HobbyName varchar(25))
AS
  BEGIN TRY
    INSERT INTO hobbies
         SELECT @hobbyId,@HobbyName
  END TRY
  BEGIN CATCH
    INSERT INTO Errors_details
    VALUES
  (SUSER_SNAME(),
   ERROR_NUMBER(),
   ERROR_STATE(),
   ERROR_SEVERITY(),
   ERROR_LINE(),
   ERROR_PROCEDURE(),
   ERROR_MESSAGE(),
   GETDATE());
  END CATCH
GO

exec sp_error_db 7,'playing cricket'

select * from Errors_details
--------------------------------------------------------------------------

/*b. Create a procedure to accept 2 numbers, if the numbers are equal then calculate the product 
else use RAISERROR to show the working of exception handling.*/

alter procedure Product_num(@num1 int,@num2 int)
as 
begin 
declare @result int
set @result=@num1*@num2
begin  try
if @num1=@num2
print 'The Product of '+cast(@num1 as varchar)+' and '+ cast(@num2  as varchar)+ ' = ' + cast(@result as varchar)
else
RAISERROR('Number are different',16,1)
end try
 BEGIN CATCH
    PRINT ERROR_NUMBER()
    PRINT ERROR_MESSAGE()
    PRINT ERROR_SEVERITY()
    PRINT ERROR_STATE()
  END CATCH
end

exec Product_num 5,5--correct number formate

exec Product_num 1,10--error number formate

-------------------------------------------------------------------------------
/*c. Create a table Friends(id(identity), name (uk)) and insert records into the table using
a stored procedure.
Note: insert the names which start only with A,D,H,K,P,R,S,T,V,Y ELSE using THROW give the 
error details*/

create table  Friends(id int identity(1,1), name varchar(25) unique) 

alter procedure Sp_friends(@name varchar(25))
as 
begin 
if (@name like '[ADHKPRSTVY]%')
insert into friends values(@name)
else
Print 'The  Name should starts with A,D,H,K,P,R,S,T,V,Y '
end

exec Sp_friends 'Hemanth'

exec Sp_friends 'Karthi'

exec Sp_friends 'Nandha'--Print 'The  Name should starts with A,D,H,K,P,R,S,T,V,Y '

select * from Friends