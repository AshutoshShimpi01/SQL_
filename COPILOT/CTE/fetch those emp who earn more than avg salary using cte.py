



---- fetch those emp who earn more than avg salary using cte

with av_sal as 
(select avg(salary) as av from employees)
select e.* from employees e
cross join av_sal as a 
where e.salary > a.av;

select * from employees 
where salary >
(select avg(salary) from employees);


-- find employees whose salary is greater than their department’s average.
-- SELF WRITTEN
with dpt_avg as 
(
select d.dept_id,d.dept_name,avg(e.salary) as av
from departments d
join employees e on d.dept_id = e.dept_id
group by d.dept_id,d.dept_name
)
select e.name
from employees e
join dpt_avg da on e.dept_id = da.dept_id
where e.salary > da.av 
;
