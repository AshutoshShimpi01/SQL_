-- Top 3 customers by total spending in year 2024 for each region
WITH customer_totals AS (           -- (1) Build per-customer totals first
    SELECT 
        c.cust_name,
        c.region,
        SUM(o.total_amount) AS total_spent
    FROM Orders o
    JOIN Customers c
      ON c.cust_id = o.cust_id
    WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
    GROUP BY c.cust_name, c.region
),
ranked AS (                         -- (2) Rank customers within each region
    SELECT 
        cust_name,
        region,
        total_spent,
        RANK() OVER (
            PARTITION BY region 
            ORDER BY total_spent DESC
        ) AS rk
    FROM customer_totals
)
SELECT *                            -- (3) Keep only the Top 3 ranks (with ties)
FROM ranked
WHERE rk <= 3
ORDER BY region, rk, total_spent DESC;  -- (4) Nice, readable output
