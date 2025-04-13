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
