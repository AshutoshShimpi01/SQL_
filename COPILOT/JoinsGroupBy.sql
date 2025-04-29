--List all projects and the number of employees assigned to each.;

select p.project_name,ea.project_id,count(ea.emp_id) as num_employees_assigned
from employees e
join employee_project_assignments ea on e.emp_id = ea.emp_id
join projects p on p.project_id = ea.project_id
group by ea.project_id,p.project_name;
