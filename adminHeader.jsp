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
	float:left;
	 
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
  background-color: purple;
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
  Font-size: 14px;
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
  //Background-color: #87CEEB;
  Min-width: 160px;
  Box-shadow: 0px 8px 16px 0px grey;
  z-index: 1;
	font-size:12px;
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
<div class="logo">
<img src="images/logo3.png"/>
</div>

<div class="topnav" id="myTopnav" align=center>
<a href="admin?action=DASHBOARD" class="active">Home</a>
<a href="skey?action=SKEYTYPE">SType</a>
<a href="skey?action=GETSTYPE">SKey</a>
<a href="skey?action=GETSTYPE&flag=Mgmt">SG Mgmt</a>
<a href="seeder?action=seeders&flag=ALL">&#127917;</a>
<a href="admin?action=WITHDRAW&status=All">&#8361;</a>

<a href="admin?action=changepass">&#9851;</a>

<a href="admin?action=logout"><i class="fa fa-power-off" style='font-size:18px;'></i></a>


<a href="javascript:void(0);" class="icon" onclick="myFunction()">
<i class="fa fa-bars"></i>
</a>
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

