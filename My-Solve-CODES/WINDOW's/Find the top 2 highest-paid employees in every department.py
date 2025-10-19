-- Find the top 2 highest-paid employees in every department.

select x.* from
(select e.*,
rank() over(partition by e.dept_id order by e.salary desc) as rk
from employees e
where e.dept_id is not null) x
where x.rk < 3;

------
using with
-------
-- Find the top 2 highest-paid employees in every department.
with rr as (select e.*,
rank() over(partition by e.dept_id order by e.salary desc ) as rk
from employees e
where e.dept_id is not null)
select * from rr
where rr.rk < 3;
