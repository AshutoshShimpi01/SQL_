find employees who salary is greater than managers salary

select e.fname as emp, m.fname as mag
from Emp e
join Emp m
on e.magid = m.empid
where e.sal > m.sal;


