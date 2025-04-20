----Find the department with the highest average salary of its employees.;

select d.dept_name,avg(salary)
from employees e
join departments d on e.dept_id = d.dept_id
group by dept_name
order by avg(salary) desc
limit 1;

--List the top 3 employees with the highest total hours worked across all projects.;

select ee.name,sum(hours_worked) as h
from employee_project_assignments em
join employees ee on ee.emp_id = em.emp_id
group by em.emp_id
order by h desc
limit 3;


--List projects that have employees from every department.;

SELECT p.project_name
FROM projects p
JOIN employee_project_assignments epa ON p.project_id = epa.project_id
JOIN employees e ON epa.emp_id = e.emp_id
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY p.project_id
HAVING COUNT(DISTINCT e.dept_id) = (SELECT COUNT(*) FROM departments);

--Find employees who have worked on a project that overlaps with the ‘Apollo’ project
(i.e., they worked on a project that started before Apollo’s end date and ended after Apollo’s start date).;

SELECT DISTINCT e.name
FROM employees e
JOIN employee_project_assignments epa ON e.emp_id = epa.emp_id
JOIN projects p ON epa.project_id = p.project_id
WHERE p.project_id != (
    SELECT project_id
    FROM projects
    WHERE project_name = 'Apollo'
)
AND p.start_date <= (
    SELECT end_date
    FROM projects
    WHERE project_name = 'Apollo'
)
AND p.end_date >= (
    SELECT start_date
    FROM projects
    WHERE project_name = 'Apollo'
);
