xquery version "3.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

let $res := 
for $employee_worksfor in doc("company.xml")/company/worksfor
let $result := $employee_worksfor/empId
group by $result
order by count($result) descending
where subsequence(count($result),1,1)
return $result

let $res1 := 
for $x in subsequence($res,1,1)
return $x 

for $y in doc("company.xml")/company/employee
where $res1 = $y/empId
return <query6>{data($y/empId),data($y/empName),data($y/empPhone),data($y/empOffice)}</query6>
