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
