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
width:100px;
}
#copykeys{
Font: 20px/25px “Lato”, Arial, sans-serif;
    Color: #333;
    Box-sizing: border-box;
    Letter-spacing: 1px;
    
    Border: 1px solid #ccc;
    Transition: 0.4s;
    border-radius:10px;
Box-shadow: 0px 8px 16px 0px gray;
width:520px;
}
</style>

<script>


function whatsapp(){

document.seedskeyform.action="https:/api.whatsapp.com/send?text=http://127.0.0.1:8080/konnect2grow/seeder?action=signup&ref=${SEEDER.seederid}"; 

document.seedskeyform.submit();

}



function copyUrl(){
	
var copyText=document.getElementById("copykeys");
	copyText.select();
	copyText.setSelectionRange(0,99999);
	
	navigator.clipboard.writeText(copyText.value);
	//alert("copied the text"+copyText.value);	
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
<br>
<table border=0 align=center cellpadding=4 cellspacing=4 class='login2' width=550 height=200>
<tr class=th1><th colspan=2 align=left>Share & Grow</th>
</tr>
<tr>
<td colspan=2 style='color:red'>

<input type='hidden' id='seederid' name='seederid' value='${SEEDER.seederid}'>

</td>
</tr>

<tr><td colspan=2>
<input type='text' value="http://127.0.0.1:8080/konnect2grow/seeder?action=signup&ref=${SEEDER.seederid}" id='copykeys'/>
</td></tr>
<tr>
<td align=left>
<input type='button' class='acbutton' style='width:120px;' value='&#9990;Whatsapp &raquo;' onclick='whatsapp()'>
</td>
<td align=right>

<input type='button' class='acbutton' style='width:120px;' value='&#128203;Copy &laquo;' onclick='copyUrl()'>

</td>
</tr>


</table>

</form>

<br><br>


</div>

</body>

</html>