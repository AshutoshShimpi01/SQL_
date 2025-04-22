- Its filters the group result.
  its filter data after group by clause
  and where filter data before group by hence we use having coz filter group data.
------------------------

SELECT department_id, AVG(salary) AS avg_salary
FROM employees
WHERE job_id = 'IT_PROG'
GROUP BY department_id
HAVING AVG(salary) > 5000 AND COUNT(*) > 2
ORDER BY avg_salary DESC
LIMIT 5;





  
group departments and sort each departments which employee size is more than 2.

  select count(*),department
  from employee
  group by department
  having count(*) > 2;

  
select  dept,count(*) from Employee
group by dept
having max(salary) > 85
order by dept asc ;



select dept
from Employee
group by dept
having max(salary) > 95;




select country, count(customer_id) as customers
from Customers
group by country
having max(age) > 25;

customer_id	first_name	last_name	age	country
1	           John	          Doe	  31	 USA
2	            Robert	      Luna	22	 USA
3	           David	     Robinson	22	 UK
4	           John	      Reinhardt 25	 UK
5	            Betty	       Doe	  28	



SELECT dept, COUNT(empid) AS employee_count  
FROM Employee  
GROUP BY dept  
HAVING SUM(CASE WHEN salary > 85 THEN 1 ELSE 0 END) > 0  
ORDER BY dept ASC;

country	customers
UAE	      1
USA	      2
