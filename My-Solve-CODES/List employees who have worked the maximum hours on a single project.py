

-- List employees who have worked the maximum hours on a single project.

-----
Prefer 1st
------
SELECT
    E.name,
    EP.hours_worked
FROM
    employees E
JOIN
    employee_project_assignments EP ON E.emp_id = EP.emp_id
WHERE
    EP.hours_worked = (
        -- This finds the single largest value of hours_worked in the entire table.
        SELECT MAX(hours_worked)
        FROM employee_project_assignments
    );

------
with correlated subQ
------

SELECT E.name,ep.hours_worked
FROM employees E
JOIN employee_project_assignments EP ON E.emp_id = EP.emp_id
JOIN projects P ON EP.project_id = P.project_id
where ep.hours_worked = 
       (select max(hours_worked)
       from employee_project_assignments EP2
       join projects P2 ON EP2.project_id = P2.project_id
       where ep2.emp_id = e.emp_id)
       limit 1;
