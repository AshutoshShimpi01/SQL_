CREATE DATABASE GPT;
use GPT;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance'),
(40, 'Marketing');

-- Insert employees
INSERT INTO employees (emp_id, name, dept_id, salary) VALUES
(1, 'Alice', 10, 5000.00),
(2, 'Bob', 20, 6000.00),
(3, 'Charlie', 10, 7000.00),
(4, 'Diana', 30, 5500.00);

-- Insert projects
INSERT INTO projects (project_id, project_name, emp_id) VALUES
(101, 'Alpha', 1),
(102, 'Beta', 2),
(103, 'Gamma', 1),
(104, 'Omega', 4);


--JOINS Problems

--Show each employee's name along with the count of projects they're working on.

SELECT e.name, p.emp_id, COUNT(p.project_name) AS emp_project_count
FROM employees e
JOIN projects p ON e.emp_id = p.emp_id
GROUP BY e.emp_id, e.name;
--with their Project_names
SELECT 
  e.emp_id,
  e.name,
  COUNT(p.project_name) AS total_projects,
  GROUP_CONCAT(p.project_name SEPARATOR ', ') AS projects -- shows all project names
FROM employees e
JOIN projects p ON e.emp_id = p.emp_id
GROUP BY e.emp_id, e.name;

----Find employees who work in the same department as 'Alice'
select concat(e1.name,'&', e2.name)
from employees e1
join employees e2
on e1.dept_id = e2.dept_id 
where e1.emp_id < e2.emp_id;

----List the department name and the highest salary in each department.;

select e.name,d.dept_name,max(e.salary) as highest_salary
from employees e
join departments d
on e.dept_id = d.dept_id
group by d.dept_name,e.name;

---- List project names along with employee names who are working on them.';

select p.project_name,e.name
from employees e
left join projects p
on e.emp_id = p.emp_id;

-- --List departments with more than one employee.;
 
 select d.dept_name,count(d.dept_id)
 from employees e
 join departments d
 on e.dept_id = d.dept_id
 group by dept_name
 having count(d.dept_id) > 1;

----List all employees who are not assigned to any project.;

select e.name
from employees e
left join projects p
on e.emp_id = p.emp_id
where p.emp_id is null;

--List all project names along with the department name of the employee working on that project.;

select e.emp_id,p.project_name,d.dept_name
from projects p
join employees e
on p.emp_id = e.emp_id
join departments d
on e.dept_id = d.dept_id;

--List all employees along with their project names. 
If an employee is not assigned to any project, still show the employee.;

select e.name,p.project_name
from employees e
left join projects p
on e.emp_id = p.emp_id;

--List all departments where the average salary is greater than 5500.;

select d.dept_name,avg(salary)
from departments d
join employees e
on d.dept_id = e.dept_id
group by dept_name
having avg(salary) > 5500;


--Show the total salary paid per department.;

select d.dept_name,sum(salary)
from departments d
join employees e
on e.dept_id = d.dept_id
group by dept_name;

--Show employees who are working on more than one project.;

select name,dept_id from employees where emp_id in(
select emp_id
from projects
group by emp_id
having count(emp_id) > 1);
--
select e.name,count(p.emp_id) as working_projects
from employees e
left join projects p
on e.emp_id = p.emp_id
group by p.emp_id,e.name
having count(p.emp_id) > 1;

--
--Display all departments that don’t have any employees assigned;
--Joins
SELECT d.*
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
WHERE e.dept_id IS NULL;

--using SubQuery;
select * from departments where dept_id not in
(select dept_id from employees);



