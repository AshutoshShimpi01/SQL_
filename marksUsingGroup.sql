select name,max(marks)
from employee
group by name
having max(marks) > 75;

'Dave','86'
'Ava','81'
'DEV','98'
'OMKAR','78'
'parth','80'


same using where



select name,max(marks) as pass
from employee
where marks>75
group by name;
