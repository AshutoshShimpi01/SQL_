1. String Functions
sql
Copy
Edit
SELECT UPPER('hello world') FROM dual;  -- Output: HELLO WORLD
SELECT LOWER('HELLO') FROM dual;  -- Output: hello
SELECT LENGTH('Oracle') FROM dual;  -- Output: 6
SELECT SUBSTR('Database', 3, 4) FROM dual;  -- Output: taba


2. Number Functions
sql
Copy
Edit
SELECT ROUND(123.456, 2) FROM dual;  -- Output: 123.46
SELECT TRUNC(123.456, 2) FROM dual;  -- Output: 123.45
SELECT MOD(10, 3) FROM dual;  -- Output: 1
SELECT CEIL(4.3) FROM dual;  -- Output: 5
SELECT FLOOR(4.8) FROM dual;  -- Output: 4


3. Date Functions
sql
Copy
Edit
SELECT SYSDATE FROM dual;  -- Output: Current system date
SELECT CURRENT_TIMESTAMP FROM dual;  -- Output: Current date & time with timezone
SELECT ADD_MONTHS(SYSDATE, 3) FROM dual;  -- Output: Adds 3 months to current date
SELECT LAST_DAY(SYSDATE) FROM dual;  -- Output: Last day of the current month
SELECT EXTRACT(YEAR FROM SYSDATE) FROM dual;  -- Output: Current year


4. Conversion Functions
sql
Copy
Edit
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY') FROM dual;  -- Output: 05-MAR-2025
SELECT TO_NUMBER('12345') FROM dual;  -- Output: 12345
SELECT TO_DATE('2025-03-05', 'YYYY-MM-DD') FROM dual;  -- Output: 05-MAR-2025


5. Aggregate Functions (with GROUP BY)
sql
Copy
Edit
SELECT dept, AVG(salary) FROM employees GROUP BY dept;  -- Average salary per department
SELECT COUNT(*) FROM employees WHERE dept = 'IT';  -- Count of IT employees
SELECT MAX(salary) FROM employees;  -- Highest salary


6. Analytical (Window) Functions
sql
Copy
Edit
SELECT name, salary, RANK() OVER (ORDER BY salary DESC) AS rank FROM employees;


7. Conditional Functions
sql
Copy
Edit
SELECT name, salary,
       CASE 
           WHEN salary > 5000 THEN 'High'
           WHEN salary BETWEEN 3000 AND 5000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM employees;


8. JSON Functions (Oracle 12c+)
sql
Copy
Edit
SELECT JSON_VALUE('{"name": "John", "age": 30}', '$.name') FROM dual;  -- Output: John


9. XML Functions
sql
Copy
Edit
SELECT EXTRACT(XMLTYPE('<root><name>John</name></root>'), '/root/name') FROM dual;
