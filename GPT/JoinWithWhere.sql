
-—List employees who are working on more than one project and have a salary between 6000 and 10000.;

select e.name,count(p.emp_id) as ep
from employees e
join projects p
on e.emp_id = p.emp_id
where salary between 5000 and 6000
group by p.emp_id
having count(p.emp_id) > 1;


---—Find employee names who are not assigned to any project and belong to departments other than ‘Marketing’.;

select e.name
from employees e
left join projects p
on e.emp_id =p.emp_id
join departments d on e.dept_id = d.dept_id
where project_id is null and dept_name <> 'Marketing';
