
-find how many times a char repeated in name
select length(name) -length(replace(name,'a','')) from student;


- how many times as repeated in names
select (length(name) -length(replace(name,'as',''))) / length('as') from student;


-sh
select (length(name) -length(replace(name,'sh',''))) / length('sh') from student;  -- Query gives float value.

using round() function it gives int value-
select round((length(name) -length(replace(name,'sh',''))) / length('sh')) from student;


-find how many times a char repeated in sentence
select length('This is a beautiful day, sql is easy')
-length(replace('This is a beautiful day, sql is easy','a',''));


-count Space in sentence
select length('This is a beautiful day, sql is easy')
-length(replace('This is a beautiful day, sql is easy',' ',''));




