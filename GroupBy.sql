count the total sum of salary in each city pune,mumbai,delhi
--------------


select sum(salary),city -- adding salary from pune,then mumbai,then delhi
from employee
group by city;     ---- grouping city first




count the total number of employess which presents in each department


select count(*),department
from employee
group by department;
