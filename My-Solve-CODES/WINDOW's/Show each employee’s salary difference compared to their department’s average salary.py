

-- Show each employee’s salary difference compared to their department’s average salary.

select e.name,e.salary,
e.salary - avg(e.salary) over(partition by d.dept_name) as avg_sal
from employees e
join departments d on d.dept_id = e.dept_id
;
