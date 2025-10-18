-- List employees who worked on a same project from a different department.


simple-


select distinct e1.name
from employee_project_assignments ep1
join employee_project_assignments ep2
on ep1.project_id = ep2.project_id
join employees e1
on e1.emp_id = ep1.emp_id
join employees e2
on ep2.emp_id = e2.emp_id
where e1.emp_id != e2.emp_id
and e1.dept_id != e2.dept_id;



with WindowFunctions



WITH ProjectDeptInfo AS (
    SELECT
        e.name,
        e.dept_id,
        ep.project_id,
        
        -- Find the lowest dept_id working on the project
        MIN(e.dept_id) OVER (PARTITION BY ep.project_id) AS min_dept_id,
        
        -- Find the highest dept_id working on the project
        MAX(e.dept_id) OVER (PARTITION BY ep.project_id) AS max_dept_id
    FROM
        employee_project_assignments ep
    JOIN
        employees e ON ep.emp_id = e.emp_id
)
SELECT DISTINCT
    name
FROM
    ProjectDeptInfo
WHERE
    -- If the minimum dept_id is different from the maximum dept_id, 
    -- it means at least two different departments worked on the project.
    min_dept_id != max_dept_id;
