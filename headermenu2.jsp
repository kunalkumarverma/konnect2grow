<link href="css/header.css" rel="stylesheet" type="text/css" />

<div id="logo">
<img src="images/logo3.png"/>
</div>

<div class="topnav" id="myTopnav" align=center>
<a href="seeder?action=home" class="active">Home</a>

<a href="javascript:void(0);" class="icon" onclick="myFunction()">
<i class="fa fa-bars">=</i>
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

