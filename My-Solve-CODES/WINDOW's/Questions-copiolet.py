


🧩 Intermediate SQL Window Function Questions

Rank all employees by their salary within each department.

Find the top 2 highest-paid employees in every department.

Show each employee’s salary difference compared to their department’s average salary.

Display each department’s total salary and the running total of salaries ordered by employee salary.

For each employee, show the previous and next employee’s salary within the same department.

List employees whose salary is higher than their department’s average salary.

Divide all employees into 4 quartiles based on their salary.

Rank departments by their average employee salary.

Find each employee’s total hours worked and compare it with their department’s average hours.

Show employees who have worked the most total hours in their respective departments.

Calculate cumulative project hours for each employee across their assigned projects.

Find the difference between an employee’s project hours and the average hours for that project.

Display each employee’s first and last project based on project start date.

Calculate what percentage of the total department salary each employee’s salary represents.

Rank all projects based on the total hours worked by all employees combined.



















Perfect 👏 — those questions are based on a **classic employee–department–project schema**, which is ideal for practicing intermediate SQL window functions.

Let’s assume this schema 👇

---

### 🧱 **Schema**

#### `employees`

| Column    | Type    | Example    |
| --------- | ------- | ---------- |
| emp_id    | INT     | 101        |
| emp_name  | VARCHAR | John Doe   |
| salary    | DECIMAL | 8500       |
| hire_date | DATE    | 2019-04-10 |
| dept_id   | INT     | 1          |

#### `departments`

| Column    | Type    | Example  |
| --------- | ------- | -------- |
| dept_id   | INT     | 1        |
| dept_name | VARCHAR | Finance  |
| location  | VARCHAR | New York |

#### `projects`

| Column       | Type    | Example    |
| ------------ | ------- | ---------- |
| project_id   | INT     | 501        |
| project_name | VARCHAR | Zeus       |
| start_date   | DATE    | 2021-02-01 |
| end_date     | DATE    | 2023-12-31 |

#### `employee_projects`

| Column       | Type | Example |
| ------------ | ---- | ------- |
| emp_id       | INT  | 101     |
| project_id   | INT  | 501     |
| hours_worked | INT  | 120     |

---

Now here are **15 Intermediate SQL Queries using Window Functions** built on this schema 👇

---

### 🧩 **Intermediate SQL Window Function Queries**

#### 1️⃣ Rank employees by salary within each department

```sql
SELECT 
    e.emp_name,
    d.dept_name,
    e.salary,
    RANK() OVER (PARTITION BY d.dept_name ORDER BY e.salary DESC) AS rank_in_dept
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
```

---

#### 2️⃣ Find the top 2 highest-paid employees in each department

```sql
SELECT *
FROM (
    SELECT 
        e.emp_name,
        d.dept_name,
        e.salary,
        DENSE_RANK() OVER (PARTITION BY d.dept_name ORDER BY e.salary DESC) AS salary_rank
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
) ranked
WHERE salary_rank <= 2;
```

---

#### 3️⃣ Find each employee’s salary difference from the department average

```sql
SELECT 
    e.emp_name,
    d.dept_name,
    e.salary,
    ROUND(
        e.salary - AVG(e.salary) OVER (PARTITION BY d.dept_name), 2
    ) AS diff_from_dept_avg
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
```

---

#### 4️⃣ Calculate each department’s total and running total salary

```sql
SELECT 
    d.dept_name,
    e.emp_name,
    e.salary,
    SUM(e.salary) OVER (PARTITION BY d.dept_name) AS dept_total_salary,
    SUM(e.salary) OVER (PARTITION BY d.dept_name ORDER BY e.salary DESC
                        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
```

---

#### 5️⃣ Show each employee’s previous and next employee’s salary (within department)

```sql
SELECT 
    e.emp_name,
    d.dept_name,
    e.salary,
    LAG(e.salary) OVER (PARTITION BY d.dept_name ORDER BY e.salary) AS prev_salary,
    LEAD(e.salary) OVER (PARTITION BY d.dept_name ORDER BY e.salary) AS next_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
```

---

#### 6️⃣ Find employees whose salary is above their department’s average

```sql
SELECT *
FROM (
    SELECT 
        e.emp_name,
        d.dept_name,
        e.salary,
        AVG(e.salary) OVER (PARTITION BY d.dept_name) AS avg_salary
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
) sub
WHERE salary > avg_salary;
```

---

#### 7️⃣ Assign quartiles (NTILE) to employees based on salary across the whole company

```sql
SELECT 
    emp_name,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees;
```

---

#### 8️⃣ Calculate average salary per department and rank departments by it

```sql
SELECT DISTINCT
    d.dept_name,
    AVG(e.salary) OVER (PARTITION BY d.dept_name) AS avg_salary,
    RANK() OVER (ORDER BY AVG(e.salary) OVER (PARTITION BY d.dept_name) DESC) AS dept_rank
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
```

---

#### 9️⃣ Find each employee’s total hours worked and compare to department average

```sql
SELECT 
    e.emp_name,
    d.dept_name,
    SUM(ep.hours_worked) AS total_hours,
    AVG(SUM(ep.hours_worked)) OVER (PARTITION BY d.dept_name) AS avg_dept_hours
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_name, d.dept_name;
```

---

#### 🔟 Show employees who have the most total hours in their department

```sql
SELECT *
FROM (
    SELECT 
        e.emp_name,
        d.dept_name,
        SUM(ep.hours_worked) AS total_hours,
        RANK() OVER (PARTITION BY d.dept_name ORDER BY SUM(ep.hours_worked) DESC) AS dept_rank
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
    JOIN employee_projects ep ON e.emp_id = ep.emp_id
    GROUP BY e.emp_name, d.dept_name
) ranked
WHERE dept_rank = 1;
```

---

#### 11️⃣ Calculate cumulative project hours per employee

```sql
SELECT 
    e.emp_name,
    ep.project_id,
    ep.hours_worked,
    SUM(ep.hours_worked) OVER (PARTITION BY e.emp_name ORDER BY ep.project_id) AS running_hours
FROM employee_projects ep
JOIN employees e ON e.emp_id = ep.emp_id;
```

---

#### 12️⃣ Find difference between an employee’s project hours and the project average

```sql
SELECT 
    e.emp_name,
    p.project_name,
    ep.hours_worked,
    AVG(ep.hours_worked) OVER (PARTITION BY p.project_name) AS avg_project_hours,
    ep.hours_worked - AVG(ep.hours_worked) OVER (PARTITION BY p.project_name) AS diff_from_avg
FROM employee_projects ep
JOIN employees e ON e.emp_id = ep.emp_id
JOIN projects p ON ep.project_id = p.project_id;
```

---

#### 13️⃣ Find each employee’s first and last project (by start date)

```sql
SELECT DISTINCT
    e.emp_name,
    FIRST_VALUE(p.project_name) OVER (PARTITION BY e.emp_name ORDER BY p.start_date) AS first_project,
    LAST_VALUE(p.project_name) OVER (PARTITION BY e.emp_name ORDER BY p.start_date
                                    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_project
FROM employee_projects ep
JOIN projects p ON ep.project_id = p.project_id
JOIN employees e ON e.emp_id = ep.emp_id;
```

---

#### 14️⃣ Calculate the percentage of each employee’s salary relative to their department total

```sql
SELECT 
    e.emp_name,
    d.dept_name,
    e.salary,
    ROUND(
        100.0 * e.salary / SUM(e.salary) OVER (PARTITION BY d.dept_name),
        2
    ) AS salary_percent_of_dept
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
```

---

#### 15️⃣ Rank projects based on total hours worked across all employees

```sql
SELECT 
    p.project_name,
    SUM(ep.hours_worked) AS total_hours,
    RANK() OVER (ORDER BY SUM(ep.hours_worked) DESC) AS project_rank
FROM employee_projects ep
JOIN projects p ON ep.project_id = p.project_id
GROUP BY p.project_name;
```

---

Would you like me to prepare the **next level (Advanced 15 Window Function questions)** from this same schema — including topics like **window frames**, **percentiles**, and **conditional aggregations** (used in data engineering interviews)?
