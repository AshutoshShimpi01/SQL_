
-find how many times a char repeated in name
  
select length(name) -length(replace(name,'a','')) from student;


- how many times as repeated in names

select (length(name) -length(replace(name,'as',''))) / length('as') from student;

-sh

select (length(name) -length(replace(name,'sh',''))) / length('sh') from student;


