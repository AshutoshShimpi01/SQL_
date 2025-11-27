-- employees join in last 5 years (60 months)

select *
from employees
where joining_date >= date_add(current_date(), interval -60 month ); 






-- employees join in last (1500 days)

select *
from employees
where datediff(current_date(), joining_date) <= 1500; 
