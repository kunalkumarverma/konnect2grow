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
Error while displaying content.
</th>
</tr>
<tr>
<td colspan=2 style='color:red'>
Possible Reasons:
</td>
</tr>

<tr><td colspan=2 style="color:green"><a href='seeder?action=home'>Session Expired</td></tr>
<tr><td colspan=2 style="color:green"><a href='seeder?action=home'>Incorrect Input passed</td></tr>


<tr><td colspan=2 style="color:red">Kindly Retry after sometimes</td></tr>

</table>
</br>
</div>
</body>

</html>