select name,max(marks)
from employee
group by name
having max(marks) > 75;

'Dave','86'
'Ava','81'
'DEV','98'
'OMKAR','78'
'parth','80'
