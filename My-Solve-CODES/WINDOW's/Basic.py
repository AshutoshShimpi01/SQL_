

That’s awesome to hear 😄
Let’s go through **Window Functions** in SQL — one of the *most powerful and interview-focused* topics for Data Engineers.

---

## 🧠 What Are Window Functions?

A **Window Function** performs a calculation **across a set of table rows that are related to the current row**, without collapsing them into a single result (unlike `GROUP BY`).

👉 They use the keyword **`OVER()`** to define a “window” — a specific set of rows to perform the calculation on.

---

## 🧩 Syntax

```sql
function_name (expression) 
OVER (
    PARTITION BY column_name
    ORDER BY column_name
)
```

* **`function_name`** → aggregate or ranking function (like `SUM`, `AVG`, `RANK`, etc.)
* **`PARTITION BY`** → divides rows into groups (like a grouped version of `GROUP BY`)
* **`ORDER BY`** → defines the order of rows within each partition

---

## 🔹 1. **Aggregate Window Functions**

These behave like aggregate functions but keep *all rows*:

### Example

```sql
SELECT 
    department,
    emp_name,
    salary,
    SUM(salary) OVER (PARTITION BY department) AS total_dept_salary,
    AVG(salary) OVER (PARTITION BY department) AS avg_dept_salary
FROM employees;
```

✅ **Explanation:**

* `SUM(salary)` gives total salary **per department**
* Each row still appears (not grouped)

---

## 🔹 2. **Ranking Functions**

Used to assign ranks to rows.

| Function       | Description                                           |
| -------------- | ----------------------------------------------------- |
| `ROW_NUMBER()` | Unique number for each row                            |
| `RANK()`       | Gives rank; same rank for ties, next rank skipped     |
| `DENSE_RANK()` | Gives rank; same rank for ties, next rank not skipped |

### Example

```sql
SELECT 
    emp_name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_in_dept,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_in_dept,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rownum_in_dept
FROM employees;
```

---

## 🔹 3. **Value Functions**

| Function              | Description                       |
| --------------------- | --------------------------------- |
| `LAG(column, n)`      | Gets value from **n** rows before |
| `LEAD(column, n)`     | Gets value from **n** rows after  |
| `FIRST_VALUE(column)` | First value in the window         |
| `LAST_VALUE(column)`  | Last value in the window          |

### Example

```sql
SELECT 
    emp_name,
    department,
    salary,
    LAG(salary) OVER (PARTITION BY department ORDER BY salary) AS prev_salary,
    LEAD(salary) OVER (PARTITION BY department ORDER BY salary) AS next_salary
FROM employees;
```

✅ Shows previous and next salaries within the same department.

---

## 🔹 4. **Running Totals & Moving Averages**

### Example — Running Total

```sql
SELECT 
    emp_name,
    department,
    salary,
    SUM(salary) OVER (PARTITION BY department ORDER BY salary 
                      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM employees;
```

### Example — Moving Average (last 2 rows + current)

```sql
SELECT 
    emp_name,
    salary,
    AVG(salary) OVER (ORDER BY emp_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM employees;
```

---

## 🔹 5. **NTILE(n)**

Divides rows into `n` buckets (percentiles, quartiles, etc.)

```sql
SELECT 
    emp_name,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS quartile
FROM employees;
```

✅ Splits employees into 4 salary groups (Q1–Q4).

---

## ⚙️ Key Points

* `PARTITION BY` → divides dataset into independent groups
* `ORDER BY` → defines the row order inside each partition
* You can **combine multiple window functions** in one query
* Cannot use `WHERE` with window functions directly (use subquery or CTE)

---

Would you like me to give you **10 basic, 10 intermediate, and 10 advanced** SQL window function practice questions (just like your earlier set)?
