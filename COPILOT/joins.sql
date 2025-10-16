----Find the department with the highest average salary of its employees.;

select d.dept_name,avg(salary)
from employees e
join departments d on e.dept_id = d.dept_id
group by dept_name
order by avg(salary) desc
limit 1;

--List all projects and the number of employees assigned to each.;

select project_name, count(ea.emp_id) as numb_of_employees
from employees e
join employee_project_assignments ea on e.emp_id = ea.emp_id
join projects p on p.project_id = ea.project_id
group by project_name;

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

--List project names and their total hours worked by all employees.;



-- Find the employee(s) with the highest salary in each department.

select x.name,x.dept_name,x.salary from
(select e.name,d.dept_name,e.salary,
rank() over(partition by d.dept_name order by salary desc) as rk
from employees e
join departments d
on e.dept_id = d.dept_id) x
where x.rk < 2;

select p.project_name,ea.project_id, sum(hours_worked)
from projects p
join employee_project_assignments ea on p.project_id =ea.project_id 
group by ea.project_id,p.project_name;
