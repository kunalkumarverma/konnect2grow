<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

<style>

.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
	height:26px;
	width:26px;
  
  left: 4px;
  
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}


</style>
<script>
function switchOn(cbox){

var val="off";
if(cbox.checked==true){
val="On";
}
else{
val="Off";
}

var xmlhttp;

if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	//alert(xmlhttp.responseText);	
    document.getElementById(switches).innerHTML=xmlhttp.responseText;
	  
    }
  }
try{
xmlhttp.open("GET","admin?action=Switch&cbox="+val);
}
catch(e){
alert("Unable to connect server, please try later");

}

xmlhttp.send();
}



</script>

<title>Konnect2Grow - Admin Tools </title>
</head>

<body>

<c:if test="${empty ADMIN}">
<c:redirect url="/admin?action=login"/>
</c:if>

<div class="maindv">

<jsp:include page="adminHeader.jsp"/>
<br>
<table class='tableds' width=590 align=center border=0 cellpadding=12>
<tr class='th1'><th colspan=4>
SEEDER SUMMARY (${ACTSEEDER+INACTSEEDER})
</th></tr>
<tr rowspan=3 class=bg1><td>Active Seeder</td><td>${ACTSEEDER}  </td>
<td align=center style='border-left:3px solid blue;'>
InActive Seeder <td>${INACTSEEDER}</td>
</td>
</tr>

</table>


<br>
<table class='tableds' width=590 align=center border=0 cellpadding=8>
<tr class='th1'><th colspan=2>
SEED KEY LIFECYCLE SUMMARY 
</th></tr>
<c:forEach var='lcycle' items="${requestScope.LIFECYCLE}"> 
<tr class=bg2><td align=left>${lcycle.lifecycle} </td>
<td>${lcycle.remainhelp}  </td>

</tr>
</c:forEach>
</table>
<br>
<div>

<!-- Rounded switch -->
<table class='tableds' width=590 height=400 align=center border=0 cellpadding=10 cellspacing=1>
<tr class='th1'><th colspan=2>
SEED/GROWTH SWITCH (ON FOR 09:00 to 16:00) 
</th></tr>


<tr class='bg1'><td align=left>Visible Seed/Grow Pane</td><td>
<label class="switch">
  <input type="checkbox" id='switches' ${CHECKSTATUS} onClick='switchOn(this);'>
  <span class="slider round"></span>
</label></td></tr>

<tr class='bg1'><td align=left><a href="seeder?action=BindLogs&STATUS=FULL">Binded for Seed Help</a></td><td>${FULL+PARTIAL}</td></tr>


<tr class='bg2'><td align=left><a href="seeder?action=BindLogs&STATUS=PAID">Total Paid</a></td><td>${PAID}</td></tr>
<tr class='bg1'><td align=left><a href="seeder?action=BindLogs&STATUS=FULL">Total Unpaid</a></td><td>${UNPAID}</td></tr>
<tr class='bg1'><td align=left><a href="seeder?action=BindLogs&STATUS=ALL">Total Binder/Grower</a></td><td>${UNPAID+FULL+PARTIAL+PAID}</td></tr>

</table>

</div>

</br></br>
<jsp:include page="footer.jsp"/>
</div>



</body>

</html>