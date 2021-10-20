<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

<style>
.login{
font-family: Times New Roman;
font-size: 18px;
color: #153E7E;
font-weight:900;
background-color:whitesmoke;
text-indent: 20px;
border-top : 4px groove darkblue;
border-bottom : 4px groove darkblue;
border-left : 4px groove darkblue;
border-right : 4px groove darkblue;
border-radius:10px;
Box-shadow: 0px 8px 16px 0px darkblue;
background-image: linear-gradient(to right,lightgrey, whitesmoke);
opacity:0.8;
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

Padding: 12px 5px;
   Box-shadow: 0px 8px 16px 0px gray;
    
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
#title1{
text-indent:20px;
}

</style>


<title>Konnect2Grow - Admin </title>
</head>

<body>

<div class='maindv' width=600px;>
<jsp:include page="adminHeader.jsp"/>


<form action="admin?action=login" method='post'>
<hr>

<br><br>
<table border=0 align=center cellpadding=4 cellspacing=4 class='login' width=580 height=400>
<tr class='bg1'><th colspan=2 align=center>Admin Login</th>
</tr>
<tr>
<td colspan=2 style='color:red'>
${MSG}
</td>
</tr>


<tr>
<td>*Login Id  : </td></tr><tr>
<td><input type='text' class='textbox' name='userid' required>
</tr>
<tr>
<td>*Password  : </td></tr><tr>
<td><input type='password' class='textbox' name='pwd' required>
</tr>



<tr>
<td align=center>
<input type='submit' class='button' value='Submit'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type='reset' class='button' value='Reset'>
</td></tr>

</table>

</form>

</br></br>
<jsp:include page="footer.jsp"/>
</div>
</div>

</body>
</html>

