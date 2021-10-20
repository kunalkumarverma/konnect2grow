<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

<style>

.login{
font-family: Times New Roman;
font-size: 22px;
color: #153E7E;
background-image: linear-gradient(to left, whitesmoke, gray); 
text-indent: 20px;
border-top : 2px groove grey;
border-bottom : 2px groove grey;
border-left : 2px groove grey;
border-right : 2px groove grey;
Box-shadow: 0px 8px 16px 0px teal;
	
}
.login th{
background-image: linear-gradient(to top,teal, black);
color:white;
}


select{
font-family: Times New Roman;
font-size: 26px;
 border-radius:10px;
width:280px;
    Padding: 15px 6px;
}

.textbox {
    Width: 280px;
    Padding: 15px 6px;
    Font: 20px/25px “Lato”, Arial, sans-serif;
    Color: #333;
    Box-sizing: border-box;
    Letter-spacing: 1px;
    Border:0;
    Border: 1px solid #ccc;
    Transition: 0.4s;
    border-radius:10px;

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


function checkValue(form){
	
	var seederid=form.seederassigned.value;
	var nos=form.nos.value;
	//alert(nos);
	if(seederid.length==0||nos.length==0){
		document.getElementById("smsg").style.visibility="visible";
		document.getElementById("smsg").innerHTML="Seeder Id or Nos Missing.";
		return false;	
	}
	else{
	document.getElementById("smsg").style.visibility="hidden";
	return true;
	}
}

function transferSkey(){

	//alert("Hi..");
	
	var sfrom=document.getElementById('sfrom').value;
	var sto=document.getElementById('sto').value;
	
	if(sfrom.length==0 || sto.length==0){
		//alert("Seeder Id Missing..");
		
		document.getElementById("errmsg").style.visibility="visible";
	
	return false;
	}
	else{
		
	document.getElementById("errmsg").style.visibility="hidden";

		//alert(sfrom);
	document.tform.action="skey?action=TRANSKEY&sfrom="+sfrom+"&sto="+sto;
	document.tform.method="post";
	document.tform.submit();
	}	
}

function getName(sid){
var xmlhttp;
//alert(sid.id);
var textid=sid.id;	   
var sid=sid.value;
//var sid=document.getElementById("seederid").value;

if (sid.length==0)
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
    document.getElementById(textid+"Name").innerHTML=xmlhttp.responseText;
	  
    }
  }
try{
xmlhttp.open("GET","seeder?action=GETNAME&SEEDERID="+sid,true);
}
catch(e){
alert("Unable to connect server, please try later");

}

xmlhttp.send();
}

function getSKeyCount(skeytype){
var xmlhttp;
var skeytype=skeytype.value;
var sfrom=document.getElementById("sfrom").value;
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


</script>

<title>Konnect2Grow - Let's connect </title>
</head>

<body>

<c:if test="${empty ADMIN}">
<c:redirect url="/admin?action=login"/>
</c:if>

<div class='maindv'>

<jsp:include page="adminHeader.jsp"/>

<br>
<form action="skey?action=INSERTSEEDKEY" onSubmit='return checkValue(this)' method='post'>


<table border=0 align=center cellpadding=4 cellspacing=4 class='login' width=580 height=400>
<tr><th colspan=2 align=left>Seed Key Generator</th>
</tr>
<tr>
<td colspan=2 style='color:red'>

<c:if test="${not empty SEEDKEY}">
<label for='seedkey'>${NOS}&nbsp;SKey generated for Seeder ${SEEDKEY.seederid}</label>
</c:if>
<label id='smsg'></label>
</td>
</tr>


<tr>
<td>SKeyType* : </td>
<td>
<select name='stype' required>
<c:forEach var='stypes' items="${requestScope.STYPES}"> 
<option value='${stypes}'>${stypes}</option>
</c:forEach>

</select>
</td>
</tr>
<tr>
<td>Nos*  : </td>
<td>
<input type='text' class='textbox' name='nos' onChange='checkNumeric(this)' required>
</td>
</tr>

<tr>
<td>Seeder Id*  : </td>
<td><input type='text' class='textbox' id='seederid' name='seederassigned' style='text-transform:uppercase;' onchange='getName(this)' required><input type=button value='&#128269' onclick='getName()'>
</td></tr>
<tr><td></td>
<td><label id='seederidName'></label></td>
</tr>
<tr><td></td><td>
<input type='submit' class='sdbutton' value='Generate'>

</td></tr>
<tr></tr>
</table>


</form>
<br>
<form name='tform' action="skey?action=INSERTSEEDKEY" onSubmit='return transferSkey(this)' method='post'>

<table border=0 align=center cellpadding=4 cellspacing=4 class='login' width=580 height=520>
<tr><th  colspan=3 align=left>Transfer Seed Key</th>
</tr>
<tr>
<td colspan=2 style='color:red'>
<c:if test="${not empty MSG}">
Transfer Status: ${MSG}
</c:if>
</td>
</tr>
<tr>
<td colspan=2 style='color:red'>
<label style="visibility:hidden" id='errmsg'>Error: Seeder Id Missing.<label/>
</td>
</tr>


<tr>
<td>From (Seeder Id)* : </td>
<td>
<input type=text id='sfrom' name='sfrom' class='textbox' style='text-transform:uppercase;' onchange='getName(this)' required>&#128269;
</td>
</tr>
<tr><td></td>
<td><label id='sfromName'></label> </td>
</tr>
<tr>
<td>SKey Type : </td><td>
<select name='tstype' onchange='getSKeyCount(this)'>
<option value='Select'>Select</option>
<c:forEach var='stypes' items="${requestScope.STYPES}"> 
<option value='${stypes}'>${stypes}</option>
</c:forEach>
</select>
</td></tr>
<tr><td></td>
<td style='color:red'>Available &raquo;
<label id='scount'></label>
</td>

</tr>


<tr>
<td>To (Seeder Id)* : </td>
<td>
<input type=text id='sto' name='sto' class='textbox' style='text-transform:uppercase;' onchange='getName(this)' required> &#128269
</td>
<tr><td></td>
<td><label id='stoName'></label></td>
</tr>
<tr>
<td>Nos </td>
<td>
<input type=text name='tnos' class='textbox' onChange='checkNumeric(this)' required>
</td>
</tr>
<tr>
<td style='color:red' colspan=2 align=center>
<input type='button' class='acbutton' value='Transfer' onclick='transferSkey()'>
</td>

</tr>


</table>

</form>

<jsp:include page="footer.jsp"/>
</div>

</body>

</html>