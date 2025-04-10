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















