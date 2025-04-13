find all student detais and their dept_names from dept table , starting from max marks.

select * from (select *, row_number() over(partition by dept_id) r from student s
where dept_id in (select dept_id,department_name from department) ;
------
select avg(marks),d.dept_name,s.student_id,s.gender
from STUDENT s
join department d
on s.dept_id = d.dept_id
group by d.dept_name,s.student_id,s.gender
having avg(marks) > 80
order by s.gender
;


Count of Students Per Department Who Scored More Than 80 Marks

SELECT d.dept_name, COUNT(s.student_id) AS high_scorers
FROM student s
JOIN department d ON s.dept_id = d.dept_id
WHERE s.marks > 80
GROUP BY d.dept_name;
