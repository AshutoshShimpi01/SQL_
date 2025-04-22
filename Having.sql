- Its filters the group result.
  its filter data after group by clause
  and where filter data before group by hence we use having coz filter group data.
------------------------


--returns up to 5 departments where:
--The department has more than 2 IT_PROG employees
--The average salary of those IT_PROG employees is greater than 5000

Sorted by highest average salary  
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
WHERE job_id = 'IT_PROG'
GROUP BY department_id
HAVING AVG(salary) > 5000 AND COUNT(*) > 2
ORDER BY avg_salary DESC
LIMIT 5;

--Departments with more than 5 employees and total salaries above 30K.
SELECT department_id, COUNT(*) AS emp_count, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5 AND SUM(salary) > 30000;


--Departments where the manually calculated average salary is > 4500.    (AVG(salary) == SUM(salary) / COUNT(*)  )

SELECT department_id, SUM(salary) / COUNT(*) AS avg_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) / COUNT(*) > 4500;

--Departments with average salary higher than the company average.
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
);

--Filter only those grouped results where total sales > 50K, using a subquery as a virtual table.
SELECT dept_id, total_sales
FROM (
    SELECT department_id AS dept_id, SUM(sales) AS total_sales
    FROM sales_data
    GROUP BY department_id
) AS dept_sales
HAVING total_sales > 50000;

--You can calculate and compare using subqueries in SELECT, then still filter with HAVING.
SELECT department_id,
       (SELECT COUNT(*) FROM employees e2 WHERE e2.department_id = e1.department_id) AS dept_count
FROM employees e1
GROUP BY department_id
HAVING COUNT(*) > 3;

--Find departments located in a specific location and count their employees.
SELECT department_id, COUNT(*) AS emp_count
FROM employees
GROUP BY department_id
HAVING department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
);

--Managers with teams larger than the average team size.   (Correlated Subquery in HAVING)

SELECT manager_id, COUNT(*) AS emp_count
FROM employees
GROUP BY manager_id
HAVING COUNT(*) > (
    SELECT AVG(team_size)
    FROM (
        SELECT manager_id, COUNT(*) AS team_size
        FROM employees
        GROUP BY manager_id
    ) AS team_counts
);

  
--group departments and sort each departments which employee size is more than 2.

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
