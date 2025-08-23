
---- fetch those emp who earn more than avg salary using cte

with av_sal as 
(select avg(salary) as av from employees)
select e.* from employees e
cross join av_sal as a 
where e.salary > a.av;
