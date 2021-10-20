<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

<style>

input{
font-family: Times New Roman;
font-size: 18px;
border:2px groove grey;
color: #153E7E;
}
.textbox {
    Width: 200px;
    Padding: 6px 4px;
    Font: 20px/25px “Lato”, Arial, sans-serif;
    Color: #333;
    Box-sizing: border-box;
    Letter-spacing: 1px;
    Border:0;
    Border: 1px solid #ccc;
    Transition: 0.4s;
    border-radius:10px;
Box-shadow: 0px 8px 16px 0px gray;
	text-indent:15px;
}

select{

Font: 20px/25px “Lato”, Arial, sans-serif;
    Color: #333;
	padding: 6px 4px;
    Box-sizing: border-box;
   Width: 200px;
    Border: 1px solid #ccc;
    Transition: 0.4s;
    border-radius:10px;
Box-shadow: 0px 8px 16px 0px gray; 
}
.scrolldiv{
height:500px;
width:540px;
margin:auto;

}

</style>

<script>


function getSKeyCount(skeytype){
var xmlhttp;
var skeytype=skeytype.value;
var sfrom=document.getElementById("seederid").value;
//alert(sfrom+skeytype);
if (skeytype=="Select")
  {
  
  return;
 }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	//alert(xmlhttp.responseText);	
    document.getElementById("scount").innerHTML=xmlhttp.responseText;
	  
    }
  }
try{
xmlhttp.open("GET","skey?action=SKEYCOUNT&sfrom="+sfrom+"&stype="+skeytype,true);
}
catch(e){
alert("Unable to connect server, please try later");

}

xmlhttp.send();
}

function copySkey(skey){

var copyText=document.getElementById(skey);
	copyText.select();
	copyText.setSelectionRange(0,99999);
	
	navigator.clipboard.writeText(copyText.value);
	alert("copied the key : "+copyText.value);	
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


<form name='viewkey' action="admin?action=VIEWKEY" onSubmit='return viewkey(this)' method='post'>
<br>

<br>
<table border=0 align=center cellpadding=4 cellspacing=4 class='login2' width=550 height=200>
<tr class=th1><th colspan=3 align=left>View Keys</th>
</tr>
<tr>
<td colspan=3 style='color:red'>
<label style="visibility:hidden" id='errmsg'>Select a seedkey type to seed<label/>

</td>
</tr>
<tr><td>Seeder Id</td><td colspan=2><input type='text' class='textbox' id='seederid' name='seederid'/></td></tr>
<tr>
<td>SKey Type : </td><td>
<select name='tstype' id='tstype' onchange='getSKeyCount(this)'>
<option value='Select'>Select</option>
<c:forEach var='stypes' items="${requestScope.STYPES}"> 
<option value='${stypes}'>${stypes}</option>
</c:forEach>
</select>
</td>
<td style='color:red'>Available &raquo; 
<label id='scount'></label>
</td>

</tr>

<tr><td></td></tr>

<tr><td>
</td>
<td align=left>
<input type='submit' class='sdbutton' style='width:180px;' value='&#128273;GET &raquo;'>
</td>
<td>


</td>
</tr>


</table>


<br>
<div class='scrolldiv' Style='height:200px'>
<table border=1 align=center cellpadding=4 cellspacing=4 class='login2' width='600px' height='auto'>
<tr class='th1' align=left><th colspan=10>
Seed Keys Available
</th></tr>
<tr><th>Seedkey</th><th>SType</th><th>Seeder Id</th><th>Lifecycle</th></tr>
<c:if test="${empty VIEWKEYS}"><tr rowspan=3>
<td colspan=10 align=left style='color:red;'><b>No Record found !</b></td></tr>
</c:if>

<c:forEach var='keys' items="${requestScope.VIEWKEYS}"> 
<tr>
<td><input type='button' class='acbutton' style='width:60px;' value='&#128203;&laquo;' onclick="copySkey('${keys.skey}')">
<input type='text' value='${keys.skey}' id='${keys.skey}' class='textbox'/></td>
<td>${keys.skeytype}</td>
<td>${keys.seederid}</td>
<td>${keys.lifecycle}</td>
</tr>
</c:forEach>

</table>
</div>

</body>

</html>