--2. Projects assigned to employees who have worked on more than 3 projects:
List the project names for employees who have been assigned to more than 3 projects.;

select project_name 
from projects where emp_id in
(
select emp_id
from projects 
group by emp_id
having count(*)> 1);
