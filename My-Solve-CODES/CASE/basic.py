

SELECT 
    emp_name,
    salary,
    CASE 
        WHEN salary > 80000 THEN 'High'
        WHEN salary BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;







The **`CASE` statement** in SQL is used to perform **conditional logic** inside queries — similar to an **IF-THEN-ELSE** structure in programming. It allows you to return specific values based on conditions.

---

### 🧠 **Basic Syntax**

```sql
SELECT
    column_name,
    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE result3
    END AS new_column_name
FROM table_name;
```

---

### 📘 **Example 1: Simple CASE**

Suppose you have an `employees` table with columns `emp_name` and `salary`.

```sql
SELECT 
    emp_name,
    salary,
    CASE 
        WHEN salary > 80000 THEN 'High'
        WHEN salary BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;
```

✅ **Explanation:**

* If `salary > 80000` → output “High”
* If `salary` is between `50000` and `80000` → “Medium”
* Otherwise → “Low”

---

### 📗 **Example 2: CASE in ORDER BY**

You can use `CASE` to customize sorting:

```sql
SELECT emp_name, department
FROM employees
ORDER BY 
    CASE 
        WHEN department = 'IT' THEN 1
        WHEN department = 'HR' THEN 2
        ELSE 3
    END;
```

✅ **Explanation:** Prioritize IT first, HR second, others last.

---

### 📙 **Example 3: CASE in UPDATE**

You can use `CASE` inside an `UPDATE` statement:

```sql
UPDATE employees
SET bonus = 
    CASE 
        WHEN performance_rating = 'A' THEN 10000
        WHEN performance_rating = 'B' THEN 5000
        ELSE 1000
    END;
```

---

### 📒 **Example 4: Nested CASE**

You can nest `CASE` inside another:

```sql
SELECT emp_name,
    CASE 
        WHEN department = 'Sales' THEN 
            CASE 
                WHEN salary > 70000 THEN 'Top Sales'
                ELSE 'Regular Sales'
            END
        ELSE 'Other Department'
    END AS emp_category
FROM employees;
```

---

### 🔹 Key Points

* You can use `CASE` in `SELECT`, `UPDATE`, `DELETE`, `ORDER BY`, and `GROUP BY` clauses.
* Each `CASE` must end with `END`.
* `ELSE` is optional — if omitted and no condition matches, SQL returns `NULL`.

---

Would you like me to give you **practice questions (basic to advanced)** using `CASE` for SQL interviews?

