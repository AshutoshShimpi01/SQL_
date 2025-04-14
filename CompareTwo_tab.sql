-- See counts of matching & non-matching

SELECT
  (SELECT COUNT(*) FROM HR.EMPLOYEES t1
JOIN HR.DEPARTMENTS t2 
  ON t1.department_id = t2.department_id) AS matching,
  (SELECT COUNT(*) FROM HR.EMPLOYEES) AS EMPLOYEES_total,
  (SELECT COUNT(*) FROM HR.DEPARTMENTS) AS DEPARTMENTS_total;  -- 
