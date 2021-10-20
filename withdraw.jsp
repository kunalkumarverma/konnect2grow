<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>

<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

<style>
select{
font-family: Times New Roman;
font-size: 26px;
color: #153E7E;
width:400px;
border-radius:10px;
Padding: 12px 5px;
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

Padding: 15px 5px;
   Box-shadow: 0px 8px 16px 0px gray;
    
}


a:hover{
  background-color: #ddd;
  color: black;
}


</style>

<script>

function getKeyVal(nos){
var xmlhttp;
var nos=nos.value;	
var skeytype=document.getElementById("tstype").value;
//alert(skeytype+""+nos);
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
	var cost=xmlhttp.responseText;
	cost=cost*nos;	
    document.getElementById("totalcl").innerHTML=cost;
	  
    }
  }
try{
xmlhttp.open("GET","seeder?action=KEYVAL&tstype="+skeytype,true);
}
catch(e){
alert("Unable to connect server, please try later");

}

xmlhttp.send();
}






function purchase(){
var tstype=document.seedform.tstype.value;
var nos=document.seedform.nos.value;

if(tstype==="Select")
return false;
else if(nos==0){
return false;
}
else{	
	document.seedform.action="seeder?action=PSKEY";
	document.seedform.method="post";
	document.seedform.submit();
}


}



function calculate(){
var tstype=document.seedform.tstype.value;
var nos=document.seedform.nos.value;	
//document.getElementById("errmsg").style.visibility="visible";
	
}

function approve(){


var withdrawl=document.seedform.withdrawl.value;
	
var balance=document.seedform.bonus.value;	
var wallet=balance-500;
wallet=wallet-withdrawl;
//alert(wallet);
if(withdrawl==0){
alert("Select amount");
return false;
}
if(wallet<0){
alert("Transaction Declined. Wallet must have 500 balance.");
return false;
}
else{
	
	document.seedform.action="seeder?action=WITHDRAW";
	document.seedform.method="post";
	document.seedform.submit();
}
}

</script>

<title>Konnect2Grow - Let's connect </title>
</head>

<body>

<c:if test="${empty SEEDER}">
<c:redirect url="/seeder?action=home"/>
</c:if>


<div class="maindv">
<jsp:include page="headermenu.jsp"/>

<br><br>
<table class='tableds' border=1 width=560 align=center cellpadding=8 cellspacing=1>
<tr class='th1'><th colspan=2>
WALLET SUMMARY
</th></tr>
<tr><td>
Growth</td>
<td align=right> ${sessionScope.TPAMT} </td></tr>
<tr style='border-top:3px solid blue;'>
<td>
Cashback</td><td align=right> 

${requestScope.BONUS1}

</td>
</tr>
<tr align=right style='border-top:3px solid magenta; color:black;'>
<td>
Total Growth</td><td> 

${requestScope.BONUS1+sessionScope.TPAMT}

</td>
</tr>

<tr style='border-top:3px solid blue;'>
<td>
Direct Withdraw</td><td align=right> 

${sessionScope.TPAMT}

</td>
</tr>
<tr align=right style='border-top:3px solid red; color:black;'>
<td>
Wallet Balance</td><td> 

${requestScope.BONUS1}

</td>
</tr>
</table>



<form name="seedform" action="seeder?action=WITHDRAW" method='post'>
<br>


<table border=0 align=center cellpadding=4 cellspacing=4 class='tableds' width=560 height=200>
<tr class='bghead'><th>Instant SeedKey</th></tr>
<tr class=bg2><td></td>
</tr>

<tr>
<td class='bg1'>
Seedkey Type
</td></tr>
<tr class='bg2'><td>
<select name='tstype' id='tstype'>
<option value='Select'>Select</option>
<c:forEach var='stypes' items="${sessionScope.STYPES}"> 
<option value='${stypes}'>${stypes}</option>
</c:forEach>
</select>
</td></tr>

<tr class='bg1'>
<td><select name='nos' id='nos' onChange="getKeyVal(this);">
<option value='0'>Select</option>
<option value='1'>1</option>
<option value='2'>2</option>
<option value='3'>3</option>
<option value='4'>4</option>
<option value='5'>5</option>
<option value='6'>6</option>
<option value='7'>7</option>
<option value='8'>8</option>
<option value='9'>9</option>
<option value='10'>10</option>


</select>
</td>
</tr>
<tr class='bg1'><td><label>Total Cost&nbsp; &raquo;&nbsp; </label><Label id='totalcl'></label></td></tr>
<tr class='bg2'><td style='color:red;'>${MSG2}</td></tr>


<td align='center'><input type='button' id='sdbutton' value='Submit' class='button' onclick="purchase()"></td>
</tr>

</table>
<br>


<table border=0 align=center cellpadding=4 cellspacing=4 class='login1' width=560 height=200>
<tr class='bghead2'><th>Withdraw Request</th></tr>
<tr class=bg2><td></td>
</tr>

<tr>
<td class='bg1'>
Withdraw Amount
</td></tr>


<tr class='bg1'>
<td><select name='withdrawl'>
<option value='0'>Select</option>

<option value='500'>500</option>
<option value='1000'>1000</option>

</select>
</td>
</tr>

<tr class='bg2'><td style='color:red;'>${MSG}</td></tr>
<input type='hidden' name='bonus' value='${BONUS}'>
<input type='hidden' name='growth' value='${TPAMT}'>


<td align='center'><input type='button' id='approveb' value='Submit' class='acbutton' onclick="approve()"></td>
</tr>

</table>
<br>


</form>

<br>
<div class='scrolldiv'>
<table border=0 align=center cellpadding=8 cellspacing=2 class='login2' width='1200px' height='auto'>
<tr class='th1' align=left><th colspan=10>
Recent Transactions
</th></tr>
<tr><th>Transaction Id</th><th>Trans Date</th><th>Withdrawl</th><th>Bonus Left</th><th>Status</th><th>Close Date</th><th>Close Trans Id</th></tr>
<c:if test="${empty WDS}"><tr rowspan=5>

<td colspan=6 align=left style='color:red;'><b>No Record found !</b></td></tr>
</c:if>

<c:forEach var='wd' items="${requestScope.WDS}"> 
<tr class='bg1'>
<td>${wd.srno}</td>
<td>${wd.reqdate}</td>
<td>${wd.withdrawl}</td>
<td>${wd.bonusremain}</td>
<td>${wd.status}</td>
<td>${wd.paiddate}</td>
<td>${wd.transactionid}</td>
a</tr>
</c:forEach>

</table>
</div>



</div>
</body>

</html>