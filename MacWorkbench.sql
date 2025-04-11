CREATE DATABASE EMPLOYEE;

USE EMPLOYEE;

CREATE TABLE EMPLOYEE (
  empId int primary key,
  name varchar(15),
  dept varchar(10),
  marks int not null,
  manager varchar(50)
);
 
-- insert
INSERT INTO EMPLOYEE(empId,name,dept,marks,manager) VALUES (1, 'Clark', 'Sales',69,"Ganesh");
INSERT INTO EMPLOYEE(empId,name,dept,marks,manager) VALUES (2, 'Dave', 'Accounting',86,"Kartik");
INSERT INTO EMPLOYEE(empId,name,dept,marks,manager) VALUES (3, 'Ava', 'Sales',81,"Ganesh");
insert into EMPLOYEE(empId,name,dept,marks,manager) VALUES (4, 'DEV', 'Sales',98,"Ganesh");
insert into EMPLOYEE(empId,name,dept,marks,manager) VALUES (5, 'OMKAR', 'Accounting',78,"Dattu");
insert into EMPLOYEE(empId,name,dept,marks,manager) VALUES (6, 'vinod', 'Sales',55,"Ganesh");
insert into EMPLOYEE(empId,name,dept,marks,manager) VALUES (7, 'pritesh', 'Sales',59,"Ganesh");
INSERT INTO EMPLOYEE(empId,name,dept,marks,manager) VALUES (8, 'parth', 'Accounting',80,"Kartik");

select  dept,max(salary) 
from Employee
group by dept
having max(salary) > 85
order by dept asc ;

select empid,dept,salary
 from employee 
 where dept in(
select  dept
from Employee
group by dept
having count(*) > 85
);

SELECT empid, dept, salary  
FROM Employee  
WHERE salary > 85
groug by dept;

drop table employee;
 

-- fetch 

update EMPLOYEE
set dept ='Market' 
where empid= 5 and 7 ;
   
select * from Employee
ORDER BY EMPID;

alter table EMPLOYEE
change sal salary int;

select dept
from Employee
group by dept
having max(salary) > 95;

select  dept,count(empid) as numbers
from Employee
group by dept
having max(salary) > 89
order by dept asc ;

DESC EMPLOYEE;

select * from EMPLOYEE;

 

SELECT name, manager
FROM employee
WHERE LENGTH(name) = LENGTH(manager);




create table emp
  (
    empid int primary key,
    fanme varchar(10),
    magid int
  );
  insert into emp values (1,'ashu’,2);
  insert into emp values (2,'shri’,3);
  insert into emp values (3,'kesh’,1);
  
  select * from emp;
  
  
  
  use STUDENT;


CREATE TABLE School(
  id int primary key,
  Sname varchar(15),
  subjec varchar(10) not null,
  HOD varchar(50),
  foreign key(id) references department(dept_id)
);

alter table school 
add dept_id int;


insert into School values(1,"SITS","PCMB","ASHU",101);
insert into School values(2,"SITS","PCM","vinod",102);
insert into School values(3,"SITS","PCMB","Ashu",103);
insert into School values(4,"SITS","PCM","vinod",101);
insert into School values(5,"SITS","PCMB","ASHU",104);




select * from department;

select * from School;

select * from Student;

SELECT name, age
FROM student
ORDER BY
(CASE
    WHEN name IS NULL THEN age
    ELSE name
END);



use employee;

INSERT INTO Worker(W_Id,name,dept,marks,manager) VALUES (5, 'Clark', 'Sales',69,"Ganesh");
INSERT INTO Worker(W_Id,name,dept,marks,manager) VALUES (6, 'Dave', 'Accounting',86,"Kartik");
INSERT INTO Worker(W_Id,name,dept,marks,manager) VALUES (3, 'Ava', 'Sales',81,"Ganesh");
insert into Worker(W_Id,name,dept,marks,manager) VALUES (4, 'DEV', 'Sales',98,"Ganesh");


select * 
from Worker
inner join Employee
on Worker.W_Id = EMPLOYEE.empId;



update Worker
set name = 'nayan'
where W_Id = 6;

alter table worker
change name wname varchar(13);

select  * from worker;


update worker
set wname = 'gotya'
where w_id =3;






















CREATE DATABASE EMPLOYEE;

USE EMPLOYEE;

CREATE TABLE EMPLOYEE (
  empId int primary key,
  name varchar(15),
  dept varchar(10),
  marks int not null,
  manager varchar(50),
  foreign key(empId) references Worker(W_Id)
);

 
-- insert
INSERT INTO EMPLOYEE(empId,name,dept,marks,manager) VALUES (1, 'Clark', 'Sales',69,"Ganesh");
INSERT INTO EMPLOYEE(empId,name,dept,marks,manager) VALUES (2, 'Dave', 'Accounting',86,"Kartik");
INSERT INTO EMPLOYEE(empId,name,dept,marks,manager) VALUES (3, 'Ava', 'Sales',81,"Ganesh");
insert into EMPLOYEE(empId,name,dept,marks,manager) VALUES (4, 'DEV', 'Sales',98,"Ganesh");
insert into EMPLOYEE(empId,name,dept,marks,manager) VALUES (5, 'OMKAR', 'Accounting',78,"Dattu");
insert into EMPLOYEE(empId,name,dept,marks,manager) VALUES (6, 'vinod', 'Sales',55,"Ganesh");
insert into EMPLOYEE(empId,name,dept,marks,manager) VALUES (7, 'pritesh', 'Sales',59,"Ganesh");
INSERT INTO EMPLOYEE(empId,name,dept,marks,manager) VALUES (8, 'parth', 'Accounting',80,"Kartik");

select  dept,max(salary) 
from Employee
group by dept
having max(salary) > 85
order by dept asc ;

select empid,dept,salary
 from employee 
 where dept in(
select  dept
from Employee
group by dept
having count(*) > 85
);

SELECT empid, dept, salary  
FROM Employee  
WHERE salary > 85
groug by dept;

drop table employee;
 

-- fetch 

update EMPLOYEE
set dept ='Market' 
where empid= 5 and 7 ;
   
select * from Employee
ORDER BY EMPID;

alter table EMPLOYEE
change sal salary int;

select dept,count(*)
from Employee
where marks >90
group by dept;


select  dept,count(empid) 
from Employee
where marks >89
group by dept
order by dept asc ;

DESC EMPLOYEE;

select distinct * from EMPLOYEE;





ROP TABLE IF EXISTS student;



drop table department;
alter table department rename to dept;


CREATE TABLE department (
  dept_id INT PRIMARY KEY AUTO_INCREMENT,
  dept_name VARCHAR(100) NOT NULL UNIQUE,
  hod_name VARCHAR(100) NOT NULL
);

INSERT INTO student (
  first_name, last_name, gender, date_of_birth, email, phone, address,
  city, state, postal_code, country, dept_id, course, year_of_enrollment, marks, grade
) VALUES
('Amit', 'Sharma', 'Male', '2002-06-15', 'amit.sharma@email.com', '9876543210', '12 Main St', 'Delhi', 'DL', '110001', 'India', 1, 'B.Tech', 2020, 85.50, 'A'),
('Sneha', 'Patel', 'Female', '2001-08-22', 'sneha.patel@email.com', '9876543211', '34 Lake Rd', 'Mumbai', 'MH', '400001', 'India', 2, 'B.E.', 2019, 78.00, 'B'),
('Rohan', 'Verma', 'Male', '2003-01-10', 'rohan.verma@email.com', '9876543212', '89 Hill St', 'Pune', 'MH', '411001', 'India', 3, 'B.Tech', 2021, 88.75, 'A'),
('Priya', 'Singh', 'Female', '2002-11-30', 'priya.singh@email.com', '9876543213', '21 Park Lane', 'Chennai', 'TN', '600001', 'India', 4, 'B.E.', 2020, 82.00, 'B+'),
('Ankit', 'Yadav', 'Male', '2001-04-09', 'ankit.yadav@email.com', '9876543214', '76 Sector 5', 'Jaipur', 'RJ', '302001', 'India', 5, 'B.Tech', 2019, 74.25, 'C'),
('Kavya', 'Nair', 'Female', '2003-03-17', 'kavya.nair@email.com', '9876543215', '98 Ocean Dr', 'Kochi', 'KL', '682001', 'India', 1, 'B.Tech', 2021, 91.00, 'A+'),
('Dev', 'Joshi', 'Male', '2002-12-01', 'dev.joshi@email.com', '9876543216', '65 Hilltop', 'Ahmedabad', 'GJ', '380001', 'India', 2, 'B.E.', 2020, 80.00, 'B'),
('Nisha', 'Rao', 'Female', '2001-09-12', 'nisha.rao@email.com', '9876543217', '54 Central Rd', 'Hyderabad', 'TS', '500001', 'India', 3, 'B.Tech', 2019, 76.30, 'B'),
('Aarav', 'Kapoor', 'Male', '2000-07-04', 'aarav.kapoor@email.com', '9876543218', '34 Rose Ave', 'Bangalore', 'KA', '560001', 'India', 4, 'B.E.', 2018, 69.50, 'C+'),
('Megha', 'Dutta', 'Female', '2002-02-20', 'megha.dutta@email.com', '9876543219', '11 Palm Street', 'Kolkata', 'WB', '700001', 'India', 5, 'B.Tech', 2020, 87.25, 'A');

INSERT INTO department (dept_id, dept_name, hod_name) VALUES
(1, 'Computer Science', 'Dr. A. Sharma'),
(2, 'Mechanical Engineering', 'Dr. B. Verma'),
(3, 'Electrical Engineering', 'Dr. C. Rao'),
(4, 'Civil Engineering', 'Dr. D. Patel'),
(5, 'Information Technology', 'Dr. E. Mehra');

select * from department;











