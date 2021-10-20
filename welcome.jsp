<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>

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
font-size:20px;
Padding: 6px 4px;
border-top : 2px solid blue;
border-bottom : 2px solid blue;
border-left : 2px solid blue;
border-right : 2px solid blue;
   border-radius:10px; 
}
.UNPAID{
color:red;
}
.SEEDPAID{
color:white;
}
.upgrade{
font-family: Times New Roman;
font-size: 28px;
color: white;
border-radius:100px;
border-top : 4px solid teal;
border-bottom : 4px inset teal;
border-left : 4px solid teal;
border-right : 4px solid teal;
color:red;

width:70px;
font-weight:200;
background-image: linear-gradient(to left, #04AA6D, #28dee4);

Box-shadow: 0px 8px 16px 0px teal;
    
}
.upgrade:hover{
 
background-image: linear-gradient(to left, #04AA6D, #24ffff); 
Box-shadow: 0px 8px 16px 0px red;

}

</style>
<script>

function upgradeLevel(){
//alert("Upgrade");
document.seedform.action="skey?action=UPGRADE";
document.seedform.method="post";
	document.seedform.submit();

}

function seedHelp(skey,bskey,bseeder,sname){
var skey=document.getElementById(skey).value;
var bskey=document.getElementById(bskey).value;
var bseeder=document.getElementById(bseeder).value;
var name=document.getElementById(sname).value;


//alert(skey+"hi..");
document.seedform.action="skey?action=HELPSEEDED&seederskey="+skey+"&bindskey="+bskey+"&bindseeder="+bseeder+"&name="+name;
	document.seedform.method="post";
	document.seedform.submit();


}

function getHelp(skey,bskey, bstype, name,sstype,srno,seederid){
var skey=document.getElementById(skey).value;
var bskey=document.getElementById(bskey).value;
var bstype=document.getElementById(bstype).value;
var name=document.getElementById(name).value;
var sstype=document.getElementById(sstype).value;
var srno=document.getElementById(srno).value;
var seederid=document.getElementById(seederid).value;

//alert(skey+" "+bskey+" "+sstype);
//skey status set to seedpaid and bskey status set to paidpartial
	document.seedform.action="skey?action=GETHELP&seederskey="+skey+"&bindskey="+bskey+"&bstype="+bstype+"&name="+name+"&stype="+sstype+"&srno="+srno+"&sid="+seederid;
	document.seedform.method="post";
	document.seedform.submit();

}

function getTimer(){

// Set the date we're counting down to
<c:forEach var='scount' items="${sessionScope.SEEDHELPS}"> 
var countDownDate = new Date("${CAL}").getTime();

//alert("${scount.seederskey}");
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
  document.getElementById("${scount.seederskey}").innerHTML = hours + "h "
  + minutes + "m " + seconds + "s ";

  // If the count down is finished, write some text
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("${scount.seederskey}").innerHTML = "EXPIRED";
  }
}, 1000);
</c:forEach>
getTimer2();
}

function getTimer2(){

// Set the date we're counting down to
<c:forEach var='bcount' items="${sessionScope.GETHELPS}"> 
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
  document.getElementById("${bcount.seederskey}+1").innerHTML = hours + "h "
  + minutes + "m " + seconds + "s ";

  // If the count down is finished, write some text
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("${bcount.seederskey}+1").innerHTML = "EXPIRED";
  }
}, 1000);
</c:forEach>
}

</script>

<title>Konnect2Grow - Let's connect </title>
</head>

<body onload='getTimer()'>

<c:if test="${empty SEEDER}">
<c:redirect url="/seeder?action=home"/>
</c:if>

<div class="maindv">
<jsp:include page="headermenu.jsp"/>

<br><br>
<table class='tableds' width=570 align=center cellpadding=8>
<tr class='th1'><th colspan=3>
SEED SUMMARY
</th></tr>
<tr rowspan=3><td>Total</td><td> ${TSDCT} </td><td align=center style='border-left:3px solid magenta;'>
${TSDAMT}</td>
</tr>

</table>


<table class='tableds' width=570 align=center cellpadding=8>
<tr class='th1'><th colspan=3>
GROW SUMMARY
</th></tr>
<tr rowspan=3><td>Total</td><td> ${TPCT} </td><td align=center style='border-left:3px solid blue;'>
${TPAMT}</td>
</tr>
</table>

<table width=570px border=0 align=center cellpadding=8><tr><td>
<table class='tableds' width=280 align=center cellpadding=8>
<tr class='th1'><th colspan=3>
SKEY SUMMARY
</th></tr>
<tr rowspan=3><td>Total</td>
<td align=center> ${TSDCT+SCT} </td></tr>
<tr>
<td style='border-top:3px solid magenta;'>
Available</td><td align=center style='border-top:3px solid blue;'> 

${SCT}

</td>
</tr>
</table></td><td>

<table class='tableds' width=280 align=center cellpadding=8>
<tr class='th1'><th colspan=3>
INC SUMMARY
</th></tr>
<tr rowspan=3><td>Cashback</td><td align=center> ${BONUS} </td></tr>
<tr><td style='border-top:3px solid magenta;'>Total</td><td align=center style='border-top:3px solid blue;'>
${TPAMT+BONUS}</td>
</tr>

</table></td></tr></table>

<table class='tableds' width=570 cellpadding=8 align=center>
<tr class='th1'><th colspan=3>
LEVEL SUMMARY
</th></tr>
<tr rowspan=3><td><i class="fa fa-signal" style='font-size:18px;'></i>
My Level</td>
<td align=center> ${LEVEL} </td><td align=center>
<c:forEach begin="1" end="${sessionScope.LEVEL}"> 
<i class="fa fa-star" style='font-size:18px;color:yellow'></i>
</c:forEach>
</td></tr>
<tr>
<td style='border-top:3px solid magenta;'>
<i class="fa fa-users" style='font-size:18px;'></i>
My Team</td><td align=center style='border-top:3px solid blue;'> 

${sessionScope.DIRECT}

</td><td align=center style='border-top:3px solid blue;'>
 
<input type='button' class='upgrade' value="&#8686;" onclick="upgradeLevel();">
</td>
</tr>
</table>


<c:if test='${SWITCHED=="On"}'>

<form name="seedform" action="skey?action=getHelp" method='post'>



<c:forEach var='seedhelp' items="${sessionScope.SEEDHELPS}"> 
<table border=1 align=center cellpadding=8 cellspacing=1 class='login' width=570 height=340>
<tr class='bghead'><td>
<p id=${seedhelp.seederskey}></p>
</td></tr>
<tr class=bg1><td>
&#128273; Seed Help</td>
</tr>

<tr>
<td class='sdbutton' align=center> <i class='fa fa-rupee-sign' style='font-size:20px;'></i><b>
${seedhelp.seederstype}</b>
</td></tr>
<tr class='bg2'><td>
${seedhelp.assigndate}
</td>
</tr>


<tr class='bg1'>
<td>${seedhelp.bindseeder} </td>
</tr>
<tr class='bg2'>
<td>${seedhelp.name}</td>
</tr>


<tr>

<td class='bg1' align=center><i class='fa fa-mobile-alt'></i>&nbsp;<A href='tel:${seedhelp.mobile}'>${seedhelp.mobile}</A>&nbsp;&nbsp;&nbsp;||
<img src='images/whatsapp2.png' width=20px;/>&nbsp;<A href='https:/api.whatsapp.com/send?phone=${seedhelp.whatsapp} &text="Hi.. Kindly accept my seed in K2G Regards ${SEEDER.name}" target="_blank"'>${seedhelp.whatsapp}</A>
</td>
</tr>
<tr class='bg2'>
<td><img src='images/phonepe.jpg' width=50px; border=1/> PhonePe- ${seedhelp.phonepe}  ||<i class='fa fa-grip-lines-vertical'></i><img src='images/gpay.jpg' width=50px; border=1/> 
 Google Pay-${seedhelp.gpayid}</td>
</tr>
<tr class='bg2'>
<td><img src='images/upi.jpg' width=50px;/> (UPI ID) - ${seedhelp.upiid}</td>
</tr>
<tr><input type='hidden' id='S+${seedhelp.seederskey}' value='${seedhelp.seederskey}'>
<input type='hidden' id='S+${seedhelp.bindskey}' value='${seedhelp.bindskey}'>
<input type='hidden' id='S+${seedhelp.bindseeder}' value='${seedhelp.bindseeder}'>
<input type='hidden' id='S+${seedhelp.name}' value='${seedhelp.name}'>

<td align='center'><input type='button' value='Seed' class='sdbutton' onclick="seedHelp('S+${seedhelp.seederskey}', 'S+${seedhelp.bindskey}','S+${seedhelp.bindseeder}','S+${seedhelp.name}')"></td>
</tr>

</table>
</c:forEach>
<br>
<c:forEach var='seedhelp' items="${sessionScope.GETHELPS}"> 
<table border=0 align=center cellpadding=8 cellspacing=1 class='login1' width=570 height=340>
<tr class='bghead2'><td>
<p id='${seedhelp.seederskey}+1'></p>
</td></tr>
<tr class=bg1><td>
<b>&#128273; &nbsp;Get Help</b></td>
</tr>

<tr>
<td class='acbutton' align=center><i class='fa fa-rupee-sign' style='font-size:24px;'></i><b>
${seedhelp.seederstype}</b>
</td></tr>
<tr class='bg2'><td>
${seedhelp.binddate}
</td>
</tr>


<tr class='bg2'>
<td>${seedhelp.seederid} </td>
</tr>
<tr class='bg1'>
<td>${seedhelp.name}</td>
</tr>


<tr class='bg1'>
<td><i class='fa fa-mobile-alt'></i>&nbsp;<A href='tel:${seedhelp.mobile}'>${seedhelp.mobile}</A> ||
<img src='images/whatsapp2.png' width=20px;/> &nbsp;<A href='https:/api.whatsapp.com/send?phone=${seedhelp.whatsapp} &text="Hi.. Kindly send my seed help in Konnect2Grow. Regards ${SEEDER.name}" target="_blank"'>${seedhelp.whatsapp}</A>

</td>
</tr>
<tr><input type='hidden' id='${seedhelp.seederskey}' value='${seedhelp.seederskey}'>
<input type='hidden' id='${seedhelp.bindskey}' value='${seedhelp.bindskey}'>
<input type='hidden' id='${seedhelp.bindstype}' value='${seedhelp.bindstype}'>
<input type='hidden' id='${seedhelp.name}' value='${seedhelp.name}'>
<input type='hidden' id='${seedhelp.seederstype}' value='${seedhelp.seederstype}'>
<input type='hidden' id='${seedhelp.srno}' value='${seedhelp.srno}'>
<input type='hidden' id='${seedhelp.seederid}' value='${seedhelp.seederid}'>


<td align='center'><input type='button' value='Accept' class='acbutton' onclick="getHelp('${seedhelp.seederskey}','${seedhelp.bindskey}','${seedhelp.bindstype}','${seedhelp.name}','${seedhelp.seederstype}','${seedhelp.srno}','${seedhelp.seederid}')"></td>
</tr>

</table>
<br>
</c:forEach>

</form>
</c:if>
</br>
<div class=scrolldiv>
<label class='tabledesc'><b>SEED HELP LOG &nbsp;&nbsp;&nbsp;&nbsp;<b></label>
<table border=1 align=center cellpadding=8 cellspacing=1 class='login2' width=570 height=auto><tr>
<th>SEED TIME</th><th>STYPE</th><th>STATUS</th><th>GROW IN<br> (HH:MM)</th>
<c:if test="${empty SEEDKEYS}">
<tr><td colspan=4>Nothing to display</td></tr>
</c:if>

<c:forEach var='seedkey' items="${requestScope.SEEDKEYS}"> 
<tr class='${seedkey.lifecycle}'>
<td>${seedkey.paiddate}</td><td>${seedkey.skeytype}</td><td>${seedkey.lifecycle}</td><td>${seedkey.dog}</td>
</tr></c:forEach>
</table>
</div>
<br><br>

<div class=scrolldiv>
<label class='tabledesc'><b>GROWTH LOG &nbsp;&nbsp;&nbsp;&nbsp;<b></label>
<table border=1 align=center cellpadding=8 cellspacing=1 class='login2' width=570 height=auto><tr>
<th>GROWTH </th><th>SEED HELP</th><th>STATUS</th><th>GROW DATE</th>
<c:if test="${empty BINDHELPS}">
<tr><td colspan=4>Nothing to display</td></tr>
</c:if>

<c:forEach var='bhelp' items="${requestScope.BINDHELPS}"> 
<tr class='${bhelp.status}'>
<td>${bhelp.seederstype}</td><td>${bhelp.bindstype}</td><td>${bhelp.status}</td><td>${bhelp.binddate}</td>
</tr></c:forEach>
</table>
</div>
<br><br>
</div>

</body>

</html>