--find all student detais and their dept_names from dept table , starting from max marks.

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


--Count of Students Per Department Who Scored More Than 80 Marks

SELECT d.dept_name, COUNT(s.student_id) AS high_scorers
FROM student s
JOIN department d ON s.dept_id = d.dept_id
WHERE s.marks > 80
GROUP BY d.dept_name;
--not showing dept_name here
Select * from student where marks > 80 and dept_id in ( 
Select dept_id from department);

--same using a correlated subquery:     scalar subquery — meaning it returns a single value (one column, one row).
SELECT s.*, 
       (SELECT d.dept_name 
        FROM department d 
        WHERE d.dept_id = s.dept_id) AS dept_name
FROM student s
WHERE s.marks > 80;

--Department(s) with the Highest Number of Students

select dept_name,count(student_id)
from student s
join department d
on s.dept_id = d.dept_id
group by dept_name 
having count(student_id) =(
select max(c) from
(select dept_id,count(*) as c from student group by dept_id) x);

--Count of Students Enrolled Each Year, Only for B.Tech Course

select year_of_enrollment,count(student_id) as BTECH_student_enr
from student
where course = 'B.Tech'
group by year_of_enrollment
order by year_of_enrollment;

--Count of Female Students Per Department

select dept_name,count(gender) as Females
from department d
join student s
on s.dept_id = d.dept_id
where gender='Female'
group by dept_name;

--CDepartments With Less Than 3 Students-->;

select dept_name,count(student_id)
from student s
join department d
on s.dept_id = d.dept_id
group by dept_name
having count(student_id) <3;

--Find Students Who Belong to Departments With More Than 3 Students;


SELECT * 
FROM student 
WHERE dept_id IN (
    SELECT dept_id
    FROM student
    GROUP BY dept_id
    HAVING COUNT(*) > 2
);
