select  dept,count(*) from Employee
group by dept
having max(marks) > 85
order by dept asc ;




select country, count(customer_id) as customers
from Customers
group by country
having max(age) > 25;

customer_id	first_name	last_name	age	country
1	           John	          Doe	  31	 USA
2	            Robert	      Luna	22	 USA
3	           David	     Robinson	22	 UK
4	           John	      Reinhardt 25	 UK
5	            Betty	       Doe	  28	


country	customers
UAE	      1
USA	      2
