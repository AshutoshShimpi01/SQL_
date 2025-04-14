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


