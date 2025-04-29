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


--List employees who worked on a project from a different department.;
He worked on a Finance department project
→ ✅ He should be in the list (different department)
Anita is in the HR department
She worked on an HR department project
→ ❌ She should not be in the list (same department)

select e.name
from employees e
join employee_project_assignments ea on ea.emp_id = e.emp_id
join projects p on ea.project_id = p.project_id
join departments d on d.dept_id = e.dept_id
WHERE e.dept_id <> p.dept_id;
