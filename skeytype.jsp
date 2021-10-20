<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

<style type="text/css" media="all">
      @import url("css/site.css");@import
      url("css/screen.css");
    </style>
<style>

.login{
font-family: Times New Roman;
font-size: 22px;
color: #153E7E;
background-color:whitesmoke;
text-indent: 20px;
border-top : 2px groove grey;
border-bottom : 2px groove grey;
border-left : 2px groove grey;
border-right : 2px groove grey;
	
}
.login th{
background-image: linear-gradient(to top,teal, black);
color:white;
}

.textbox {
    Width: 360px;
    Padding: 16px 6px;
    Font: 20px/25px “Lato”, Arial, sans-serif;
    Color: #333;
    Box-sizing: border-box;
    Letter-spacing: 1px;
    Border:0;
    Border: 1px solid #ccc;
    Transition: 0.4s;
    border-radius:10px;

}

select{
width: 360px;
font-family: Times New Roman;
font-size: 26px;
 border-radius:10px;
Font: 20px/25px “Lato”, Arial, sans-serif;
    Color: #333;
   Padding: 16px 6px;
     
}
</style>
<script>
function checkNumeric(num){
var nume=num.value;
//alert(nume);
if(isNaN(nume)){
	//document.getElementById("num").innerHTML="";
	alert("Only Numeric value allowed");
	num.value="";
}


}

function updateSType(){
	
	var stype=document.getElementById('stype').value;
	//alert(stype);
	document.stypeform.action="skey?action=STYPEUPDATE&stype="+stype;
	document.stypeform.method="post";
	document.stypeform.submit();
		
}


</script>

<title>Konnect2Grow - Let's connect </title>
</head>

<body>

<c:if test="${empty ADMIN}">
<c:redirect url="/admin?action=login"/>
</c:if>

<div class="maindv">
<jsp:include page="adminHeader.jsp"/>


<form name='stypeform' action="skey?action=INSERTSTYPE" onSubmit='return checkValue(this)' method='post'>

<div align=center>
<table border=0 align=center cellpadding=4 cellspacing=4 class='login' width=590 height=400>
<tr><th class='bg2' colspan=4 align=center>Seed Key Type</th>
</tr>
<tr>
<td colspan=4 style='color:red'>
${MSG}
</td>
</tr>


<tr>
<td>SKeyType </td>
<td>
<select name='stype' id='stype'>
<option value='S50'>S50</option>
<option value='S100'>S100</option>
<option value='S200'>S200</option>
<option value='S400'>S400</option>
<option value='S600'>S600</option>
<option value='S800'>S800</option>
<option value='S1000'>S1000</option>
<option value='S1200'>S1200</option>
<option value='S1600'>S1600</option>
<option value='S2000'>S2000</option>
<option value='S3200'>S3200</option>

<option value='S4000'>S4000</option>
<option value='S6400'>S6400</option>

<option value='S8000'>S8000</option>
<option value='S16000'>S16000</option>
<option value='S32000'>S32000</option>
<option value='S64000'>S64000</option>

</select>
</td>
<tr>
<td>Duration</td>
<td><input type='text' class='textbox' name='duration' onChange='checkNumeric(this)' required>
</td></tr>
<tr>
<td>Key Value</td>
<td><input type='text' class='textbox' name='keyval' onChange='checkNumeric(this)' required>
</td></tr>


<tr>
<td>Status </td>
<td>
<select name='status'>
<option value='ACTIVE'>ACTIVE</option>
<option value='INACTIVE'>INACTIVE</option>

</select>
</td>
</tr>
<tr><td colspan=2><hr></td></tr>
<tr>
<td></td><td><input type='submit' class="acbutton" style="width:140px;" value='Insert'>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input class='sdbutton' style="width:140px;" type='button' value='Update' onclick='updateSType()'>
</td></tr>

<tr align=center>
<td colspan=4 align=center>
<hr>
<table border=1 align=center cellpadding=6 cellspacing=4 class='login' width='580px'>
<tr bgcolor=grey><th>SType</th><th>Duration</th>
<th>GType</th><th>Key Value</th><th>Status</th>
</tr>
<c:forEach var='skeytype' items="${requestScope.SKEYTYPES}"> 
<tr>
<td>${skeytype.stype}</td>
<td>${skeytype.duration}</td>
<td>${skeytype.gtype}</td>
<td>${skeytype.keyVal}</td>

<td>${skeytype.status}</td>
</tr>
</c:forEach>
</table>
</td>
</tr>

</table>






</form>


<jsp:include page="footer.jsp"/>
</div>
</div>
</body>

</html>