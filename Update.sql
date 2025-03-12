update EMPLOYEE
set name='pravin' 
where empid=1;




'1','pravin','Sales','69'
'2','Dave','Accounting','86'
'3','Ava','Sales','81'
'4','DEV','Sales','98'
'5','OMKAR','Accounting','78'
'6','vinod','Sales','55'
'7','pritesh','Sales','59'







Operation                                       	Command	                                    Purpose
Basic Update	            UPDATE employees SET salary = 50000 WHERE emp_id = 101;	     Updates one column
Update Multiple Columns	  UPDATE employees SET salary = 55000, department = 'Finance' WHERE emp_id = 102;	   Updates multiple columns
Update Using JOIN	      UPDATE employees e JOIN departments d ON e.dept_id = d.dept_id SET e.salary = e.salary + 5000 WHERE d.department_name = 'HR';	  Updates based on another table
Update Using Subquery	  UPDATE employees SET salary = (SELECT AVG(salary) FROM employees) WHERE department = 'Sales';	Updates using subquery
Conditional Update	    UPDATE employees SET salary = CASE WHEN salary < 30000 THEN salary + 5000 ELSE salary + 1000 END;	   Updates different values based on conditions
Update with LIMIT	      UPDATE employees SET salary = salary + 5000 WHERE department = 'HR' LIMIT 5;	   Updates limited rows (MySQL only)
Update with ORDER BY	  UPDATE employees SET salary = salary + 5000 WHERE department = 'HR' ORDER BY salary DESC LIMIT 3;   	Updates the top 3 highest-paid HR employees
Update with IF	        UPDATE employees SET salary = IF(salary < 30000, salary + 5000, salary);	   Uses IF to conditionally update
Reset a Column	        UPDATE employees SET bonus = NULL WHERE department = 'IT';    	Sets a column to NULL
