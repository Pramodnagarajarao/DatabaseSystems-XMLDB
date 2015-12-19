<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
 <div style="font-family: 'arial'"> 
  <h2 style="font-size:24px; font-weight:bold;color:red;  background-color:yellow">Employee Information</h2>
  <p style="font-size:12px">      
<xsl:for-each select="company/employee">
Employee <b><xsl:value-of select="empName"/></b> Works from <b><xsl:value-of select="empOffice"/></b>. <b><xsl:value-of select="empName"/></b> Works for 
<b> <xsl:value-of select="count(../worksfor[empId=current()/empId])"/></b> division(s), <xsl:variable name="division_count">
<xsl:value-of select="count(../worksfor[empId=current()/empId])"/>
</xsl:variable> <xsl:if test="not($division_count = 0)"> which are </xsl:if> 
<xsl:for-each select="../worksfor[empId=current()/empId]">
<b><xsl:value-of select="../division[divId=current()/divId]/divName"/></b>
<xsl:if test="not(position() = last() or position() = last()-1)">, </xsl:if>
<xsl:if test="position() = last()-1"> <b> and </b> </xsl:if>
</xsl:for-each>. 
 <b><xsl:value-of select="empName"/></b> manages
<xsl:value-of select="count(../division[managerEmpId=current()/empId])"/> division(s)
<xsl:variable name="manager_count">
<xsl:value-of select="count(../division[managerEmpId=current()/empId])"/>
</xsl:variable>
<xsl:if test="not($manager_count = 0)"> which are </xsl:if>
<xsl:for-each select="../division[managerEmpId=current()/empId]">
<b><xsl:value-of select="../division[divId=current()/divId]/divName"/></b>
<xsl:if test="not(position() = last() or position() = last()-1)"><b>,</b></xsl:if>
<xsl:if test="position() = last()-1"> <b> and </b> </xsl:if>
</xsl:for-each>.
 <b><xsl:value-of select="empName"/></b> works for the most time with the 
<xsl:variable name="id">
<xsl:for-each select="../worksfor[empId=current()/empId]">
<xsl:sort select="current()/percentTime" data-type="number" order="descending"/>
<xsl:if test="position() = 1"><xsl:value-of select="current()/divId"/></xsl:if>
</xsl:for-each>
</xsl:variable>
<b><xsl:value-of select="../division[divId=$id]/divName"/></b> division.<br/>
</xsl:for-each>
<h2 style="font-size:24px; font-weight:bold;color:red;  background-color:LightGreen">Department Information</h2></p>
<p style="font-size:12px">
 <xsl:for-each select="company/department">
Department <b><xsl:value-of select="deptName"/></b> houses <b><xsl:value-of select="count(../division[housedDeptId=current()/deptId])"/></b> division(s):
<xsl:for-each select="../division[housedDeptId=current()/deptId]">
<b><xsl:value-of select="current()/divName"/></b>
<xsl:if test="not(position() = last() or position() = last()-1)">, </xsl:if>
<xsl:if test="position() = last()-1"> <b> and </b> </xsl:if>

</xsl:for-each>.<br/>
</xsl:for-each>
</p>
</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
