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




