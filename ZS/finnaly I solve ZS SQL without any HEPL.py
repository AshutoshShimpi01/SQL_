

--------- 100 % my code ---------



Top 3 customers by total spending in year 2024 for each region.

with total_spent as
(
select c.cust_name,c.region,sum(o.total_amount) as total_s
from customers c
join orders o on c.cust_id = o.cust_id
where order_date between '2024-01-01' and '2024-12-31'
group by c.cust_name,c.region
order by total_s desc
), rr as
(
select cust_name,region,total_s,
rank() over(partition by region order by total_s desc) as rkk
from total_spent
)
select * from rr
where rkk < 4;
