-- 2. Find employees who are not assigned to any project and work in the Finance department.;

SELECT d.dept_id, e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id
WHERE e.name IS NULL OR d.dept_name = 'Finance';

--
