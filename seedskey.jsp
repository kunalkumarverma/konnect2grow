<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

<style>
.thseed{
background-image: linear-gradient(to top,teal, black);

}

input{
font-family: Times New Roman;
font-size: 18px;
border:2px groove grey;
color: #153E7E;
}

select{
font-family: Times New Roman;
font-size: 22px;
width:400px;
border-radius: 10px;
    Padding: 15px 8px;
}
#copykeys{
width:10px;
border-radius:70px;
}
</style>

<script>


function getSkey(){
var xmlhttp;
var skeytype=document.getElementById("tstype").value;
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
    document.getElementById("copykeys").value=xmlhttp.responseText;
		//var copyText=document.getElementById("scount").value;
		//copyText.select();
	//copyText.setSelectionRange(0,99999);
	
	//navigator.clipboard.writeText(copyText.value);
	//alert("copied the text"+copyText.value);	
		copySkey();  
    }
  }
try{
xmlhttp.open("GET","skey?action=SKEYVALUE&sfrom="+sfrom+"&stype="+skeytype,true);
}
catch(e){
alert("Unable to connect server, please try later");

}

xmlhttp.send();
}




function copySkey(){
	//alert();
var copyText=document.getElementById("copykeys");
	copyText.select();
	copyText.setSelectionRange(0,99999);
	
	navigator.clipboard.writeText(copyText.value);
	//alert("copied the text"+copyText.value);	
}




function seedSKey(){

	//alert("Hi..");
	
	var sfrom=document.getElementById('seederid').value;
	var tstype=document.getElementById('tstype').value;
	//alert(tstype);
	if(tstype=="Select"){
		//alert("Select a SeedKey Type");
		
		document.getElementById("errmsg").style.visibility="visible";
	
	return false;
	}
	else{
		
	document.getElementById("errmsg").style.visibility="hidden";

		//alert(sfrom);
	document.seedskeyform.action="skey?action=SEEDSKEY&sfrom="+sfrom;
	document.seedskeyform.method="post";
	document.seedskeyform.submit();
	}	
}



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


</script>

<title>Konnect2Grow - Let's connect </title>
</head>

<body>

<c:if test="${empty SEEDER}">
<c:redirect url="/seeder?action=null"/>
</c:if>


<div class="maindv">
<jsp:include page="headermenu.jsp"/>


<form name='seedskeyform' action="skey?action=SEEDSKEY" onSubmit='return seedSkey(this)' method='post'>
<br>
<table border=0 align=center cellpadding=4 cellspacing=4 class='login2' width=550 height='auto'>
<tr class='th1'><th colspan=2>
KEYS AVAILBLILITY
</th></tr>
<tr><th>Key Type</th><th>Available</th></tr>
<c:forEach var='skeys' items="${requestScope.NEWSKEY}"> 
<tr class='bg1'><td>${skeys[0]}</td><td align=center>${skeys[1]}</td></tr>
</c:forEach>

</table>
<br>
<table border=0 align=center cellpadding=4 cellspacing=4 class='login2' width=550 height=200>
<tr class=th1><th colspan=3 align=left>Seed Key for Growth</th>
</tr>
<tr>
<td colspan=3 style='color:red'>
<c:if test="${not empty MSG}">
Status: ${MSG}
</c:if>
</td>
</tr>
<tr>
<td colspan=3 style='color:red'>
<label style="visibility:hidden" id='errmsg'>Select a seedkey type to seed<label/>


<input type='hidden' id='seederid' name='seederid' value='${SEEDER.seederid}'>
<input type='hidden' id='flag' name='flag' value='user'>

</td>
</tr>
<tr>
<td>SKey Type : </td><td colspan='2'>
<select name='tstype' id='tstype' onchange='getSKeyCount(this)'>
<option value='Select'>Select</option>
<c:forEach var='stypes' items="${requestScope.STYPES}"> 
<option value='${stypes}'>${stypes}</option>
</c:forEach>
</select>
</td>
</tr><tr>
<td style='color:orange' colspan='2'>Available &raquo;
<label id='scount'></label>
</td>

</tr>

<tr><td></td></tr>

<tr><td>
</td>
<td align=left>
<input type='button' class='sdbutton' style='width:180px;' value='&#128273;Seed &raquo;' onclick='seedSKey()'>
</td>
<td><input type='text' value="Copy using javascript" id='copykeys'/>

<input type='button' class='acbutton' style='width:120px;' value='&#128203;Copy &laquo;' onclick='getSkey()'>

</td>
</tr>


</table>

</form>

<div class=scrolldiv>
<label class='tabledesc'><b>SEEDED LOG &nbsp;&nbsp;&nbsp;&nbsp;<b></label>
<table border=1 align=center cellpadding=2 cellspacing=2 class='login2' width=840 height=auto>
<tr class='thseed'>
<th>SKey Type </th><th>Growth</th><th>Seed Date</th><th>Cool Time</th><th>Status</th>
<c:if test="${empty SKEYS}">
<tr><td colspan=4>Nothing to display</td></tr>
</c:if>

<c:forEach var='sks' items="${requestScope.SKEYS}"> 
<tr class='bg1'>
<td>${sks.skeytype}</td><td>${sks.dog}</td><td>${sks.seeddate}</td><td>${sks.remainhelp}</td><td>${sks.lifecycle}</td>
</tr></c:forEach>
</table>
</div>
<br><br>


</div>

</body>

</html>