create database task11

use task11




create table Students(sid int,sname varchar(20),department varchar(20),yearofcompletion int)

insert into students values
(1,'Harshan','It',2023),
(2,'Karthi','ct',2022),
(3,'Hari','cs',2021),
(4,'Siva','ct',2023),
(5,'Saron','It',2022),
(6,'Hemanth','It',2023),
(7,'Vikram','cs',2021),
(8,'vasanth','ct',2022),
(9,'Rinita','It',2021),
(10,'Harismitha','It',2022),
(11,'Harita','ct',2021),
(12,'Yamini','cs',2021),
(13,'srikanth','cs',2023),
(14,'Selva','ct',2022),
(15,'dhana','cs',2022),
(16,'divya','cs',2021),
(17,'venkit','It',2023),
(18,'priya','It',2023),
(19,'arun','cs',2022),
(20,'vignesh','It',2021)



select * from Students

--1. Show the working of PIVOT and UNPIVOT by creating a table students(sid,sname,department,yearofcompletion) with 20 records.
--Note: Simplify the table to show the number of students in each department and categorize them based on yearofcompletion.

select  department,yearofcompletion,number_students from 
(select department,[2021],[2022],[2023] from 
(select department,yearofcompletion from  Students)as table_1
pivot
(count(yearofcompletion) for yearofcompletion in ([2021],[2022],[2023])) as Pivot_batches) as pivot_table
unpivot
(number_students for yearofcompletion in  ([2021],[2022],[2023])) as unpivot_table



--2. Create a database for Library Management. Analyse the required columns, perform a normalization and link the tables using primary and foreign key (using on update set default)
--Note: Kindly do the task on your own.


create database Library_Management

use  Library_Management

create table Author_details(author_id int primary key,author_name varchar(20) unique not null)
create table Book_details(Book_id int Primary key,Book_name varchar(50)  not null ,number_pages int not null,No_copies int,Published_year int not null,Author_id int references Author_details(Author_id))
create table Customer_details(Customer_id int primary key ,Customer_name varchar(20)not null ,Mobile_number bigint not null unique,Book_id int  references Book_details(Book_id),Author_id int references Author_details(Author_id))

select * from Author_details;
select * from Book_details;
select * from Customer_details;

insert into Author_details values (1,'J. K. Rowling'),(2,' Mark Twain'),(3,'George Orwell'),(4,'Leo Tolstoy')

insert into Book_details values(1,'Philosopher�s Stone',10500,20,1997,1),
(2,'Chamber of Secrets',11110,10,1998,1),
(3,'Goblet of Fire',9500,05,2000,1),
(4,'Order of the Phoenix ',12500,3,2003,1),
(5,'Half-Blood Prince ',11900,2,2005,1),
(6,'Cursed Child � Parts One and Two',15500,1,2016,1)

insert into Book_details values(7,'The Adventures of Tom Sawyer',1100,20,)



