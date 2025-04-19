create database COPILOT;
use copilot;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT,
    dept_id INT,
    joining_date DATE
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE
);

CREATE TABLE employee_project_assignments (
    emp_id INT,
    project_id INT,
    role VARCHAR(100),
    hours_worked INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'Engineering', 'New York'),
(2, 'Marketing', 'San Francisco'),
(3, 'Finance', 'Chicago'),
(4, 'HR', 'Boston');

INSERT INTO employees (emp_id, name, salary, dept_id, joining_date) VALUES
(101, 'Alice', 9000, 1, '2018-06-12'),
(102, 'Bob', 6500, 1, '2019-03-15'),
(103, 'Charlie', 7200, 2, '2020-01-20'),
(104, 'Diana', 5000, 2, '2021-05-11'),
(105, 'Evan', 8800, 3, '2017-11-30'),
(106, 'Fiona', 9600, 3, '2018-08-22'),
(107, 'George', 5400, 4, '2022-02-01'),
(108, 'Helen', 7800, 1, '2019-12-10');

INSERT INTO projects (project_id, project_name, start_date, end_date) VALUES
(201, 'Apollo', '2022-01-01', '2022-12-31'),
(202, 'Zeus', '2021-04-15', '2023-04-14'),
(203, 'Hermes', '2023-02-01', NULL),
(204, 'Athena', '2020-09-01', '2021-09-01');

INSERT INTO employee_project_assignments (emp_id, project_id, role, hours_worked) VALUES
(101, 201, 'Lead Developer', 1200),
(102, 201, 'Developer', 950),
(108, 201, 'Tester', 780),
(103, 202, 'Marketing Analyst', 600),
(104, 202, 'Campaign Manager', 720),
(101, 202, 'Technical Consultant', 400),
(105, 204, 'Finance Lead', 1050),
(106, 204, 'Budget Analyst', 890),
(107, 203, 'HR Coordinator', 300),
(108, 203, 'Support Engineer', 420);




Intermediate-
————————
List all employees with their department names.
Find the average salary of employees in each department.
Which departments have more than 2 employees?
List employees who joined before 2020 and earn more than 8000.
Find the employee(s) with the highest salary in each department.
List departments that have no employees.
Get the total salary expense of each department.
List employees whose department is located in 'New York'.
List all projects and the number of employees assigned to each.
Find employees who have worked on more than 1 project.
List project names and their total hours worked by all employees.
Find employees who haven’t worked on any project.
Find employees who worked on projects that ended before 2022.
List employees who worked on a project from a different department.
Get the average hours worked per employee per project.
List the names of employees who worked on the project 'Zeus'.
Find departments that have employees assigned to the project 'Hermes'.
List project names with at least one employee from the 'Finance' department.
Show employee names and their most recent project (based on project start date).
List employees who have worked the maximum hours on a single project.


HARD-LEVEL
————————

List the top 3 employees with the highest total hours worked across all projects.
Find the department with the highest average salary of its employees.
List projects that have employees from every department.
Find employees who have worked on a project that overlaps with the ‘Apollo’ project (i.e., they worked on a project that started before Apollo’s end date and ended after Apollo’s start date).
For each department, list the employees who have worked on the most projects.
Find employees who have worked on projects where their department name matches the project name.
Find the total number of employees who have worked on projects that span across multiple years (e.g., a project that started in 2021 and ended in 2023).
List all projects along with the average hours worked per employee, ordered by the highest average hours.
Find the department with the most employees who have not worked on any project.
Show the names of employees who worked on projects where the total hours worked by all employees combined exceed 5000 hours.
Find employees who worked on the longest ongoing project (i.e., the project that has the maximum number of days between its start and end date).
Get a list of employees who worked on projects that have the same number of employees as the 'Alpha' project.
List all employees who have worked on both the 'Apollo' and 'Zeus' projects.
For each project, find the highest-paid employee who worked on it.
List the department name, project name, and employee names for all projects that have employees from multiple departments.
Find the total number of hours worked by employees who are in the 'HR' department on projects that started after 2021.
List all employees who have worked on a project that started before their joining date.
For each employee, find the difference between the maximum and minimum hours worked on projects they were assigned to.
For each department, list the projects with the highest number of employees assigned.
Find the top 5 projects with the most total hours worked, but exclude any project that has fewer than 3 employees.



