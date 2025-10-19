


-- List employees whose salary is higher than their department’s average salary.
select x.* from 
(select  e.name,e.salary,
avg(e.salary) over(partition by e.dept_id) as avg_sal
from employees e
join departments d on d.dept_id = e.dept_id) x
where x.avg_sal < x.salary ;
