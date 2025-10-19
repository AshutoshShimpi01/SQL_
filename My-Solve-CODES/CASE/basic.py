

SELECT 
    emp_name,
    salary,
    CASE 
        WHEN salary > 80000 THEN 'High'
        WHEN salary BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;


