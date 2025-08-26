
-- top 2 employees Have more in each dept

select * from 
(select e.*,d.dept_name,
rank() over(partition by dept_name order by salary desc) as rk
from employees e
join departments d
on e.dept_id = d.dept_id) as x
where x.rk <= 2;


-- Top 2 highest-paid employees per department


SET @rank := 0;
SET @prev_region := '';

select * from
(select e.emp_id, e.name, d.dept_name, e.salary,
rank() over(partition by dept_name order by salary desc) rk
from employees e
join departments d
on e.dept_id = d.dept_id) x
where x.rk < 3;
