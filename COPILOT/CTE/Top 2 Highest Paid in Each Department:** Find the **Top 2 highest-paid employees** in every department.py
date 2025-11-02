-- 1.  **Top 2 Highest Paid in Each Department:** Find the **Top 2 highest-paid employees** in every department. 
-- Display their name, salary, department name, and rank within the department. (Use `DENSE_RANK()`).


with total as
(
select e.name, e.salary, d.dept_name,
dense_rank() over(partition by e.dept_id order by salary desc) as r
from employees e
join departments d on e.dept_id = d.dept_id
)
select * from total
where r < 3;





with ch as
(select e.name, d.dept_name, count(ep.project_id) as project_count,
row_number() over(partition by e.dept_id order by count(ep.project_id) desc) as rrk
from employees e
join departments d on e.dept_id = d.dept_id
join employee_project_assignments ep on ep.emp_id = e.emp_id
group by name, dept_name, d.dept_id)
select * 
from ch
where rrk < 3;
