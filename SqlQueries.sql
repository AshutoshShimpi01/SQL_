Print a list of employees who earn more than the average
salary of their department.


select name,salary from EMPLOYEE
where salary > 
     (select avg(salary) from employee);

-------------------

Display similar employess dept and theri names in sequential order

select distinct(name),dept
from employee 
order by dept;

-------------------

display the count of empolyee which r working under different manager

select count(empid),manager from employee 
group by manager;

-------------------

Display those employees whose names are exactly the same
length as their manager's name.

SELECT name, manager
FROM employee
WHERE LENGTH(name) = LENGTH(manager);

-------------------

     


