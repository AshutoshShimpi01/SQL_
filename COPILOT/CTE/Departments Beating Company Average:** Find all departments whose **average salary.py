

-- 6.  **Departments Beating Company Average:** Find all departments whose **average salary** is greater than the 
-- **overall average salary** of all employees in the company. List the department name and its average salary.;


with dpt as
(
select d.dept_name,
avg(salary) as dept_av
from employees e
join departments d on e.dept_id = d.dept_id
group by d.dept_name
), overAll_av as
(select avg(salary) as av from employees)
select dept_name, dept_av
from dpt
cross join overAll_av 
where dept_av > av;



SAME
----


with av as(
select d.dept_name,avg(e.salary) as dpt_avg
from employees e
join departments d on e.dept_id = d.dept_id
group by d.dept_name), total as
(
select avg(salary) as total_avg
from employees
)
select dept_name,dpt_avg 
from av
cross join total
where av.dpt_avg > total_avg;

