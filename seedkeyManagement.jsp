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

Padding: 15px 6px;
   Box-shadow: 0px 8px 16px 0px gray;
    
}
select{
Width: 380px;

Padding: 14px 8px;
Font: 20px/25px 'Lato', Arial, sans-serif;


 border-radius:10px;

}
.textbox{
Width: 380px;

Padding: 14px 8px;
Font: 20px/25px 'Lato', Arial, sans-serif;
Box-shadow: 0px 8px 16px 0px gray;
   

 border-radius:10px;

}

a:hover{
color: red;

}

</style>

<script>

function getSeeder(){
	
	var stype=document.getElementById('stype').value;
	//alert(stype);
	//if(stype=="Select"){
	//	return false;	
	//}
	
}
function openBox(){
	

	var box=document.getElementById('seederid').disabled;
	if(box==true){
		document.getElementById('seederid').disabled=false;
	}
	else{
document.getElementById('seederid').disabled=true;
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


<form name='tform' action="skey?action=GETSEEDERS" onSubmit='return getSeeder(this)' method='post'>

<table border='0px' style='padding:8px 6px;' class='login' width='580px' height='420px'>
<tr class='bg1'><th colspan='2'>Seed Key Management</th></tr>
<tr>
<th><a href="seeder?action=BindLogs">Bind Logs</a></th>
<th style='text-align:right;'>



<a href="admin?action=VIEWPAGE">View SKeys</a></th>
</tr>
<tr>
<td colspan='3' style='color:red'>
<c:if test="${not empty MSG}">
Status: ${MSG}
</c:if>
</td>
</tr>

<tr>
<td>Seed Type : </td><td colspan='2'>
<select name='stype' id='stype'>
<option value='Select'>Select</option>
<c:forEach var='stypes' items="${requestScope.STYPES}"> 
<option value='${stypes}'>${stypes}</option>
</c:forEach>
</select>
</td>
</tr>

<tr><td>District : </td>
<td style='color:red; text-align:left;'>
<input type='text' class='textbox' name='seederid' id='seederid' disabled='true' />
</td>

</tr>


<tr><td><label for='dist'>By District</label> <input type='checkbox' id='dist' onclick='openBox()'/></td>
<td style='color:red; text-align:right;' colspan='2'>
<input class='button' type='Submit' value='Get'/>
</td>

</tr>

<tr>
<td colspan='3'>


<div style='overflow-y:scroll; overflow-y:hidden; width:570'>
<display:table name="sessionScope.SEEDERS" class="ts" style="width:1060px;" pagesize='20' export="false" decorator="com.konnect2grow.decorator.Wrapper">

<display:column property="seederActions" title="Actions"/> 
<display:column property="timeElapsed" title="Elapsed"/> 
  
<display:column property="seederid" title="Seeder Id" class="idcol" />
<display:column property="address1" title="SType" class="idcol" />


  

    <display:column property="name" title="Name"/>
    <display:column property="district"/>
<display:column property="doj" title="Seed Date"/>

    <display:column property="state" title="Status"/>
    
	



</display:table>
</div>
</td>

</tr>



</table>

</form>
<jsp:include page="footer.jsp"/>
</div>

</body>

</html>
</jsp:root>