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
    Width: 280px;
    Padding: 8px 4px;
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
Width: 200px;
    Padding: 8px 4px;
    Font: 20px/25px “Lato”, Arial, sans-serif;
    Color: #333;
    
font-family: Times New Roman;
font-size: 26px;
 border-radius:10px;

}
</style>
<script>
function statusCheck(status){
	
	var status=status.value;
	//alert(status);
	if(status=="Paid"){
		document.getElementById('trxid').disabled=false;
		
	}
	else{
		document.getElementById('trxid').disabled=true;

	}
	//document.stypeform.action="skey?action=STYPEUPDATE&stype="+stype;
	//document.stypeform.method="post";
	//document.stypeform.submit();
		
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


<form name='wform' action="admin?action=UPDATEWD" onSubmit='return updateWD(this)' method='post'>

<div align=center>
<table border=0 align=center cellpadding=4 cellspacing=4 class='login' style='width:590px;' height=400>
<tr><th class='bg2' colspan=2 align=center>Withdarwal Review</th>
</tr>
<tr>
<td colspan=2 style='color:red'>
${MSG}
</td>
</tr>


<tr>
<td>Seeder Id :</td>
<td>${WITHDRAW.seederid}</td></tr>
<tr>
<td>Name : </td>
<td>${WITHDRAW.name}</td></tr>
<tr>
<td>District : </td>
<td>${WITHDRAW.district}</td></tr>
<tr>
<td>Request Date</td>
<td>${WITHDRAW.reqdate}</td></tr>

<tr>
<td>Withdrawal Amount  : </td>
<td>${WITHDRAW.withdrawl}</td></tr>
<tr>
<tr>
<td>Wallet Balance</td>
<td>${WITHDRAW.bonusremain}</td></tr>
<tr>
<td>Status</td>
<td>${WITHDRAW.status}</td></tr>
<tr>
<td>Paid Date</td>
<td>${WITHDRAW.paiddate}</td></tr>
<tr>
<td>Transactin Id</td>
<td>${WITHDRAW.transactionid}</td></tr>



<tr>
<td>*Status  : </td>
<td>
<select name='status' onchange='statusCheck(this)'>
<option value='${WITHDRAW.status}'>${WITHDRAW.status}</option>

<option value='Approve'>Approve</option>
<option value='Reject'>Reject</option>
<option value='Paid'>Paid</option>

</select>
</td>
</tr>
<tr><td>Transaction Id</td><td><input type=text class='textbox' id='trxid' name='trxid' style='width:200px;' disabled/></td>
</tr>
<tr><td colspan=2><hr><input type='hidden' name='srno' value='${WITHDRAW.srno}'/></td></tr>
<tr>
<td></td><td><input type='submit' class="acbutton" style="width:140px;" value='Update'></td>
</tr>

<tr align=center>
<td colspan=4 align=center>
<hr>
</td>
</tr>

</table>






</form>



</div>
</div>
</body>

</html>