
-—List employees who are working on more than one project and have a salary between 6000 and 10000.;

select e.name,count(p.emp_id) as ep
from employees e
join projects p
on e.emp_id = p.emp_id
where salary between 5000 and 6000
group by p.emp_id
having count(p.emp_id) > 1;


---—Find employee names who are not assigned to any project and belong to departments other than ‘Marketing’.;

select e.name
from employees e
left join projects p
on e.emp_id =p.emp_id
join departments d on e.dept_id = d.dept_id
where project_id is null and dept_name <> 'Marketing';


--Display department names which have at least one employee whose name contains the letter ‘z’.;


select DISTINCT d.dept_name
from departments d
join employees e
on e.dept_id = d.dept_id
where e.name like '%z%';

--List all projects where the assigned employee’s department is
 either ‘Operations’ or ‘Legal’, and the project name ends with 'x'.;
 
 select p.project_name
 from projects p
 join employees e on e.emp_id = p.emp_id
 join departments d on e.dept_id = d.dept_id
 where (d.dept_name = 'Operations' or d.dept_name = 'Legal') and p.project_name like '%x';

--Employees with highest salary in each department:
Write a query to find the name and salary of employees who have the highest salary within each department.;

select name,salary from employees where salary in(
select max(e.salary)
from employees e
join departments d
on e.dept_id = d.dept_id
group by d.dept_name);
--SAME
SELECT e.name, e.salary
FROM employees e
WHERE e.salary IN (
    SELECT MAX(e1.salary)
    FROM employees e1
    WHERE e1.dept_id = e.dept_id
    GROUP BY e1.dept_id
);
