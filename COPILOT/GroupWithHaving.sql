--Find employees who have worked on more than 1 project.;

select ea.emp_id,count(ea.project_id)
from employee_project_assignments ea
group by ea.emp_id
having count(ea.project_id) > 1;
