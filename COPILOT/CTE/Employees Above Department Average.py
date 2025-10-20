
those all Quesrions are solved by me without any help.

-- 5.  **Employees Above Department Average:** List the name and salary of every employee whose salary is **greater than the average salary
-- of their respective department**.


with av as
(
select e.name, e.salary,
avg(salary) over(partition by dept_id) as dept_av_sal
from employees e
)
select * from av
where salary > dept_av_sal;
