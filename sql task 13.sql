use diagram

--1.Table section
create table section (class_num int primary key,class_id int references course(class_id),semester varchar(7),year int,room_no varchar(6),time_slot_id int references time_slot(time_slot_id),capacity int)

--2.Table time_slot
create table Time_slot(time_slot_id int primary key,days varchar(8),start_time time,end_time time)

--3.table users_number
create table users_number(users_id int  references users(users_id),number numeric(15,0),description varchar(15))

--4.Table users_address 
create table users_address(users_id int  references users(users_id),address varchar(80),apt_num varchar(15),city varchar(15),state varchar(2),zip numeric(5,0),description varchar(15))

--5.Table users_finaid_map
create table users_finaid_map(users_id int  references users(users_id),aid int references finaid_main(aid_id),semester varchar(7),year int,offered numeric(18,2),accepted numeric(18,2))

--6.Table Finaid_main
create table finaid_main(aid_id int primary key,name varchar(50)unique not null,category varchar(15))

--7.table course
create table course (class_id int primary key,name varchar(25),dept_name varchar(25) references department(dept_name),credits numeric(5,0),description varchar(8000))

--8.table Takes
create  table Takes(users_id int  references users(users_id),class_id int references course(class_id),class_num int references section(class_num),semester varchar(7),year int,grade varchar(2))

--9.table users_role
create table users_role(users_id int  references users(users_id),role_id int references role(role_id))

--10.table users
create table users (users_id int primary key,users_name varchar unique not null,password varchar(40))

--11.table users_email
create table users_email(users_id int references users(users_id),email varchar(50)primary key,description varchar(15))

--12.Department
create table department (dept_name varchar(25) primary key,building varchar(20),budget numeric(18,2))

--13.teaches
create table teaches (users_id int references users(users_id),class_id int references course(class_id),class_num int references section(class_num),semester varchar(7),year int)

--14.hold_main
create table hold_main(users_id int references users(users_id),hold_id int primary key,name varchar(25)unique not null,descriptioin varchar(15))

--15.requisite
create table requisite(class_id int references course(class_id),req_id int,type varchar(4))

--16.users_salary
create table users_salary(users_id int references users(users_id),salary numeric(18,2))

--17.users_balance
create table users_balance(users_id int references users(users_id),balance numeric(18,2))

--18.role
create table role(role_id int primary key,role_name varchar(3) unique not null,role_full_name varchar(15))

--19.users_hold_map
create table users_hold_map(users_id int references users(users_id),hold_id int references hold_main(hold_id))
