--Find employees who have worked on more than 1 project.;

select ea.emp_id,count(ea.project_id)
from employee_project_assignments ea
group by ea.emp_id
having count(ea.project_id) > 1;
--same
select e.name,count(ea.project_id)  --its grest coz, e.name must be there
from employees e
join employee_project_assignments ea on e.emp_id = ea.emp_id
group by e.name
having count(ea.project_id) > 1;

--List all projects and the number of employees assigned to each.;

SELECT p.project_name, COUNT(ea.emp_id) AS num_employees
FROM projects p
JOIN employee_project_assignments ea ON ea.project_id = p.project_id
GROUP BY p.project_name;
