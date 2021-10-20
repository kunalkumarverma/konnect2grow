<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>

<style>
body{
	font-size:25px;	
	font-family:arial;
	background-color:lightgrey;
	
}


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
opacity:0.9;
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
    Font: 22px/25px "Lato", Arial, sans-serif;
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


<title>Konnect2Grow - Let's connect </title>
</head>

<body>

<div class="maindv" width=600px;><br>

<div id='title1' align=left><img src='images/logo3.png'>
</div>
<hr>
<form action="seeder?action=login" method='post'>

<br><br>
<table border=0 align=center cellpadding=6 cellspacing=6 class='login' width=580 height=360>
<tr><th align=center style='font-size:25px;'>Sign In for Grow</th>
</tr>
<tr>
<td style='color:red'>
${MSG}
</td>
</tr>


<tr>
<td>&#128279; LOGIN ID*   </td></tr><tr>
<td><input type='text' class='textbox' placeholder="Enter Login Id KG...." name='seederid' style='text-transform:uppercase;' required>
</tr>
<tr><td></td></tr>
<tr>
<td>&#128273; PASSWORD* </td></tr><tr>
<td><input type='password' class='textbox' placeholder="Enter Password" name='pwd' required>
</tr>
<tr><td><hr></td></tr>


<tr align=center>
<td>
<input type='submit' value='Login' class='button'>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<input type='reset' value='Reset' class='button'>
</td></tr>
</table>


<br><br></form>


</div>

</body>
</html>

