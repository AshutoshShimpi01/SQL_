

-- Display each department’s total salary and the running total of salaries ordered by employee salary.

select  d.dept_name,
sum(e.salary) over(partition by e.dept_id) as total_sal,
sum(e.salary) over(order by salary) as running_total_sal
from employees e
join departments d on d.dept_id = e.dept_id
;




The final output the question wants is a table that displays the **department's name**, the **total salary paid by that specific department**, and a **cumulative sum of salaries across all departments**, where the cumulative sum is ordered based on the individual employee's salary.

The query's goal is to produce a result that looks like this:

| dept\_name | total\_dept\_salary | running\_total\_salary |
       
| HR            | 50000                           | 40000 |
| Sales          | 150000                        | 90000 |
| HR            | 50000                         | 140000 |
| Sales          | 150000                       | 250000 |
| IT            | 200000                       | 450000 |


***

### Explanation of Output Columns

1.  **`total_dept_salary`**: This is the result of an aggregated window function (`SUM(salary) OVER(PARTITION BY dept_name)`). 
It shows the total amount paid by that specific department.
2.  **`running_total_salary`**: This is the result of a cumulative window function (`SUM(salary) OVER(ORDER BY salary)`).
It shows the sum of all salaries up to and including the current row, ordered by the employee's salary.

The output will have **one row per employee**, not one row per department, because the running total requires individual employee rows to calculate the cumulative sum correctly.
