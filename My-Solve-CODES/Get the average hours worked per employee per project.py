-- Get the average hours worked per employee per project.

select ep.emp_id,ep.project_id,avg(ep.hours_worked) as av_hr
from employees e
join employee_project_assignments ep
on e.emp_id = ep.emp_id
group by ep.project_id,ep.emp_id;
