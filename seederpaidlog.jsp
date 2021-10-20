<html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>
<link href="css/konnect.css" rel="stylesheet"/>

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
Box-shadow: 0px 8px 16px 0px gray;
	text-indent:15px;
}

.login{
font-family: Times New Roman;
font-size: 22px;
color: #153E7E;
font-weight:1200;
background-color:whitesmoke;
text-indent: 15px;
border-top : 4px groove darkblue;
border-bottom : 4px groove darkblue;
border-left : 4px groove darkblue;
border-right : 4px groove darkblue;
border-radius:10px;
Box-shadow: 0px 8px 16px 0px darkblue;
background-image: linear-gradient(to right,lightgrey, whitesmoke);
opacity:0.9;
align:center;
}

.thead1{
background-image: linear-gradient(to bottom, black, gray); 
color:white;
font-size:25px; 
font-weight:900;
}
.regform{
  	font-size:14px;
	margin:auto;
	padding:0px;
 	border:1px solid magenta;

	color: #153E7E;
	
	background: url(./images/bg3.png) top repeat-y;	
	//background-image: linear-gradient(to bottom, purple, magenta);

	Box-shadow: 0px 8px 16px 0px darkblue;
	width:600px;
	
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

select{
font-size:18px;
}
#title1{
text-indent:21px;
}

a{
color:white;
}

</style>
<script>

</script>



<title>Konnect2Grow - Let's connect </title>
</head>

<body>
<c:if test="${empty ADMIN}">
<c:redirect url="/admin?action=login"/>
</c:if>


<div class="maindv"><br>
<jsp:include page="adminHeader.jsp"/>

<br>
<form action="seeder?action=update" onSubmit='return checkValue(this)' method='post'>
<c:if test="${empty SEEDPAID}">
<label style='color:white'>Nothing to display in log</label>
</c:if>

<c:forEach var='SPD' items="${requestScope.SEEDPAID}"> 

<table border=0 align=center cellpadding=4 cellspacing=4 class='login2' width=550 height=280>
<tr class=th1><th colspan=2 align=left>Seeder Paid Log for the SeedKey</th>
</tr>
<tr>
<td style="color:orange;">Seeder Id : ${SPD.seederid}</td>
<td style="color:orange;">Seeder Id : ${SPD.amount}</td>
</tr>

<tr>
<td colspan=2>Bind/Reciever Seeder : ${SPD.bindseeder}</td>
</tr>
<tr>
<td>Payment Via : ${SPD.paymentvia}</td><td align=right>Transaction ID ${SPD.transid}</td>

</tr>
<tr>
<td>Status : ${SPD.status}</td>
<td align=right style='color:orange'>Date/Time : ${SPD.paiddate}</td>
</tr>

<tr>
<td></td>
<td align=right style='color:orange'><input type='button' class='button' value='&laquo;Back' onClick='javascript:window.history.back()'/></td>
</tr>


</table>
<br>


</c:forEach>
<br>


</form>


</div>


</body>
</html>

