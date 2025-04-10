count the total sum of salary in each city pune,mumbai,delhi
--------------


select sum(salary),city -- adding salary from pune,then mumbai,then delhi
from employee
group by city;     ---- grouping city first




count the total number of employess which presents in each department


select count(*),department
from employee
group by department;

--------------
find count of emp working in all dept and their managers?

select manager,dept, count(*) as numb_of_Emp
from employee
group by dept ,manager;
