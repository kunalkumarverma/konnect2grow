<html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta name='viewport' content='Width=device-width, initial-scale=0.6'>


<head>
<link href="css/konnect.css" rel="stylesheet"/>

<style>

.textbox {
    Width: 530px;
    Padding: 15px 7px;
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
font-size: 24px;
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

Padding: 14px 4px;
   Box-shadow: 0px 8px 16px 0px gray;
 
}

select{
font-size:18px;
}
#title1{
text-indent:21px;
}
a{
color:white;
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

alert("Select a state form list");
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



</script>



<title>Konnect2Grow - Let's connect </title>
</head>

<body>
<c:if test="${empty SEEDER}">
<c:redirect url="/seeder?action=home"/>
</c:if>

<div class="maindv"><br>
<jsp:include page="headermenu.jsp"/>

<br><br>
<form action="seeder?action=update" onSubmit='return checkValue(this)' method='post'>
<c:forEach var='SEEDER' items="${requestScope.SEEDERS}"> 

<table border=0 align=center cellpadding=6 cellspacing=6 class='login2' width=550 height=180>
<tr class=th1><th colspan=2 align=left>Share & Grow</th>
</tr>
<tr>
<td colspan=2>My K2G Id : ${SEEDER.seederid}</td>
</tr>

<tr>
<td colspan=2>Referred By : ${SEEDER.refSeeder}</td>
</tr>
<tr>
<td colspan=2>Date of Join : ${SEEDER.doj}</td>

</tr>
<tr>
<td>My Level : ${SEEDER.level}</td>
<td align=right><a href='seeder?action=change'>(Change Password)</a></td>
</tr>

</table>

<br>
<table cellpadding=6 cellspacing=6 border=0 class='login' width=570 align=center>
<tr class='thead1'><th align=center>&#128279; User Profile &#128279;</th>
</tr>
<tr>
<td colspan=1 style='color:red'>${MSGUP}
<label style="visibility:hidden" id='msglbl'><label/>
</td>
</tr>


<tr>
<td>&#9997; Full Name*  <br>

<input type='text' class='textbox' name='fname' readonly value="${SEEDER.name}"></td>
</tr>

<tr>
<td>&#128222;Mobile No* <br>
<input type='text' class='textbox' name='mobile' required onchange='checkNumeric(this)' value="${SEEDER.mobile}">
</td></tr>

<tr>
<td>&#9990; Whatsapp No*<br>
<input type='text' class='textbox' name='whatsapp' required onchange='checkNumeric(this)' value="${SEEDER.whatsapp}" maxlength='10'>
</td></tr>

<tr>
<td>&#9993; Email Id   <br>
<input type='text' class='textbox' name='email' onchange='validateemail(this)' value="${SEEDER.email}">
</td></tr>
<tr align=right>
<td>
<input type='submit' value='Update' class='button'>&nbsp;&nbsp;
</td></tr>


<tr><td colspan=2><hr></td></tr>
<tr>
<td>&#128198; Date Of Birth* <br>
<input type='text' class='textbox' name='dob' readonly value="${SEEDER.dob}" maxlength='10'>
</td></tr>


<tr>
<td>&#9893; Gender   <br>

<input type='text' name="gender" class='textbox' readonly value="${SEEDER.gender}">
</td></tr>


<tr><td><hr></td></tr>
<tr>
<td>&#9993; Address Line1*  <br>
<input type='text' class='textbox' name='address1' required value="${SEEDER.address1}"></td>
</tr>
<tr>
<td>&#9993; Address Line2  <br>
<input type='text' class='textbox' name='address2' value="${SEEDER.address2}">
</td></tr>

<tr>
<td>&#9992; District* <br>
<input type='text' class='textbox' name='district' required value="${SEEDER.district}">
</td></tr>
<tr>
<td>&#9992; State*  <br>
<select class='textbox' name='state'>
<option value='${SEEDER.state}'>${SEEDER.state}</option>
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
<input type='text' class='textbox' name='pincode' required onchange='checkNumeric(this)' value="${SEEDER.pinCode}">
</td></tr>


<tr><td><hr></td></tr>
<tr><td></td></tr>
<tr>
<td>PhonePe ID <br><input type='text' class='textbox' name='phonepe' value="${SEEDER.phonepe}">
</td></tr>
<tr>
<td>Google Pay ID <br>
<input type='text' class='textbox' name='gpayid' value="${SEEDER.gpayId}"></td>
</tr>
<tr>
<td>UPI ID <br>
<input type='text' class='textbox' name='upiid' value="${SEEDER.upiId}"></td>
</tr>



<tr><td>&nbsp;</td></tr>
<tr align=right><td>

<input type='submit' value='Update' class='button'>&nbsp;&nbsp;
</td></tr>
<tr class='thead1'><td></td></tr>
</table>


</c:forEach>
<br>


</form>


</div>


</body>
</html>

