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
width:300px;
}


a:hover{
  background-color: #ddd;
  color: black;
}
.textbox {
    Width: 450px;
    Padding: 10px 4px;
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

function approve(){

let paymentvia=document.seedform.paymentvia.value;
var amount=document.seedform.amount.value;
var transid=document.seedform.transid.value;

	//alert(paymentvia);

	if(paymentvia=="Select"){
		document.getElementById("errmsg").style.visibility="visible";
		return;
	}
	if(amount.length==0){
		document.getElementById("errmsg").style.visibility="visible";
		return;
	}
	if(transid.length==0){
		document.getElementById("errmsg").style.visibility="visible";
		return;
	}
	
	
	else{
		document.getElementById("errmsg").style.visibility="hidden";
	
	document.seedform.action="skey?action=TRANSUPDATE";
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

<div class='maindv'>

<jsp:include page="headermenu.jsp"/>
<form name="seedform" action="skey?action=APPROVEHELP" method='post'>
<br>
<table border=0 align=center cellpadding=4 cellspacing=4 class='login1' width=580 height=400>
<tr class='bghead'><td>Transaction Update</td></tr>


<tr class='bg2'><b>
<td>${BINDNAME}<b></td></tr>


<tr class='bg1'>
<td><select name='paymentvia'>
<option value='Select'>Mode of Payment</option>

<option value='Phonepe'>Phonepe</option>
<option value='GooglePay'>GooglePay</option>
<option value='PayTM'>PayTM</option>
<option value='PayTM'>Other</option>

</select>
</td>
</tr>
<tr class='bg1'><td><input type='text' class='textbox' name='amount' placeholder='Amount Seeded' required>
</td>
</tr>
<tr class='bg1'><td><input type='text' class='textbox' name='transid' placeholder="Transaction Id" required></td>
</tr>



<input type='hidden' name='seederskey' value='${SEEDERSKEY}'>
<input type='hidden' name='bindskey' value='${BINDSKEY}'>
<input type='hidden' name='bindseeder' value='${BINDSEEDER}'>
<tr class='bg2'>
<td style='color:red'>
<c:if test="${not empty MSG}">
Status: ${MSG}
</c:if>
<label style="visibility:hidden" id='errmsg'>Enter Value in textboxes.<label/>

</td></tr>
<tr>
<td align='center'><input type='button' value='Submit' class='sdbutton' onclick="approve()"></td>
</tr>

</table>
<br>


</form>



</div>
</body>

</html>