--List all projects and the number of employees assigned to each.;

select p.project_name,ea.project_id,count(ea.emp_id) as num_employees_assigned
from employees e
join employee_project_assignments ea on e.emp_id = ea.emp_id
join projects p on p.project_id = ea.project_id
group by ea.project_id,p.project_name;

--Find employees who have worked on more than 1 project.;

select e.name,count(ea.emp_id)
from employees e
join employee_project_assignments ea on e.emp_id = ea.emp_id
join projects p on p.project_id = ea.project_id
group by e.name
having count(ea.emp_id) > 1;

SELECT e.name, COUNT(ea.project_id) AS num_projects
FROM employees e
JOIN employee_project_assignments ea ON e.emp_id = ea.emp_id
GROUP BY e.emp_id, e.name
HAVING COUNT(ea.project_id) > 1;
