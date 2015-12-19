xquery version "3.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

for $employee_worksfor in doc("company.xml")/company/worksfor
let $result := $employee_worksfor/divId
group by $result
where count(data(($employee_worksfor/empId)))=8
return <query2>{
for $div in $result
for $divName in doc("company.xml")/company/division
where $div = $divName/divId
return data($divName/divName)}</query2>
