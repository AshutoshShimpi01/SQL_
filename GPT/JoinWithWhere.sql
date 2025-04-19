
-—List employees who are working on more than one project and have a salary between 6000 and 10000.;

select e.name,count(p.emp_id) as ep
from employees e
join projects p
on e.emp_id = p.emp_id
where salary between 5000 and 6000
group by p.emp_id
having count(p.emp_id) > 1;
