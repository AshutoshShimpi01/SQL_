
-- top 2 employees Have more salary in each dept

select * from 
(select e.*,d.dept_name,
rank() over(partition by dept_name order by salary desc) as rk
from employees e
join departments d
on e.dept_id = d.dept_id) as x
where x.rk <= 2;


-- Top 2 highest-paid employees per department


SET @rank := 0;
SET @prev_region := '';

select * from
(select e.emp_id, e.name, d.dept_name, e.salary,
rank() over(partition by dept_name order by salary desc) rk
from employees e
join departments d
on e.dept_id = d.dept_id) x
where x.rk < 3;


# 2️⃣ Customers whose spending is above the average in their region (2024)
-- cust_name, region, total_spent, avg_spent_region

select *
from (
    select 
        cust_name,
        region,
        total_spent,
        avg(total_spent) over (partition by region) as avg_spent_region
    from (
        select 
            c.cust_name,
            c.region,
            sum(o.total_amount) as total_spent
        from Customers c
        join Orders o on c.cust_id = o.cust_id
        where o.order_date between '2024-01-01' and '2024-12-31'
        group by c.cust_name, c.region
    ) x
) y
where total_spent > avg_spent_region;

-- Same But Best Approch for pro

select *
from (
    select c.cust_name, c.region,
           sum(o.total_amount) as total_spent,
           avg(sum(o.total_amount)) over (partition by c.region) as avg_spent_region
    from Customers c
    join Orders o on c.cust_id = o.cust_id
    group by c.cust_name, c.region
) t
where total_spent > avg_spent_region;


