
Perfect! 🚀 Since you’re already good at SQL, diving deeper into window functions with subqueries is exactly what will sharpen your advanced querying skills — especially for analytics and data engineering.
Let’s structure this learning in 3 levels:



🔹 1. Recap: Core Window Functions
Window functions let you perform calculations across a set of rows related to the current row, without collapsing them into a single result. Common ones:
* ROW_NUMBER(), RANK(), DENSE_RANK()
* SUM() OVER(), AVG() OVER(), MAX() OVER()
* LAG(), LEAD()
* NTILE()
Syntax:
function_name(expression) 
OVER (PARTITION BY column ORDER BY column)

🔹 2. Window Functions Inside Subqueries
This is where it gets powerful. You can:
1. Use window functions in subqueries (or CTEs) and then filter outside.
2. Use subqueries to define a window and then apply multiple functions.
Example 1: Top 3 customers per region (using subquery + window function)
SELECT *
FROM (
    SELECT c.cust_name,
           c.region,
           SUM(o.total_amount) AS total_spent,
           ROW_NUMBER() OVER(PARTITION BY c.region ORDER BY SUM(o.total_amount) DESC) AS rn
    FROM Customers c
    JOIN Orders o ON c.cust_id = o.cust_id
    GROUP BY c.cust_name, c.region
) x
WHERE rn <= 3;

Example 2: Find employees earning more than their department’s average salary
SELECT *
FROM (
    SELECT e.emp_id,
           e.emp_name,
           e.department_id,
           e.salary,
           AVG(e.salary) OVER(PARTITION BY e.department_id) AS dept_avg
    FROM Employees e
) x
WHERE salary > dept_avg;

Example 3: Latest order per customer using RANK() in subquery
SELECT cust_id, order_id, order_date, total_amount
FROM (
    SELECT o.*,
           RANK() OVER(PARTITION BY cust_id ORDER BY order_date DESC) AS rnk
    FROM Orders o
) x
WHERE rnk = 1;

🔹 3. Advanced Subquery + Window Function Combinations
👉 These are the kinds of interview-level problems you’ll face:
1. Customers who spent above their region’s average but are not the top spender.
2. Employees whose salary is within the top 10% of their department.
3. Products whose sales are above the median in their category (requires clever window function use).
4. Month-over-month growth calculation for each customer (using LAG() in subquery).
5. Ranking departments by variance of employee salaries (window + aggregation).

⚡ My suggestion for you:
* Start with basic window functions.
* Then rewrite queries using subqueries + window functions (instead of plain GROUP BY).
* Finally, try nested queries with multiple window functions (rank inside, then filter outside).

👉 Do you want me to prepare a set of 15 practice problems (basic → intermediate → hard) for you specifically focused on window functions inside subqueries, so you can solve them one by one?





Perfect 🔥 Let’s make a practice set of 10 SQL problems (intermediate + advanced) that combine window functions + subqueries. I’ll give you just the problem statements (no answers) so you can practice writing queries yourself.

🧩 10 SQL Window Function + Subquery Problems
🔹 Intermediate (1–5)
1. Top 3 Employees per Department Find the top 3 employees with the highest salary in each department.
2. Employees Above Department Average List employees whose salary is higher than their department’s average salary.
3. Second Highest Order Per Customer For each customer, find their second most recent order.
4. Monthly Sales vs Previous Month For each month, calculate total sales and compare it with the previous month’s sales (show difference).
5. Customers Who Spent More Than Regional Average but Not the Top Spender From the Customers and Orders tables, list customers who spent more than the average in their region but are not ranked 1 in that region.

🔹 Advanced (6–10)
1. Top 10% Salaries Per Department Find employees whose salary falls in the top 10% of their department.
2. Median Salary Per Department For each department, find employees whose salary is above the department’s median salary.
3. Year-over-Year Growth per Customer For each customer, calculate yearly total spend and show the percentage growth compared to the previous year.
4. Department Salary Variance Ranking Rank departments based on the variance of employee salaries (highest variance first).
5. Longest Continuous Order Streak per Customer For each customer, find the longest streak of consecutive months where they placed at least one order.

👉 These are designed to stretch your skills:
* Problems 1–5 = strong use of ROW_NUMBER(), RANK(), LAG(), LEAD().
* Problems 6–10 = require nested subqueries + advanced window logic (NTILE(), median trick, variance, streaks).

Would you like me to provide step-by-step solutions for each of these 10 (with queries), or do you want to try them first and then I’ll give you the solutions when you’re ready?
