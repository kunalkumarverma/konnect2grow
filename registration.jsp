<html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>
<link href="css/fontawesome.css" rel="stylesheet"/>
<link href="css/konnect.css" rel="stylesheet"/>

<style>

.textbox {
    Width: 550px;
    Padding: 15px 6px;
    Font: 20px/25px “Lato”, Arial, sans-serif;
    Color: #333;
    Box-sizing: border-box;
    Letter-spacing: 1px;
    Border:0;
    Border: 1px solid #ccc;
    Transition: 0.4s;
    border-radius:10px;
	Box-shadow: 0px 8px 16px 0px gray;
	text-indent:15px;
}

.login{
font-family: Times New Roman;
font-size: 22px;
color: #153E7E;
font-weight:1200;
background-color:whitesmoke;
text-indent: 15px;
border-top : 4px groove darkblue;
border-bottom : 4px groove darkblue;
border-left : 4px groove darkblue;
border-right : 4px groove darkblue;
border-radius:10px;
Box-shadow: 0px 8px 16px 0px darkblue;
background-image: linear-gradient(to right,lightgrey, whitesmoke);
opacity:0.9;
align:center;
}

.thead1{
background-image: linear-gradient(to bottom, black, gray); 
color:white;
font-size:25px; 
font-weight:900;
}

.regform{
  	font-size:14px;
	margin:auto;
	padding:0px;
 	border:1px solid magenta;

	color: #153E7E;
	
	background: url(./images/bg3.png) top repeat-y;	
	//background-image: linear-gradient(to bottom, purple, magenta);

	Box-shadow: 0px 8px 16px 0px darkblue;
	width:600px;
	
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

Padding: 14px 5px;
   Box-shadow: 0px 8px 16px 0px gray;
 
}
.bg9{
Color:white;
background-image: linear-gradient(to Left, whitesmoke, gray); 
font:weight:800;
Box-shadow: 0px 4px 2px 0px whitesmoke;
 
}
select{
font-size:22px;
}
#title1{
text-indent:21px;
}


</style>
<script>
function checkValue(form){
var refid=form.refseeder.value;
var fname=form.fname.value;
var dob=form.dob.value;
var mobile=form.mobile.value;
var whatsapp=form.whatsapp.value;
var pincode=form.pincode.value;
var phonepe=form.phonepe.value;
var gpayid=form.gpayid.value;
var upiid=form.upiid.value;
var state=form.state.value;
//alert(dob);
if(refid.length==0){

alert("Reference Id Field can not blank");
return false;
}
if(state==="Select"){

alert("Select a state from list");
return false;
}


if(phonepe.length==0&&gpayid.length==0&&upiid.length==0){
alert("All payment method can not blank");
return false;
}

}

function checkNumeric(num){
var nume=num.value;
//alert(nume);
if(isNaN(nume)){
	//document.getElementById("num").innerHTML="";
	alert("Only Numeric value allowed");
	num.value="";
}


}
function validateemail(email)  
{ 
//alert('hi'); 
var x=email.value;  
var atposition=x.indexOf("@");  
var dotposition=x.lastIndexOf(".");  
if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
  alert("Please enter a valid e-mail address");
	email.value="";	  
  return false;  
  }  
}  


function checkSkey(){
var xmlhttp;
//alert("Hii");
var skey=document.getElementById("skey").value;

if (skey.length==0)
  {
  //document.getElementById("errmsg").style.visibility="visible";
	//document.getElemntById('msglbl').innerHTML="Entered Key not valid";	
  return;
 }
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
	var val=xmlhttp.responseText;
		if(val==="false"){
			alert("Invalid or used skey entered");
			document.getElementById("skey").value="";
		}
		
	//document.getElemntById("skey").value="";	
	//document.getElementById("msglbl").style.visibility="visible";
	
    //document.getElementById(textid+"Name").innerHTML=xmlhttp.responseText;
	  
    }
  }
try{
xmlhttp.open("GET","seeder?action=checkSkey&skey="+skey,true);
}
catch(e){
alert("Unable to connect server, please try later");

}

xmlhttp.send();
}

</script>



<title>Konnect2Grow - Let's connect </title>
</head>

<body>
<div class="regform" align=center><br>
<div id='title1' align=left><img src='images/logo3.png'>
</div>
<br>
<form action="seeder?action=register" onSubmit='return checkValue(this)' method='post'>
<table cellpadding=8 cellspacing=8 border=0 class='login' width=590 align=center>
<tr class='thead1'><th align=center>&#128279; Seeder Registration Form &#128279;</th>
</tr>
<tr>
<td colspan=1 style='color:red'>
<label style="visibility:hidden" id='msglbl'>Hi<label/>
</td>
</tr>

<tr class='bg9'><td>&#128221 System Info &raquo;</td></tr>

<tr><td>&#128279;
Reference Code*  <br> 
<input type='text' class='textbox' name='refseeder' readonly value='<%=request.getParameter("ref")%>'></td>
</tr>
<tr>
<td>&#128279;Seed Key*  <br>
<input type='text' class='textbox' name='skey' id='skey' maxlength='30' required onchange="checkSkey()"></td>
</tr>
<tr><td><hr></td></tr>

<tr class='bg9'><td>&#128100 Personal Info &raquo;</td></tr>


<tr>
<td>&#9997; Full Name*  <br>

<input type='text' class='textbox' name='fname' maxlength='30' required placeholder="Full Name"></td>
</tr>

<tr>
<td>&#128222;Mobile No* <br>
<input type='text' class='textbox' maxlength='10' name='mobile' required onchange='checkNumeric(this)' placeholder="Mobile No">
</td></tr>

<tr>
<td><img src='images/whatsapp2.png' width=20px;/> Whatsapp No*<br>
<input type='text' class='textbox' maxlength='10' name='whatsapp' required onchange='checkNumeric(this)' placeholder="Whatsapp No">
</td></tr>

<tr>
<td>&#9993; Email Id   <br>
<input type='text' class='textbox' maxlength='50' name='email' onchange='validateemail(this)' placeholder="Email">
</td></tr>
<tr><td colspan=2><hr></td></tr>
<tr>
<td>&#128198; Date Of Birth* <br>
<input type='date' class='textbox' name='dob' required max='2014-12-31' placeholder="Date of Birth">
</td></tr>
<tr>
<td>&#9893; Gender   <br>

<select name="gender" class='textbox'>
<option value="Male">Male</option>
<option value="Female">Female</option>
</select>
</td></tr>


<tr><td><hr></td></tr>
<tr class='bg9'><td>&#128233 Postal Info </td></tr>

<tr>
<td>&#9993; Address Line* &#10102  <br>
<input type='text' class='textbox' name='address1' required placeholder="Address Line 1"></td>
</tr>
<tr>
<td>&#9993; Address Line &#10103  <br>
<input type='text' class='textbox' name='address2' placeholder="Address Line2">
</td></tr>

<tr>
<td>&#9992; District* <br>
<input type='text' class='textbox' name='district' required placeholder="District">
</td></tr>
<tr>
<td>&#9992; State*  <br>
<select class='textbox' name='state'>
<option value='select'>Select</option>
<option value="Andhra Pradesh">Andhra Pradesh</option>
<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
<option value="Arunachal Pradesh">Arunachal Pradesh</option>
<option value="Assam">Assam</option>
<option value="Bihar">Bihar</option>
<option value="Chandigarh">Chandigarh</option>
<option value="Chhattisgarh">Chhattisgarh</option>
<option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
<option value="Daman and Diu">Daman and Diu</option>
<option value="Delhi">Delhi</option>
<option value="Lakshadweep">Lakshadweep</option>
<option value="Puducherry">Puducherry</option>
<option value="Goa">Goa</option>
<option value="Gujarat">Gujarat</option>
<option value="Haryana">Haryana</option>
<option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jammu and Kashmir">Jammu and Kashmir</option>
<option value="Jharkhand">Jharkhand</option>
<option value="Karnataka">Karnataka</option>
<option value="Kerala">Kerala</option>
<option value="Madhya Pradesh">Madhya Pradesh</option>
<option value="Maharashtra">Maharashtra</option>
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option>
<option value="Mizoram">Mizoram</option>
<option value="Nagaland">Nagaland</option>
<option value="Odisha">Odisha</option>
<option value="Punjab">Punjab</option>
<option value="Rajasthan">Rajasthan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option>
<option value="Telangana">Telangana</option>
<option value="Tripura">Tripura</option>
<option value="Uttar Pradesh">Uttar Pradesh</option>
<option value="Uttarakhand">Uttarakhand</option>
<option value="West Bengal">West Bengal</option>

</select>
</td></tr>
<tr><td>&#9755; Postal Code <br>
<input type='text' class='textbox' name='pincode' maxlength='6' required onchange='checkNumeric(this)' placeholder="Postal Code">
</td></tr>


<tr><td><hr></td></tr>
<tr class='bg9'><td>&#128242; Digital Payout Info </td></tr>
<tr>
<td><img src='images/phonepe.jpg' width=50px; border=1/> (PhonePe ID) <br><input type='text' maxlength='10' class='textbox' name='phonepe' placeholder="Phonepe No">
</td></tr>
<tr>
<td><img src='images/gpay.jpg' width=50px; border=1/> (Google Pay ID) <br>
<input type='text' class='textbox' name='gpayid' placeholder="Google Pay No." maxlength='10'></td>
</tr>
<tr>
<td><img src='images/upi.jpg' width=50px;/> (UPI ID) <br>
<input type='text' class='textbox' name='upiid' placeholder="UPI ID i.e. example@UPI"></td>
</tr>



<tr><td>&nbsp;</td></tr>
<tr align=center><td>

<input type='submit' value='&#128077 Submit' class='button'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type='reset' value='&#127744 Reset' class='button'>
</td></tr>
<tr class='thead1'><td></td></tr>
</table>



<br>


</form>


</div>


</body>
</html>

