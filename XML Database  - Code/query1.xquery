xquery version "3.0";
    

for $departmentname in doc("company.xml")/company/department
for $division in doc("company.xml")/company/division
for $works in doc("company.xml")/company/worksfor
where (($works/percentTime >= "50" and $works/empId = "1") or ($works/percentTime >= "50" and $works/empId = "3")) and
    $works/divId = $division/divId and $departmentname/deptId = $division/housedDeptId
    return <query1>{data($departmentname/deptName)}
    </query1>

    
    