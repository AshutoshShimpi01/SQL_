


-- 2.  3.  **Top 1 Least Active Department:** Identify the **single department** that has the lowest total number of employees.
-- List the department name and the employee count.

with ls as
(
select d.dept_name, 
count(e.emp_id) over(partition by e.dept_id) as cnt
from employees e
left join employee_project_assignments ep on e.emp_id = ep.emp_id
right join departments d on d.dept_id = e.dept_id
), rk as
(
select dept_name,cnt,
rank() over(order by cnt) as rk
from ls
)
select * from rk
limit 1;






Gemini Query- 


WITH DepartmentCounts AS (
    -- Step 1: Efficiently calculate the employee count using GROUP BY
    SELECT
        d.dept_name,
        COUNT(e.emp_id) AS employee_count
    FROM
        employees e
    LEFT JOIN -- Use LEFT JOIN to include departments with 0 employees
        employee_project_assignments ep ON e.emp_id = ep.emp_id
    RIGHT JOIN -- Join to departments last to ensure all departments are counted
        departments d ON d.dept_id = e.dept_id
    GROUP BY
        d.dept_name
)
-- Step 2: Order by the count (ascending) and take the first result
SELECT
    dept_name,
    employee_count
FROM
    DepartmentCounts
ORDER BY
    employee_count ASC -- Lowest count first
LIMIT 1; -- Get only the Top 1 (least active)
