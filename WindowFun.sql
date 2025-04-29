RANK()

select e.*, rank() over(order by marks desc) as rnk from employee e;
'4','DEV','Sales','98','Ganesh','1'
'3','Ava','Sales','90','Ganesh','2'
'5','OMKAR','Accounting','90','Dattu','2'
'2','Dave','Accounting','86','Kartik','4'
'8','parth','Accounting','80','Kartik','5'
'1','Clark','Sales','69','Ganesh','6'
'7','pritesh','Sales','59','Ganesh','7'
'6','vinod','Sales','55','Ganesh','8'

--it fetchs only 1st rank salary in each dept
WITH ranked_employees AS (
    SELECT e.*, 
           RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rak
    FROM employees e
)
SELECT *
FROM ranked_employees
WHERE rak = 1;


Dense_rank()

select e.*, dense_rank() over(order by marks desc) as rnk from employee e;


'4','DEV','Sales','98','Ganesh','1'
'3','Ava','Sales','90','Ganesh','2'
'5','OMKAR','Accounting','90','Dattu','2'
'2','Dave','Accounting','86','Kartik','3'
'8','parth','Accounting','80','Kartik','4'
'1','Clark','Sales','69','Ganesh','5'
'7','pritesh','Sales','59','Ganesh','6'
'6','vinod','Sales','55','Ganesh','7'



---------------------
To display all row number.
  
select *, row_number() over() from employee ;

---------------------

find all emp details which got maximum marks in their dept.

select *, row_number() over(partition by dept order by marks desc) as dept from employee ;


NTILE()

--divide employees into 3 salary buckets and labeling them

select emp_id,
      case when x.bucket = 1 then 'high salary'
           when x.bucket = 2 then 'midium salary'
           when x.bucket = 3 then 'low salary'
      end as salary_range
from (select *,
ntile(3) over(order by salary desc) as bucket
from employees) x;

--count how many employees fall into each salary range using your NTILE-based buckets

SELECT 
    CASE 
        WHEN bucket = 1 THEN 'high salary'
        WHEN bucket = 2 THEN 'medium salary'
        WHEN bucket = 3 THEN 'low salary'
    END AS salary_range,
    COUNT(*) AS num_employees
FROM (
    SELECT NTILE(3) OVER (ORDER BY salary DESC) AS bucket
    FROM employees
) ranked
GROUP BY bucket
ORDER BY bucket;



