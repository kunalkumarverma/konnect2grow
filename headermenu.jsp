<link href="css/all.css" rel="stylesheet" type="text/css" />

<style>
body {
  margin: 0;

  font-family: Arial, Helvetica, sans-serif;
}

.logo{
font-family:arial;
	margin:21px;
	padding:0px;
	float:center;
	 
	//background:#333;
}

.topnav {
  overflow: hidden;
  background-color: #333;
	width:600px;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 18px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
background-image: linear-gradient(to right, teal, #28dee4);

  background-color: #28dee4;
  color: white;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}

.dropbtn {
  Background-color: grey;
  Color: white;
  Padding: 9px;
  Font-size: 18px;
  Border: none;
  width:600px;
	text-align:left;	
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  Position: relative;
  Display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  Display: none;
  Position: absolute;
  Background-color: #000020;
  Min-width: 180px;
  Box-shadow: 0px 8px 16px 0px grey;
  z-index: 1;
	padding: 14px 6px;
	font-size:18px;
}

/* Links inside the dropdown */
.dropdown-content a {
  Color: white;
  Padding: 8px 12px;
  Text-decoration: none;
  Display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {color: darkBlue;}

</style>

<div class='logo'>
<img src="images/logo3.png"/>
</div>

<div class="topnav" id="myTopnav" align=center>
<a href="skey?action=DASHBOARD" class="active">&#127968;</a>
<a href="seeder?action=Wallet"><i class="fa fa-wallet" style='font-size:12px;'></i>
 Wallet</a>
<a href="skey?action=SGETSTYPE&flag=TRANS"><i class="fa fa-" style='font-size:12px;'></i>&#8652;Key</a>
<a href="skey?action=SGETSTYPE&flag=user"><i class="fa fa-key" style='font-size:12px;'></i>
Seed</a>
<a href="seeder?action=MYTEAM"><i class="fa fa-users" style='font-size:12px;'></i>
Team</a>
<a href="seeder?action=signup&ref=${SEEDER.seederid}"><i class="fa fa-plus" style='font-size:18px;'></i>
</a>
<a href="seeder?action=SHARE"><i class="fa fa-share-alt" style='font-size:18px;'></i></a>

<a href="javascript:void(0);" class="icon" onclick="myFunction()">
<i class="fa fa-bars" style='font-size:14px;'></i>
</a>
</div>


<div class="dropdown">
<button class="dropbtn">&#127917; ${SEEDER.name} &#9662;</button>
<div class="dropdown-content">
<a href="seeder?action=profile">&#127917; My Profile</a>
<a href="seeder?action=change">&#128295; Change Password</a>
<a href="seeder?action=SignOut"><i class="fa fa-power-off" style='font-size:12px;'></i>
 Sign Out</a>
</div>
</div>




<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>

