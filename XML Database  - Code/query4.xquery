xquery version "3.0";


 let $list1 := doc("company.xml")/company/employee
 let $list2 := doc("company.xml")/company/division 
  for $item1 in $list1/empId
  order by $item1/../empName descending
  return
    if (some $item2 in $list2/managerEmpId satisfies $item2/text() = $item1/text())
       then ()
       else
        <query4>{data($item1/../empName) , data($item1/../empPhone),data($item1/../empOffice)}</query4>       
       
       
       
       
       
       