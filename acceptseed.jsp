<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>

<head>
<link href="css/konnect.css" rel="stylesheet" type="text/css" />

<style>
select{
font-family: Times New Roman;
font-size: 26px;
color: #153E7E;
width:300px;
}


a:hover{
  background-color: #ddd;
  color: black;
}


</style>

<script>

function approve(){

var status=document.seedform.status.value;
	//alert(status);
//skey status set to seedpaid and bskey status set to paidpartial
	document.seedform.action="skey?action=APPROVEHELP";
	document.seedform.method="post";
	//document.getElementById('approveb').disabled=true;	
	document.seedform.submit();

}
function getTimer2(){
	
// Set the date we're counting down to
var countDownDate = new Date("${CAL}").getTime();

//alert("${bcount.bindskey}");
// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  //var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result in the element with id="demo"
  document.getElementById("timer1").innerHTML = hours + "h "  + minutes + "m " + seconds + "s ";

  // If the count down is finished, write some text
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("timer1").innerHTML = "EXPIRED";
  }
}, 1000);
}



</script>

<title>Konnect2Grow - Let's connect </title>
</head>

<body onload='getTimer2()'>

<c:if test="${empty SEEDER}">
<c:redirect url="/seeder?action=home"/>
</c:if>


<div class="maindv">
<jsp:include page="headermenu.jsp"/>

<form name="seedform" action="skey?action=APPROVEHELP" method='post'>
<br>
<table border=0 align=center cellpadding=4 cellspacing=4 class='login1' width=580 height=400>
<tr class='bghead2'><th>Approve Recieved Help</th></tr>
<tr class=bg1><td><p id='timer1'></p></td>
</tr>

<tr>
<td class='bg2'><b>
${NAME} &nbsp;&nbsp;(${SID})</b>
</td></tr>
<tr><td  class='acbutton' align='center'><b>Recieved Seed <i class='fa fa-rupee-sign' style='font-size:20px;'></i>
(${STYPE})</b>
</td>
</tr>


<tr class='bg1'>
<td><select name='status'>
<option value='Recieved'>Recieved</option>
<option value='NotRecieved'>Not Recieved</option>
</select>
</td>
</tr>

<tr class='bg2'><td style='color:red;'>${MSG}</td></tr>
<tr><input type='hidden' name='seederskey' value='${SEEDERSKEY}'>
<input type='hidden' name='bindskey' value='${BINDSKEY}'>
<input type='hidden' name='bindstype' value='${BSTYPE}'>
<input type='hidden' name='sstype' value='${STYPE}'>
<input type='hidden' name='srno' value='${SRNO}'>
<input type='hidden' name='sid' value='${SID}'>


<td align='center'><input type='button' id='approveb' value='Approved' class='acbutton' onclick="approve()"></td>
</tr>

</table>
<br>


</form>


</div>
</div>
</body>

</html>