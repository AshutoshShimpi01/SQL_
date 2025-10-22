


-- 4.  **Top 2 Project-Heavy Employees:** In **each department**, find the **Top 2 employees** assigned to the
--      most projects. List the employee name, department name, and their project count.




with tp as
(select e.emp_id,e.name,d.dept_name,
count(ep.project_id) as ct
from employees e
join departments d on e.dept_id = d.dept_id
join employee_project_assignments ep on e.emp_id = ep.emp_id
join projects p on p.project_id = ep.project_id
group by e.emp_id,e.name,d.dept_name),
rk as
(
select name,dept_name,ct,
dense_rank() over(partition by dept_name order by ct desc) as rr
from tp
)
select name,dept_name,ct from rk
where rr <= 2;
