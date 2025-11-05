
self written

-- Salary Compare

select name, salary,
case
    when salary > 8000 then 'higher salary'
    when salary < 8000 and salary > 5000 then 'medium salary'
    else 'lower salary'
    end as compare
from employees;



self written

select
sum(case when dept_name = 'Engineering' then salary end) as Engineering_sal,
sum(case when dept_name = 'Marketing' then salary end) as Engineering_sal,
sum(case when dept_name = 'Finance' then salary end) as Engineering_sal,
sum(case when dept_name = 'HR' then salary end) as Engineering_sal
from departments d
join employees e on e.dept_id = d.dept_id;
