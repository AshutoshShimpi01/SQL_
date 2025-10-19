


-- For each employee, show the previous and next employee’s salary within the same department.


select  e.*,
lag(e.salary) over(partition by dept_id order by e.salary) as previous_emp_sal,
lead(e.salary) over(partition by dept_id order by e.salary) as next_emp_sal
from employees e
join departments d on d.dept_id = e.dept_id;
