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



<style>
.login{
font-family: Times New Roman;
font-size: 20px;
color: white;
background-color:whitesmoke;
text-indent: 20px;
border-top : 4px groove grey;
border-bottom : 4px groove grey;
border-left : 4px groove grey;
border-right : 4px groove grey;

background-image: linear-gradient(to bottom, lightgray, teal); 
	
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

Padding: 14px 6px;
   Box-shadow: 0px 8px 16px 0px gray;
    
}
.textbox{
Width: 420px;
    Padding: 14px 6px;
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
Width: 380px;
    Padding: 15px 4px;
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

</style>

<script>


function openBox(){
	
	
	var box=document.getElementById('district').disabled;
	if(box==true){
		document.getElementById('district').disabled=false;
	}
	else{
document.getElementById('district').disabled=true;
	}
}

</script>

<title>Konnect2Grow - Let's connect </title>
</head>

<body>

<c:if test="${empty ADMIN}">
<c:redirect url="/admin?action=login"/>
</c:if>


<div class="maindv" align='center' width='600px'>
<jsp:include page="adminHeader.jsp"/>


<form name='tform' action="skey?action=viewSeeder" method='post'>

<table border='1' align='center' cellpadding='6' cellspacing='4' class='login' width='580px'>
<tr bgcolor='grey'><th>SType</th><th>Elapsed</th>
<th>Status</th>
</tr>
<c:forEach var='skeytype' items="${requestScope.SKEYTYPES}"> 
<tr>
<td>${skeytype.stype}</td>
<td>${skeytype.duration} hr</td>

<td>${skeytype.status}</td>
</tr>
</c:forEach>
</table>


<table border='0px' class='login' style='padding:15px 6px;' width='570px' height='520px'>
<tr class='bg1'><th>Seed Key Binding Tool</th>
</tr>
<tr>
<td style='color:red'>
<c:if test="${not empty MSG}">
Status: ${MSG}
</c:if>
</td>
</tr>

<tr>
<td><b>Seeder Name : ${SEEDER.name} </b></td>
</tr><tr>
<td><b>Seeder SkeyType : ${SEEDER.address2}</b></td></tr>
<tr>
<td>District : ${SEEDER.district}<input type='hidden' name='skey' value='${SEEDER.skey}'/></td>

</tr>

<tr>
<td>SKey Type : 
<select name='sstype' id='stype'>
<option value='Select'>Select</option>
<c:forEach var='stypes' items="${sessionScope.STYPES}"> 
<option value='${stypes}'>${stypes}</option>
</c:forEach>
</select>
</td>
</tr>
<tr>
<td>District : <input type='text' class='textbox' name='district' id='district' disabled='true'/></td>
</tr>
<tr><td colspan='2'><hr></hr></td></tr>
<tr>
<td style='color:red;'><label for="dist">By District</label>
<input type='checkbox' onClick='openBox()' id='dist'/>
<input class='button' type='submit' value='Get'/>
<input class='button' type='button' value='Back' onclick="javascript:window.history.back();"/>

</td>

</tr>

<tr>

<td>


<div style='overflow-y:scroll; overflow-y:hidden; width:570'>

<display:table name="sessionScope.SEEDERS1" class="its" style="width:1090px; height:auto" pagesize='40' export="false" decorator="com.konnect2grow.decorator.Wrapper">
<display:column property="binderActions" title="Actions"/> 

<display:column property="seederid" title="SID" class="idcol" />
<display:column property="bonus" title="Remain"/>
   
<display:column property="address1" title="SType" class="idcol" />
<display:column property="timeElapsed" title="Elapsed"/> 
 
    <display:column property="name" title="Name"/>
    <display:column property="district"/>
    <display:column property="doj" title="Seed/Paid"/>
    <display:column property="status" title="Lifecycle"/>
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