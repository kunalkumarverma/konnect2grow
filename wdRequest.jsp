<jsp:root version="1.2" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:display="urn:jsptld:http://displaytag.sf.net" xmlns:c="http://java.sun.com/jsp/jstl/core">
 
<meta name='viewport' content='Width=device-width, initial-scale=0.6'/>



<jsp:directive.page contentType="text/html; charset=UTF-8" />
  <jsp:directive.page import="com.konnect2grow.seeder.*" />

  <jsp:directive.page import="com.konnect2grow.*" />
  <jsp:directive.page import="java.util.*" />

<html>
<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

    <style type="text/css" media="all">
      @import url("css/maven-base.css"); @import url("css/maven-theme.css"); @import url("css/site.css"); @import
      url("css/screen.css");
    </style>
<link rel="stylesheet" href="./css/print.css" type="text/css" media="print" />

<style>
.login{
font-family: Times New Roman;
font-size: 20px;
color: #153E7E;
background-color:whitesmoke;
text-indent: 20px;
border-top : 4px groove grey;
border-bottom : 4px groove grey;
border-left : 4px groove grey;
border-right : 4px groove grey;
	
}
.button{
font-family: Times New Roman;
font-size: 20px;
color: white;
border-radius:10px;
text-indent:2px;
width:200px;
font-weight:800;
background-image: linear-gradient(to bottom, black, gray); 

Padding: 15px 3px;
   Box-shadow: 0px 8px 16px 0px gray;
    
}
select{
font-family: Times New Roman;
font-size: 26px;
Padding: 15px 8px;
border-radius: 10px;
width:400px;

}
a:hover{
color: red;

}

</style>

<script>

function getWithdraw(){
	
	var status=document.getElementById('status').value;
	//alert(stype);
	if(status=="Select"){
		return false;	
	}
	
}


</script>

<title>Konnect2Grow - Let's connect </title>
</head>

<body>

<c:if test="${empty ADMIN}">
<c:redirect url="/admin?action=login"/>
</c:if>

<div class='maindv' align='center' width='600px'>
<jsp:include page="adminHeader.jsp"/>


<form name='tform' action="admin?action=WITHDRAW" onSubmit='return getWithdraw()' method='post'>

<table border='0px' cellpadding='10px' cellspacing='4px' class='login' width='590px' height='420px'>
<tr class='bg1'><th colspan='3'>Withdrawal Management</th>
</tr>
<tr>
<td colspan='3' style='color:red'>
<c:if test="${not empty MSG}">
Status: ${MSG}
</c:if>
</td>
</tr>

<tr>
<td>Status : </td><td>
<select name='status' id='status'>
<option value='Select'>Select</option>
<option value='All'>All</option>

<option value='Request'>Request</option>
<option value='Reject'>Reject</option>
<option value='Approve'>Approve</option>
<option value='Paid'>Paid</option>


</select>
</td></tr>
<tr><td></td>
<td style='color:red; text-align:right;'>
<input class='button' type='Submit' value='Get'/>
</td>

</tr>

<tr>
<td colspan='3'>


<div style='overflow-y:scroll; overflow-y:hidden; width:570;'>
<display:table name="sessionScope.WDS" class="its" style="width:1590px; height:600px; " pagesize='10' export="false" decorator="com.konnect2grow.decorator.Wrapper">


<display:column property="withdrawSrno" title="SrNo" class="idcol" />

<display:column property="seederid" title="Seeder Id"/>
    
    <display:column property="name" title="Name"/>
    <display:column property="district" title="District"/>
    <display:column property="withdrawl" title="Withdrawal"/>
    <display:column property="reqdate" title="Request Date"/>
    <display:column property="bonusremain" title="Bonus Left"/>
    <display:column property="status" title="Status"/>    
	<display:column property="paiddate" title="Paid Date"/>
    <display:column property="transactionid" title="Transaction Id"/>

	
    
	



</display:table>
</div>
</td>

</tr>



</table>

</form>

</div>

</body>

</html>
</jsp:root>