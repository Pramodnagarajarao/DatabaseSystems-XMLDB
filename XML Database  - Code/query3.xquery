xquery version "3.0";

declare namespace ext="http://www.altova.com/xslt-extensions";


let $var_emp1 := doc("company.xml")/company/employee[empName = "PSmith"]/empId 
let $var_emp2 := doc("company.xml")/company/employee[empName = "Wong"]/empId
for $department_div in distinct-values(doc("company.xml")/company/division/housedDeptId) 
let $divisions := doc("company.xml")/company/division[housedDeptId = $department_div] 
where (count($divisions[managerEmpId = $var_emp1])>0) and (count($divisions[managerEmpId = $var_emp2])=0)
return <query3>
{data(doc("company.xml")/company/department[deptId = $divisions/housedDeptId]/deptName)}
</query3>

