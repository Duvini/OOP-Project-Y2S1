<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="cs/sidepanecss.css" >
<script src="Javacript/homejs.js"></script>
<style>
@charset "ISO-8859-1";
@import url(‘https://fonts.googleapis.com/css?family=Poppins’);

.side-pane {
    height: 100%;
    width: 250px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #9FB7AC; /* Dark Blue Shade */
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
	font-family: Poppins;
} 

.closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
    color: #f1f1f1;
    transition: 0.3s;
}

.closebtn:hover {
    color: white;
}

.side-pane a {
    padding: 15px;
    text-decoration: none;
    font-size: 15px;
    color: #f1f1f1;
    display: block;
    transition: 0.3s;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1); /* Slight border for visual separation */
}

.side-pane a:hover {
    color: white;
    background: black; /* Pinky-blue gradient on hover */
    background-size: 200% 200%;
    animation: gradient 15s infinite;
}

.side-pane a.active {
    background: black;
    background-size: 200% 200%;
    animation: gradient 15s infinite;
}

@keyframes gradient {
    0% {
        background-position: 100% 0%;
    }
    50% {
        background-position: 0% 100%;
    }
    100% {
        background-position: 100% 0%;
    }
}

    .project-details {
    position: absolute;
    bottom: 20px;
    left: 15px;
    color: #f1f1f1; /* This makes the text color light to match the side pane */
    font-size: 14px;
}


.main-content {
    margin-left: 250px;
    transition: 0.5s;
    padding: 20px;
    
}
</style>
<script>
function openNav() {
    document.getElementById("sidePane").style.width = "250px";
    document.querySelector(".main-content").style.marginLeft = "250px";

}

function closeNav() {
    document.getElementById("sidePane").style.width = "0";
    document.querySelector(".main-content").style.marginLeft = "0px";

}

</script>

</head>
<body>


<!-- Side Pane -->
<div id="sidePane" class="side-pane">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    
    <a href="homeServlet">Administrator Home</a>
    <a href="productview.jsp">Product Management</a>
    <a href="#">All Orders</a>
    <a href="#">Deliveries</a>
     <a href="#">Customer Support</a>
    <a href="empMng.jsp"> Admin Management</a>
    <a href="logoutServlet">  Log Out</a>   
   
    <!-- Bottom Details -->
<div class="project-details">
<h5>
   
    Project By FantasticFour<br><br>
     IT22266828 . IT22149558<br>
     IT22884510 . IT22080394
	<br><br><br>
   -------------------------  
   </h5>
</div>
      
</div>

	

	<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>








</body>
</html>