<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

<style>
body{
	font-size:18px;	
	font-family:arial;
	background-color:lightgrey;
	
}


.login{
font-family: Times New Roman;
font-size: 18px;
color: #153E7E;
font-weight:900;
background-color:whitesmoke;
text-indent: 35px;
border-top : 4px groove darkblue;
border-bottom : 4px groove darkblue;
border-left : 4px groove darkblue;
border-right : 4px groove darkblue;
border-radius:10px;
Box-shadow: 0px 8px 16px 0px darkblue;
background-image: linear-gradient(to right,lightgrey, whitesmoke);
opacity:0.9;
}
.button{
font-family: Times New Roman;
font-size: 18px;
color: #153E7E;
border-radius:10px;
text-indent:2px;
width:150px;
font-weight:800;
Padding: 15px 6px;
    
}
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
.maindv{
color: #153E7E;
border:1px solid grey;

background: url(./images/bg3.png) top repeat-y;	
Box-shadow: 0px 8px 16px 0px darkblue;
width:600px;
margin:auto;
height:800px;

}
#title1{
text-indent:20px;
}
</style>
<script>
function checkValue(form){

var pwd=form.pwd.value;
var npwd=form.npwd.value;
var pwd2=form.pwd2.value;
if(npwd===pwd2){
return;
}
else{
alert("New Password doesnot match with retype password");
return false;
}


}
</script>

<title>Konnect2Grow - Let's connect </title>
</head>

<body>
<c:if test="${empty SEEDER}">
<c:redirect url="/seeder?action=home"/>
</c:if>

<div class="maindv" width=600px;>
<jsp:include page="headermenu.jsp"/>

<form action="seeder?action=ChangePass" onSubmit='return checkValue(this)' method='post'>

<br><br>
<table background="images/tableb.png" border=0 align=center cellpadding=4 cellspacing=4 class='login' width=540 height=300>
<tr><th align=center class=bghead2>Change Password</th>
</tr>
<tr>
<td style='color:red'>
${MSG}
</td>
</tr>


<tr>
<td>&#128272;&nbsp;OLD PASSWORD*   </td></tr><tr>
<td><input type='password' class='textbox' placeholder="Old Password" name='pwd' required>
</tr>
<tr>
<td>&#128275;&nbsp;NEW PASSWORD* </td></tr><tr>
<td><input type='password' class='textbox' placeholder="New Password" name='npwd' required>
</tr>
<tr>
<td>&#128275;&nbsp;RETYPE PASSWORD* </td></tr><tr>
<td><input type='password' class='textbox' placeholder="Retype Password" name='pwd2' required>
</tr>
<tr><td><hr></td></tr>


<tr align=center>
<td>
<input type='submit' value='Submit' class='acbutton' style='width:200px'>&nbsp;
<input type='reset' value='Clear' class='acbutton' style='width:200px'>&nbsp;
</td></tr>
<tr><td></td></tr>
</table>

</form>


</div>

</body>
</html>

