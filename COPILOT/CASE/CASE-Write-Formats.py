

The `CASE` statement is incredibly versatile in SQL. Here are several common use cases, demonstrating its different writing formats (Simple vs. Searched) and placements within a query (`SELECT`, `ORDER BY`, and **Conditional Aggregation**).

-----

## 1\. Conditional Logic in the `SELECT` Clause (Data Classification)

This is the most common use: creating a new, calculated column that classifies data based on conditions.

### A. Searched `CASE` Format (Most Flexible)

This is used for ranges or complex, non-equal conditions.

**Use Case:** **Categorizing Employee Tenure**

```sql
SELECT
    name,
    hire_date,
    -- Determine the employee's tenure category
    CASE
        WHEN DATEDIFF(CURRENT_DATE(), hire_date) / 365.25 >= 10 THEN 'Veteran (10+ Yrs)'
        WHEN DATEDIFF(CURRENT_DATE(), hire_date) / 365.25 >= 5  THEN 'Mid-Career (5-10 Yrs)'
        ELSE 'New/Early Career (< 5 Yrs)'
    END AS tenure_level
FROM
    employees;
```

-----

### B. Simple `CASE` Format

This is used for checking a single expression against a list of exact values. It's cleaner when conditions are simple equality checks.

**Use Case:** **Mapping Status Codes to Descriptions**

```sql
SELECT
    order_id,
    status_code,
    -- Map single status code to a readable description
    CASE status_code
        WHEN 1 THEN 'Processing'
        WHEN 2 THEN 'Shipped'
        WHEN 3 THEN 'Delivered'
        ELSE 'Error/Unknown'
    END AS order_status_description
FROM
    orders;
```

-----

## 2\. Conditional Aggregation (Creating Pivot Tables)

This is a powerful technique using the `CASE` statement inside an aggregate function (`SUM`, `COUNT`, `AVG`) to perform **side-by-side comparisons** across different groups.

**Use Case:** **Comparing Regional Sales in One Row (Pivoting Data)**

Instead of using `GROUP BY` to get three separate rows, we get one row with three columns.

```sql
SELECT
    -- Sums sales only for the North region
    SUM(CASE WHEN region = 'North' THEN sales_amount ELSE 0 END) AS Total_Sales_North,

    -- Sums sales only for the South region
    SUM(CASE WHEN region = 'South' THEN sales_amount ELSE 0 END) AS Total_Sales_South,

    -- Counts the number of transactions in the West region
    COUNT(CASE WHEN region = 'West' THEN 1 ELSE NULL END) AS Count_Transactions_West
FROM
    sales_data;
```

-----

## 3\. Custom Sorting in the `ORDER BY` Clause

You can use a `CASE` statement in the `ORDER BY` clause to define a **specific, non-alphanumeric sort order**.

**Use Case:** **Ordering Products by Priority (High, Medium, Low)**

If you order by the `priority` column alphabetically, 'High' might not come first. The `CASE` statement assigns a numeric value for sorting.

```sql
SELECT
    product_name,
    priority
FROM
    products
ORDER BY
    -- Assign a numeric weight for custom sorting
    CASE priority
        WHEN 'High'   THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'Low'    THEN 3
        ELSE 4
    END,
    product_name ASC; -- Secondary sort
```

-----

## 4\. Conditional Filtering in the `WHERE` Clause (Rare but Useful)

While most filtering is done directly, the `CASE` statement can be used to apply **different filter logic based on a parameter or column value**.

**Use Case:** **Filtering based on User Role (Self-Service Dashboard)**

```sql
-- Assume the current user's role is stored in a variable: @CurrentRole
SELECT
    *
FROM
    transactions
WHERE
    -- If the user is an 'Auditor', show all transactions
    CASE
        WHEN @CurrentRole = 'Auditor' THEN 1 -- Always true (1=1)
        
        -- If the user is 'Manager', show only completed transactions
        WHEN @CurrentRole = 'Manager' AND status = 'Completed' THEN 1
        
        -- Otherwise (for all other roles or uncompleted transactions), show nothing
        ELSE 0
    END = 1;
```
