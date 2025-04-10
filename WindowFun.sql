select e.*, rank() over(order by marks desc) as rnk from employee e;
'4','DEV','Sales','98','Ganesh','1'
'3','Ava','Sales','90','Ganesh','2'
'5','OMKAR','Accounting','90','Dattu','2'
'2','Dave','Accounting','86','Kartik','4'
'8','parth','Accounting','80','Kartik','5'
'1','Clark','Sales','69','Ganesh','6'
'7','pritesh','Sales','59','Ganesh','7'
'6','vinod','Sales','55','Ganesh','8'

Dense_rank()

select e.*, dense_rank() over(order by marks desc) as rnk from employee e;


'4','DEV','Sales','98','Ganesh','1'
'3','Ava','Sales','90','Ganesh','2'
'5','OMKAR','Accounting','90','Dattu','2'
'2','Dave','Accounting','86','Kartik','3'
'8','parth','Accounting','80','Kartik','4'
'1','Clark','Sales','69','Ganesh','5'
'7','pritesh','Sales','59','Ganesh','6'
'6','vinod','Sales','55','Ganesh','7'



---------------------
To display all row number.
  
select *, row_number() over() from employee ;

---------------------

find all emp details which got maximum marks in their dept.

select *, row_number() over(partition by dept order by marks desc) as dept from employee ;



