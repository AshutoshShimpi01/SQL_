--Find employees who haven’t worked on any project.;

SELECT e.*
FROM employees e
LEFT JOIN employee_project_assignments ea ON e.emp_id = ea.emp_id
WHERE ea.project_id IS NULL;
