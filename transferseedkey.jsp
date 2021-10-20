<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

<style>

.textbox {
    Width: 520px;
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

select{
font-family: Times New Roman;
font-size: 28px;
width:300px;
    border-radius:10px;

    Padding: 15px 6px;
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
	var tnos=document.getElementById('tnos').value;

	var sto=document.getElementById('sto').value;
	var sname=document.getElementById('stoName').innerHTML;
	//alert(sname);
	if(tnos.length==0 || sto.length==0){
		//alert("Seeder Id Missing..");
		
		document.getElementById("errmsg").style.visibility="visible";
	
	return false;
	}
	else if(sname=="null"){
	document.getElementById("errmsg").style.visibility="visible";
		
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
	//document.getElementById("sname").innerHTML=xmlhttp.responseText;
	  
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

<c:if test="${empty SEEDER}">
<c:redirect url="/seeder?action=null"/>
</c:if>


<div class="maindv">
<jsp:include page="headermenu.jsp"/>


<form name='tform' action="skey?action=TRANSKEY" method='post'>
<br>
<table border=0 align=center cellpadding=6 cellspacing=6 class='login2' width=570 height=400>
<tr><th colspan=3 align=left class=bghead>Transfer Key</th>
</tr>
<tr>
<td colspan=2 style='color:red'>
<c:if test="${not empty MSG}">
Transfer Status: ${MSG}
</c:if>
</td>
</tr>
<tr>
<td colspan=2 style='color:orange'>
<label style="visibility:hidden" id='errmsg'>Error: Something wrong or missing textvalue.<label/>


<input type='hidden' id='sfrom' name='sfrom' value='${SEEDER.seederid}'>
<input type='hidden' id='flag' name='flag' value='TRANS'>

</td>
</tr>

<tr>
<td colspan=2>SKey Type : </td><td></td></tr><tr><td>
<select name='tstype' onchange='getSKeyCount(this)'>
<option value='Select'>Select</option>
<c:forEach var='stypes' items="${requestScope.STYPES}"> 
<option value='${stypes}'>${stypes}</option>
</c:forEach>
</select>
&nbsp;&nbsp;&nbsp;
Available &raquo;
<label id='scount'></label>
</td>

</tr>


<tr>
<td>To (Seeder Id)*  &nbsp;&nbsp;&nbsp;&raquo;
<label id='stoName'></label>
<input type='hidden' value='' id='sname' />
</td><td></td>
</tr>
<tr>
<td colspan=2>
<input type=text id='sto' name='sto' class=textbox onchange='getName(this)' style='text-transform:uppercase;' required>
</td></tr><tr>
<td></td>
</tr>
<tr>
<td colspan=2>Nos </td><td></td></tr><tr>
<td>
<input type=text name='tnos' id='tnos' class=textbox onChange='checkNumeric(this)' required>
</td></tr>
<tr>
<td align=center>
<input type='button' class='sdbutton' value='Transfer' onclick='transferSkey()'>
</td>
<td></td>
</tr>


</table>

</form>


</div>

</body>

</html>