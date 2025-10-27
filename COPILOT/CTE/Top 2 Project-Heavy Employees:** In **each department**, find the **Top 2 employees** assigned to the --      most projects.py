


-- 4.  **Top 2 Project-Heavy Employees:** In **each department**, find the **Top 2 employees** assigned to the
--      most projects. List the employee name, department name, and their project count.




with tp as
(select e.emp_id,e.name,d.dept_name,
count(ep.project_id) as ct
from employees e
join departments d on e.dept_id = d.dept_id
join employee_project_assignments ep on e.emp_id = ep.emp_id
join projects p on p.project_id = ep.project_id
group by e.emp_id,e.name,d.dept_name),
rk as
(
select name,dept_name,ct,
dense_rank() over(partition by dept_name order by ct desc) as rr
from tp
)
select name,dept_name,ct from rk
where rr <= 2;







-- 100% my   (gives correct output by gim9ni says not)

select e.name, d.dept_name, count(ep.project_id) as prj_ct
from employees e
join departments d on d.dept_id = e.dept_id
join employee_project_assignments ep on e.emp_id = ep.emp_id
group by e.name, d.dept_name
order by prj_ct desc;






----_GIMINI


WITH EmployeeProjectCount AS (
    -- 1. Calculate the total number of projects for each employee
    SELECT
        e.emp_id,
        e.name,
        d.dept_name,
        COUNT(ep.project_id) AS prj_ct
    FROM
        employees e
    JOIN
        departments d ON d.dept_id = e.dept_id
    JOIN
        employee_project_assignments ep ON e.emp_id = ep.emp_id
    GROUP BY
        e.emp_id, e.name, d.dept_name
),
RankedEmployees AS (
    -- 2. Rank employees based on project count *within* their department
    SELECT
        name,
        dept_name,
        prj_ct,
        -- Rank resets for each department (PARTITION BY) and orders by project count (DESC)
        RANK() OVER (PARTITION BY dept_name ORDER BY prj_ct DESC) AS rk
    FROM
        EmployeeProjectCount
)
-- 3. Select only those employees whose rank is 1 or 2
SELECT
    name,
    dept_name,
    prj_ct
FROM
    RankedEmployees
WHERE
    rk <= 2
ORDER BY
    dept_name, prj_ct DESC;
