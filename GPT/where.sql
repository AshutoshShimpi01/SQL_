--1. List employees who work on at least one project and have a salary greater than 6000.;

select e.name,count(p.emp_id)
from employees e
join projects p
on e.emp_id = p.emp_id
where e.salary > 5000
group by p.emp_id
having count(p.emp_id) >= 1;


-- 2. Find employees who are not assigned to any project and work in the Finance department.;

SELECT d.dept_id, e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id
WHERE e.name IS NULL OR d.dept_name = 'Finance';

--3. Show employees whose name starts with 'A' or end with 'e' and who belong to a department 
--that has more than 1 employee.;

select e.name,count(e.dept_id)
from employees e
join departments d
on e.dept_id = d.dept_id and e.dept_id = e.dept_id
where e.name like 'A%' or e.name like '%e' 
group by e.dept_id,e.name;

--same diff strings

select e.name,count(e.dept_id)
from employees e
join departments d
on e.dept_id = d.dept_id and e.dept_id = e.dept_id
where e.name like 'Z%' or e.name like '%r%' 
group by e.dept_id,e.name;

--Find employees who are not assigned to any project and work in the Finance department.;

SELECT e.*
FROM employees e
LEFT JOIN projects p ON e.emp_id = p.emp_id
JOIN departments d ON e.dept_id = d.dept_id
WHERE p.emp_id IS NULL AND d.dept_name = 'Finance';

--Find employees who are working on a project and have a salary greater than the average salary of all employees.;

SELECT DISTINCT e.name
FROM employees e
JOIN projects p ON e.emp_id = p.emp_id
WHERE e.salary > (SELECT AVG(salary) FROM employees);  -- good way

--Same ways

select distinct e.name
from employees e
join projects p
on e.emp_id = p.emp_id
join (select avg(salary) av from employees) e
where e.av < e.salary;

--List the names of employees who work on all the projects that the 'HR' department is involved in.;
Figure out what projects HR employees are working on
Figure out what projects HR employees are working on ✅
Find employees who are assigned to all those projects ✅. ---Tricky

SELECT e.name
FROM employees e
JOIN projects p ON e.emp_id = p.emp_id
JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_name <> 'HR'
GROUP BY e.emp_id, e.name
HAVING COUNT(DISTINCT p.project_name) = 
    (SELECT COUNT(DISTINCT p.project_name)
     FROM employees e
     JOIN projects p ON e.emp_id = p.emp_id
     JOIN departments d ON e.dept_id = d.dept_id
     WHERE d.dept_name = 'HR');

