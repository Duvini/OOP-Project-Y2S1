<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.model.*,java.util.*,com.service.*,java.util.*,com.util.*,java.util.*,com.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
 <link rel="icon" href="images/babyl.jpg" type="image/png" >
    <meta charset="ISO-8859-1">
    <title>User Home</title>
  <style>
@import url(‘https://fonts.googleapis.com/css?family=Poppins’);
.mySlides {display: none}
.simg {
vertical-align: middle;
padding-top:60px;
}
* {
    box-sizing: border-box;
}


/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #bd6390;
  font-size: 30px;
  padding: 8px 12px;
  position: absolute;
  bottom: 220px;
  width: 100%;
  text-align: center;
}
.text1 {
  color: #bd6390;
  font-size: 30px;
  padding: 0px 20px;
  position: absolute;
  bottom: 210px;
  width: 100%;
  text-align: center;
}



/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 500px) {
  .prev, .next,.text {font-size: 11px}
}
}

.button4 {border-radius: 12px;}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 500px;
  padding-left:30px;
  padding-right:30px;
  padding-bottom:30px;
  margin: auto;
  text-align: center;
  font-family: poppins;
}

.price {
  color: grey;
  font-size: 22px;
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #5AB2C1;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card button:hover {
  opacity: 0.7;
}
/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 30px 10px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
	
  }
}

 .product-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* Display three cards in a row */
    grid-gap: 20px; /* Add some spacing between cards */
  }
 
 .product-image {
  width: 200px;
  height: 200px;
}
 
   .product-card {
    max-width: 300px; /* Set a fixed maximum width */
    margin: auto;
    text-align: center;
  }

 

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 600px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.price {
  color: grey;
  font-size: 22px;
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color:#5AB2C1;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card button:hover {
  opacity: 0.7;
}




</style>
</head>
</head>
<body>
<%@ include file="Header.jsp" %>
<!-- Slideshow content here -->

<br>

<% 
ProductServiceImpl proDao = new ProductServiceImpl();
List<Product> equipProducts = proDao.getEquipProducts(); // Fetch only food products
%>

<div class="product-grid">
    <%
    for (Product product : equipProducts) {
    %>
    <div class="card">
        <img src="./ShowImages?pid=<%=product.getProdId() %>" class="product-image">
        <h3><%= product.getProdName() %></h3>
        <p class="price"><%= product.getProdPrice() %></p>
        <div class="des" style="font-size: 12px">
            <p><%= product.getDescription() %></p>
        </div>
        <p><button>Add to Cart</button></p>
    </div>
    <%
    }
    %>
</div>

<br>

<script>
// Your JavaScript for the slideshow
</script>

<%@ include file="Footer.jsp" %>
</body>
</html>
