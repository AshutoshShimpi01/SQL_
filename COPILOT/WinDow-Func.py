
🟢 10 Basic Window Function Questions



1. For each employee, show their salary and the average salary in their department.

SELECT 
    e.*, 
    d.department_name,
    AVG(e.salary) OVER (PARTITION BY e.dept_id) AS avg_sal,
    ROW_NUMBER() OVER (PARTITION BY e.dept_id ORDER BY e.salary DESC) AS emp_rank
FROM employees AS e
JOIN departments AS d ON e.dept_id = d.dept_id;


-- 2. Rank employees by salary in descending order using RANK().

select *, rank() over(order by salary desc) as rnk
from employees ;


-- 3. Use DENSE_RANK() to rank employees with ties allowed on salary.


SELECT 
    e.*, 
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees e;


-- 4. Show each employee’s row number based on salary (highest to lowest) using ROW_NUMBER()Show employees and 
-- the maximum salary within their department.


SELECT 
    e.*, 
    ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk,
    MAX(e.salary) OVER (PARTITION BY dept_id) AS max_salary
FROM employees e;


-- 5. For each employee, show their salary and the average salary in their department.


select e.*, 
        avg(e.salary) over( partition by dept_id ) as avg
from employees e;


-- 2. Rank employees within each department by salary in descending order using RANK().


select e.*, ranK() over(partition by dept_id order by salary desc) as rnk
from employees e;


-- 3. Show each employee’s salary and how it compares to the minimum salary in their department.


select e.*, 
      min(e.salary) over(partition by dept_id) as min_sal
from employees e;


--  4. Display the total number of employees using a window COUNT() (no GROUP BY).

select e.*,
      count(e.emp_id) over() as emp
from employees e;


-- 5. For each department, show the highest salary using MAX() window function.

select e.*,
      max(e.salary) over(partition by dept_id)  as max
from employees e;



-- 6. Use ROW_NUMBER() to assign a unique number to employees ordered by salary within each department.

select e.*, row_number() over(partition by dept_id order by salary) as rw
from employees e;


-- 7. For each employee, show their salary and cumulative salary across the company ordered by emp_id.

select e.*,
       sum(e.salary) over(order by emp_id) as total_company_sal
from employees e;


-- 8. Display each project and the total number of employees assigned using COUNT() window function.

select p.*, count(ep.emp_id) over(partition by project_id) as num_of_emps
from employees e
join employee_project_assignments ep
on e.emp_id = ep.emp_id
join projects p
on ep.project_id = p.project_id ;


-- 9. For each employee, show their total hours across all projects using SUM() window function.

select e.*, sum(ep.hours_worked) over(partition by emp_id) as all_projects_hours
from employees e
join employee_project_assignments ep
on e.emp_id = ep.emp_id;


-- 10. Show each employee’s name, salary, and department average salary difference using window functions.


select e.name,e.salary, e.dept_id,
	 avg(e.salary) over(partition by dept_id) as dept_avg_sal,
     e.salary - avg(e.salary) over(partition by e.dept_id) as diff
from employees e;

