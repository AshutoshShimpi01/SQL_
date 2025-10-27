
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











100 % solve by me without 1% of help


with emp as
(select e.dept_id,e.name,e.salary
from employees e),
dept_av as
(select e.dept_id,avg(e.salary) as avv
from employees e
join departments d
on e.dept_id = d.dept_id
group by e.dept_id)
select name,salary
from emp
join dept_av on emp.dept_id = dept_av.dept_id
where emp.salary > dept_av.avv;
