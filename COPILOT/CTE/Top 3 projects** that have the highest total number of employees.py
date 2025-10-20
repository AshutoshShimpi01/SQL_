-- 2.  **Top 3 Most Assigned Projects:** Find the **Top 3 projects** that have the highest total number of employees
-- assigned to them across the company. List the project name and the total employee count.




with top as
(
select p.project_name, 
count(ep.emp_id) over(partition by p.project_id ) as cnt
from employee_project_assignments ep
join projects p on p.project_id = ep.project_id
)
select distinct project_name,cnt from top
order by cnt desc
limit 3;
