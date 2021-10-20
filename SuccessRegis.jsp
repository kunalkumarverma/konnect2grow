<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<meta name='viewport' content='Width=device-width, initial-scale=0.6'>

<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />


<title>Konnect2Grow - Let's connect </title>
</head>

<body>

<div class='maindv' width=600px;>
<jsp:include page="headermenu2.jsp"/>
<br>
<table border=0 align=center cellpadding=4 cellspacing=4 class='login2' width=550 height=400>
<tr><th colspan=2 align=center>
Congratulation!! Dear ${FNAME} , your profile successfully added. Enjoy your journey in Konnect2Grow</th>
</tr>
<tr>
<td colspan=2 style='color:red'>
${MSG}
</td>
</tr>


<tr>
<td>Login Id  : </td>
<td>${SID}</td>
</tr>
<tr>
<td>Password  : </td>
<td>${PWD}</td>
</tr>
<tr><td colspan=2 style="color:red">Kindly take screenshot of the credential for login</td></tr>

<tr><td colspan=2 style="color:green"><a href='seeder?action=home'>Login to Continue</td></tr>
</table>
</br>
</div>
</body>

</html>