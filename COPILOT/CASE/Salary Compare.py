


-- Salary Compare

select name, salary,
case
    when salary > 8000 then 'higher salary'
    when salary < 8000 and salary > 5000 then 'medium salary'
    else 'lower salary'
    end as compare
from employees;
