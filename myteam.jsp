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

select{
font-family: Times New Roman;
font-size: 22px;
width:100px;
}
tr:nth-child(odd){
background-color: #dec8ab;
color: teal;
opacity:0.9;
}
.scrolldiv{
height:500px;
width:540px;
margin:auto;

}

</style>

<script>




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
<div class='scrolldiv'>
<table border=0 align=center cellpadding=4 cellspacing=4 class='login2' width='1200px' height='auto'>
<tr class='th1' align=left><th colspan=10>
MY DIRECT TEAM
</th></tr>
<tr><th>Sr No</th><th>Joining Date</th><th>Seeder Id</th><th>Name</th><th>Gender</th><th>Mobile</th><th>Whatsapp</th><th>District</th><th>Level</th><th>Status</th></tr>
<c:if test="${empty MYTEAM}"><tr rowspan=5>
<td colspan=10 align=left style='color:red;'><b>No Record found !</b></td></tr>
</c:if>

<c:forEach var='refseeders' items="${requestScope.MYTEAM}"> 
<tr>
<td>${refseeders.bonus}</td>
<td>${refseeders.doj}</td>
<td>${refseeders.seederid}</td>
<td>${refseeders.name}</td>
<td>${refseeders.gender}</td>
<td>${refseeders.mobile}</td>
<td>${refseeders.whatsapp}</td>
<td>${refseeders.district}</td>
<td>${refseeders.level}</td>
<td>${refseeders.status}</td>
</tr>
</c:forEach>

</table>
</div>

</body>

</html>