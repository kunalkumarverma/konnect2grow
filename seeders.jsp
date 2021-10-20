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
width:50px;
font-weight:800;
background-image: linear-gradient(to bottom, black, gray); 

Padding: 8px 3px;
   Box-shadow: 0px 8px 16px 0px gray;
    
}

.textbox {
    Width: 300px;
    Padding: 16px 6px;
    Font: 20px/20px "Lato", Arial, sans-serif;
    Color: #333;
    Box-sizing: border-box;
    Letter-spacing: 1px;
    Border:0;
    Transition: 0.4s;
    border-radius:10px;
 Box-shadow: 0px 8px 16px 0px gray;
  
}

select{
 Width: 360px;
    Padding: 15px 6px;
    Font: 20px/20px "Lato", Arial, sans-serif;
    Color: #333;
    Box-sizing: border-box;
    Letter-spacing: 1px;
    Border:0;
    Transition: 0.4s;
    border-radius:10px;
 Box-shadow: 0px 8px 16px 0px gray;
  }
a:hover{
color: red;

}
label{
font-family: Times New Roman;
font-size: 26px;
font-weight:800;

}
.Active{
color:teal;

}

</style>

<script>

function getSeeder(){
	
	var stype=document.getElementById('stype').value;
	//alert(stype);
	if(stype=="Select"){
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


<form name='tform' action="seeder?action=seeders" onSubmit='return getSeeder(this)' method='post'>

<table border='0px' cellpadding='4px' cellspacing='4px' class='login' width='590px' height='auto'>
<tr class='bg1'><th colspan='3'>Seeder Management</th>
</tr>
<tr>
<td colspan='3' style='color:red'>
<c:if test="${not empty MSG}">
Status: ${MSG}
</c:if>
</td>
</tr>
<tr>
<td><label>Search By : </label></td><td>
<select name='flag'>
<option value="SEEDERID">Seeder Id</option>
<option value="NAME">Name</option>
<option value="DISTRICT">District</option>
<option value="STATE">State</option>
<option value="STATUS">Status</option>
<option value="MOBILE">Mobile</option>
<option value="REFER">Refer By</option>

</select>
</td>

</tr>

<tr>
<td><label>Search Key : </label></td><td>
<input type='text' name='searchby' id='searchby' class="textbox"/>
<input class='button' type='Submit' value='&#128269;'/></td>
<td>
</td>

</tr>

<tr>
<td colspan='3'>


<div style='overflow-y:scroll; overflow-y:scroll; width:570'>
<display:table name="requestScope.SEEDERS" class="its" style="width:860px; height:auto;" pagesize='50' export="true" decorator="com.konnect2grow.decorator.Wrapper">

<display:column property="seedersStatus" title="Status"/> 
<display:column property="seederids" title="Seeder Id"/> 
<display:column property="logs" title="Name"/> 


    <display:column property="district" title="District"/>
    <display:column property="state" title="State"/>
    
	


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