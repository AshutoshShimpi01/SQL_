--Find employees who haven’t worked on any project.;

SELECT e.*
FROM employees e
LEFT JOIN employee_project_assignments ea ON e.emp_id = ea.emp_id
WHERE ea.project_id IS NULL;

--Find the employee(s) with the highest salary in each department.;

select e.name,e.salary 
from employees e
join departments d on e.dept_id = d.dept_id
where (d.dept_name,e.salary) in
(select d.dept_name,max(e.salary) as highest_sal
from employees e
join departments d on e.dept_id = d.dept_id
group by d.dept_name);
