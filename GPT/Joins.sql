--4. List employees who earn more than the average salary of their department and are working on at least 2 projects.;

select e.*
from employees e
join
(select emp_id
from projects p
group by emp_id
having count(emp_id) > 1) p on e.emp_id = p.emp_id
 where e.salary > (
select avg(salary) from employees);
