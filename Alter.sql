alter table EMPLOYEE
change sal salary int;
      (old) (new)



alter table student
add column dept_id int ;   -add column


alter table worker
rename column W_Id to wid;  - rename column name






Operation	                    Command	                                        Purpose
Rename Table-	  ALTER TABLE old_name RENAME TO new_name;	                 Changes table name
Add Column	ALTER -    TABLE employees ADD COLUMN age INT;	                  Adds a new column
Modify Column-	ALTER TABLE employees MODIFY COLUMN age VARCHAR(3);	     Changes column data type
Rename Column-	ALTER TABLE employees RENAME COLUMN salary TO monthly_salary;  Renames a column
Drop Column	ALTER-    TABLE employees DROP COLUMN age;                            Removes a column
Add Primary Key-	ALTER TABLE employees ADD PRIMARY KEY (emp_id);	             Adds a primary key
Drop Primary Key-	ALTER TABLE employees DROP PRIMARY KEY;	                   Removes a primary key
Add Foreign Key-	ALTER TABLE employees ADD FOREIGN KEY (dept_id) REFERENCES departments(dept_id);	Adds a foreign key
Drop Foreign Key-	ALTER TABLE employees DROP FOREIGN KEY emp_dept_fk;	        Removes a foreign key
Rename Index-	ALTER TABLE employees RENAME INDEX old_idx TO new_idx;	  Renames an index
Drop Index-	ALTER TABLE employees DROP INDEX idx_name;	Removes an index
Modify View	CREATE OR REPLACE VIEW emp_view AS SELECT name, salary FROM employees;	Updates a view
Change Password	ALTER USER 'root'@'localhost' IDENTIFIED BY 'newpass';	   Updates a user's password
