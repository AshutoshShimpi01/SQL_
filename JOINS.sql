find all student detais and their dept_names from dept table , starting from max marks.

select * from (select *, row_number() over(partition by dept_id) r from student s
where dept_id in (select dept_id,department_name from department) ;
