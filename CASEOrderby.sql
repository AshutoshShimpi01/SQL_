SELECT name, age
FROM student
ORDER BY
(CASE
    WHEN name IS NULL THEN age
    ELSE name
END);

'abhi_S','31'
'ashutosh','23'
'nikita','21'
'omkar','27'
'pawan','17'
'riya','19'
'rushi','21'
'sai','18'
'shruti','21'
'vinod','25'




select COUNTRY_ID,COUNTRY_NAME,
CASE
     when COUNTRY_NAME like 'A%' then COUNTRY_ID
else 'Not'
end as COUNTry
from hr.COUNTRIES;
