xquery version "3.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

<query5>{
let $denom := doc("company.xml")/company
let $count := count($denom/employee)
for $child in doc("company.xml")/company
let $res := count($child/worksfor)
return $res div $count
}</query5>
