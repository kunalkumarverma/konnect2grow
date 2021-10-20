 <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<meta name='viewport' content='Width=device-width, initial-scale=0.6'/>




<html>
<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

    
<style>
.login2 th{
background-image: linear-gradient(to top,teal, black);

}
.tabledesc{
background-image: linear-gradient(to left,teal, black);
color:white;
margin:5px;
font-size:18px;

}

.login{
font-family: Times New Roman;
font-size: 20px;
color: #153E7E;
background-color:whitesmoke;
text-indent: 20px;
border-top : 4px groove grey;
border-bottom : 4px groove grey;
border-left : 4px groove grey;
border-right : 4px groove grey;
	
}
.button{
font-family: Times New Roman;
font-size: 20px;
color: white;
border-radius:10px;
text-indent:2px;
width:50px;
font-weight:800;
background-image: linear-gradient(to bottom, black, gray); 

Padding: 8px 3px;
   Box-shadow: 0px 8px 16px 0px gray;
    
}

.textbox {
    Width: 180px;
    Padding: 15px 5px;
    Font: 20px/20px "Lato", Arial, sans-serif;
    Color: #333;
    Box-sizing: border-box;
    Letter-spacing: 1px;
    Border:0;
    Transition: 0.4s;
    border-radius:10px;
 Box-shadow: 0px 8px 16px 0px gray;
  
}

.label1{
font-family: Times New Roman;
font-size: 26px;
}
a:hover{
color: red;

}
.Active{
color:teal;

}
.SEEDPAID{
color:white;
background-color: gray;
}
.BINDED{
color:white;
background-color: #04AA6D;
}
.PAID{
color:white;
background-color: #04AA6D;
}
.BINDPARTIAL{
color:white;
background-color: teal;
}
.UNPAID{
color:white;
background-color: teal;
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

<div class='maindv' align='center' width='600px'>
<jsp:include page="adminHeader.jsp"/>

<table border='0px' cellpadding='4px' cellspacing='4px' class='login' width='590px' height='auto'>
<tr class='bg1'><th colspan='3'>Seeder Logs</th>
</tr>
<tr>
<td colspan='3' style='color:red'>
</td>
</tr>

<tr>
<td><label class='label1'>Seeder Id : </label></td>
<td><label class='label1'>
${SEEDERID}</label>
</td>
<td>
</td>

</tr>

<tr>
<td colspan='3'>


</td>

</tr>

</table>

<br>
<div class=scrolldiv align=left>
<label class='tabledesc'><b>SEEDKEY LOG &nbsp;&nbsp;&nbsp;&nbsp;<b></label>
<table border=1 align=center cellpadding=2 cellspacing=2 class='login2' width=1240 height=auto><tr>
<th>STYPE</th><th>GENERATION</th><th>LIFECYCLE</th><th>SEED DATE</th>
<th>ASSIGN DATE</th><th>PAID DATE</th><th>REMAIN</th></tr>
<c:if test="${empty SEEDKEYS}">
<tr><td colspan=4>Nothing to display</td></tr>
</c:if>

<c:forEach var='seedkey' items="${requestScope.SEEDKEYS}"> 
<tr class='${seedkey.lifecycle}'>
<td>${seedkey.skeytype}</td><td>${seedkey.generation}</td>
<td>${seedkey.lifecycle}</td><td>${seedkey.seeddate}</td><td>${seedkey.assigndate}</td>
<td>${seedkey.paiddate}</td><td>${seedkey.remainhelp}</td><td>${seedkey.dog}</td>
</tr></c:forEach>
</table>
</div>

<br><br>
<div class=scrolldiv align=left>
<label class='tabledesc'><b>GROWTH LOG &nbsp;&nbsp;&nbsp;&nbsp;<b></label>
<table border=1 align=center cellpadding=2 cellspacing=2 class='login2' width=1040 height=auto><tr>
<th>SEEDER ID</th><th>STYPE</th><th>BIND GROWER</th><th>BIND STYPE</th><th>STATUS</th>
<th>BINDDATE</th><th>REMAIN</th></tr>
<c:if test="${empty BINDHELPS}">
<tr><td colspan=4>Nothing to display</td></tr>
</c:if>

<c:forEach var='bhelp' items="${requestScope.BINDHELPS}"> 
<tr class='${bhelp.status}'>
<c:if test="${SEEDERID eq bhelp.seederid}">
<td style="color:blue; font-weight:800;">
</c:if>
<c:if test="${SEEDERID ne bhelp.seederid}">
<td>
</c:if>
${bhelp.seederid}</td>
<td>${bhelp.seederstype}</td>

<c:if test="${SEEDERID eq bhelp.bindseeder}">
<td style="color:blue; font-weight:800;">
</c:if>
<c:if test="${SEEDERID ne bhelp.bindseeder}">
<td>
</c:if>

${bhelp.bindseeder}</td>
<td>${bhelp.bindstype}</td>
<td>${bhelp.status}</td><td>${bhelp.binddate}</td>
<td>${bhelp.remainhelp}</td>
</tr></c:forEach>
</table>
</div>
<br><br>

<br>
<div class=scrolldiv align=left>
<label class='tabledesc'><b>SEEDPAID LOG (OPTIONAL LOG) &nbsp;&nbsp;&nbsp;&nbsp;<b></label>
<table border=1 align=center cellpadding=2 cellspacing=2 class='login2' width=940 height=auto><tr>
<th>GROWER</th><th>SEED AMOUNT</th><th>via</th><th>TRANS ID</th>
<th>PAID DATE</th><th>STATUS</th></tr>
<c:if test="${empty SEEDPAIDS}">
<tr><td colspan=4>Nothing to display</td></tr>
</c:if>

<c:forEach var='seedpaid' items="${requestScope.SEEDPAIDS}"> 
<tr class='${seedpaid.status}'>
<td>${seedpaid.bindseeder}</td>
<td>${seedpaid.amount}</td><td>${seedpaid.paymentvia}</td><td>${seedpaid.transid}</td>
<td>${seedpaid.paiddate}</td><td>${seedpaid.status}</td>
</tr></c:forEach>
</table>
</div>
<BR><BR>


<jsp:include page="footer.jsp"/>
</div>

</body>

</html>
