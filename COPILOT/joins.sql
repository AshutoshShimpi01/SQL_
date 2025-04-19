----Find the department with the highest average salary of its employees.;

select d.dept_name,avg(salary)
from employees e
join departments d on e.dept_id = d.dept_id
group by dept_name
order by avg(salary) desc
limit 1;
