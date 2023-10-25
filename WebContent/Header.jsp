<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<style>
/* Reset CSS */
@import url(‘https://fonts.googleapis.com/css?family=Poppins’);
*,html,body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,label,fieldset,input,p,blockquote,th,td {
   
 
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style-type: none;
    font-family: 'Poppins', sans-serif;

}

article,aside,figure,footer,header,hgroup,nav,section {
    display: block;
}


/* Global Styles */
html {
    -webkit-font-smoothing: antialiased;
}

body {
    background: white;
    color: #374147;
    font: 20px "Open Sans", Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    line-height: 1;
    width: 100%;
    margin: 0;
    padding: 0;
}

/* CSS for Menu and Sub-Menus Visualization */
nav {
    background: #EDE9E6;
     display: block;
}

.menu-container {
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
    align-items: center; /* Vertically align the menu in the container */
    padding: 0px 100px;
}
    
.menu {
   
    display: block;
    align-items: center;
}

.menu li {
    margin-left: 100px;
    display: inline-block;
    position: relative;
    z-index: 100;
}
.menu li:first-child {
    margin-left: 0;
}

.menu a {
    font-weight: normal;
    text-decoration: none;
    padding: 25px 15px;
    display: block;
    color: black;
    transition: all 0.2s ease-in-out 0s;
    
}

.menu a:hover,
.menu li:hover > a {
    color: black;
    background: #C9DFD6;
}

.menu ul {
    visibility: hidden;
    opacity: 0;
    margin: 0;
    padding: 0;
    width: 170px;
    position: absolute;
    top: 60px;
    background: #F0ECE9;
    z-index: 99;
 	transform: translate(0,20px);
    transition: all 0.2s ease-out;
 	 
}

.menu ul:after {
    bottom: 100%;
    left: 20%;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-color: rgba(255, 255, 255, 0);
    border-bottom-color: #F0ECE9;
    border-width: 6px;
    margin-left: -6px;
}

.menu ul li {
    display: block;
    float: none;
    background: none;
    margin: 0;
    padding: 0;
}

.menu ul li a {
    font-size: 16px;
    font-weight: normal;
    display: block;
    color: black;
    background: #FFFFFF;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}
.nav-link.active {
    font-weight: bold;
    color: #C9DFD6; 
}

.menu ul li a:hover,
.menu ul li:hover > a {
    background: #C9DFD6;
    color: black;
}

.menu li:hover > ul {
     visibility: visible;
    opacity: 1;
    transform: translate(0,0);
}

.menu ul ul {
    left: 169px;
    top: 0px;
    visibility: hidden;
    opacity: 0;
    transform: translate(20px,20px);
    transition: all 0.2s ease-out;
}

.menu ul ul:after {
    left: -6px;
    top: 10%;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-color: rgba(255, 255, 255, 0);
    border-right-color: #F0ECE9;
    border-width: 6px;
    margin-top: -6px;
    
}

.menu li > ul ul:hover {
    visibility: visible;
    opacity: 1;
    transform: translate(0,0);
}

/* Account Image Styles */
.account-image {
    width: 40px;
    height:40px;
    overflow: hidden;
    margin-top: 0px;
    vertical-align: middle;
}

/* Account Image Styles */
.logo-image {
    height:56px;
    border-radius: 100%;
    overflow: hidden;
    margin-top: 10px;
}

.logo-text {
    font-family: 'Courgette', cursive;
    color: #BD6390;
    font-size: 35px;
    margin-right: 10px;
}
.menuH {
    margin-left: auto; /* This will push the div to the right */
    padding-right:80px;
}
</style>

</head>
<body>
<nav>
    <div class="menu-container">
        <span class="logo-text"><b>Baby Land</b></span>
        <img src="images/logo.png" alt="Account Image" class="logo-image">
        <div class="menuH">
        <ul class="menu">
        
            <li><a class="nav-link.active" href="Home.jsp"><i class="fa fa-home"></i> Home</a></li>
            <li><a href="#"><i class="fa fa-shopping-bag"></i> Shop</a>
                <ul class="sub-menu">
                    <li><a href="Food.jsp">Food</a>
                       
                    </li>
                    <li><a href="Sanitary.jsp">Sanitary & Hygiene</a>
                        
                    </li>
                    <li><a href="Equipment.jsp">Equipments</a>
                      
                    </li>
                </ul>
            </li>
            <li><a href="Inquirypage.jsp"><i class="fa fa-envelope"></i> Contact</a></li>
            <li><a href="#"><i class="fa fa-truck"></i> Orders</a></li>
            
           <li><a href="useraccount.jsp"><img src="images/user.png" alt="Account Image" class="account-image"></a>
            <ul>
            <li><a href="logout.jsp">LogOut</a>
            </ul>
             </li>
             
             
        </ul>
        </div>
    </div>
</nav>
</body>
</html>