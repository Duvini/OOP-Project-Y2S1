<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
 <link rel="icon" href="images/babyl.jpg" type="image/png" >
<style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

 @import url(‘https://fonts.googleapis.com/css?family=Poppins’);
body
{  
  background-color: #fff;
   font-family: 'Poppins', sans-serif;
   font-size:18px;
}


.container1 {
	background-color: #EDE9E6;
	border-radius: 8px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	padding: 20px;
	width: 590px;
	text-align: left;
}

.container1 h1 {
	color: #6c513d;
	/* Brown Text Color */
}

.input-group {
	margin: 20px 0;
	
}

label {
	font-size:18px;
	font-weight:500;
}

input[type="text"], input[type="email"],textarea, select {
	width: 95%;
	padding: 10px;
	pdding-left:10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-top: 5px;
	font-size: 16px;
}

textarea {
	height: 150px;
}

input[type="submit"] {
	background-color: #6c513d;
	/* Brown Button Color */
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px;
}

input[type="submit"]:hover {
	background-color: #543c2b;
	
}

.image-container {
	display: flex;
	justify-content: space-between;
	font-family: 'Poppins', sans-serif;
}

.image {
	width: 100%;
	height: 75%;
}

.image-description {
	text-align: center;
	width: 95%;
}

.main-description-form {
	display: center;
	justify-content: center;
	font-family: 'Poppins', sans-serif;
	left: 25%;
}

.main-description {
	/* Take up half of the available space */
	
}

.form {
	flex: 1;
	align-items: center;

	/* Take up half of the available space */
}
.container2
{ width: 40%; /* Adjust the width as needed */
    text-align: center;
    float: right;
    font-family: 'Poppins', sans-serif;
   padding-right: 60px;
    }
    
    
.scroll-to-top {
    position: fixed;
    bottom: 0px; /* Adjust the desired distance from the bottom */
    right: -50px;
    padding-right:50px;
    
}
</style>
</head>

<body >
<%@include file="Header.jsp" %>

	<div class="main-image">
		<img src="image/imge0.jpg" class="image">
	</div>
	<br>
	<center>
		<div class="main-description-form">
			<div class="main-description">
				<h2>HAPPY TO ANSWER ALL YOUR QUESTIONS</h2><br>


			</div>
			<div class="container1">
			<center><h1 >Inquiry Form</h1></center>
				
				<form action="Inquiryinsert" method="post">
					<div class="input-group">
						<label for="name">Your Name:</label> <input type="text"
							id="inname" name="inname" required>
					</div>
					<div class="input-group">
						<label for="email">Email:</label> <input type="email" id="inemail"
							name="inemail" required>
					</div>
					<div class="input-group">
						<label for="inquiry-type">Inquiry Type:</label> <select
							id="intype" name="intype" required>
							<option value="product">Product Inquiry</option>
							<option value="sizing">Sizing and Fit Inquiry</option>
							<option value="safety">Safety and Health Inquiry</option>
							<option value="feeding">Feeding and Nutrition Inquiry</option>
							<option value="registry">Baby Registry Inquiry</option>
							<option value="advice">Parenting Advice Inquiry</option>
							<option value="return">Return and Exchange Inquiry</option>
							<option value="hours">Store Hours and Location Inquiry</option>
							<option value="online">Online Ordering Inquiry</option>
							<option value="events">Special Events and Promotions
								Inquiry</option>
						</select>
					</div>
					<div class="input-group">
						<label for="message">Message:</label> <textarea id="inmessage" name="inmessage" required></textarea>
						
					</div>
					<div class="input-group">
					<center>
						<input type="submit" value="Submit" name="submit">
						</center>
					</div>
				</form>

			</div>

			<br><h2>WHERE TO FIND US?</h2><br>
		</div>

	</center>
	<div class="image-container">

		<div>
			<img src="image/imge1.jpg" class="image">
			<p class="image-description">
			<h3>Colombo Store</h3>
			No 138,<br>1st Lane,<br>Colombo 05
			</p>
		</div>
		<div>
			<img src="image/imge2.jpg" class="image">
			<p class="image-description"><h3>Kurunegala Store</h3> No 33,<br>Negombo Road,<br>Kurunegala
			
			</p>
		</div>
		<div>
			<img src="image/imge3.jpg" class="image">
			<p class="image-description"><h3>Badulla Store</h3>No 60,<br>3rd Lane,<br>Badulla</p>
		</div>
		<div>
			<img src="image/imge4.jpg" class="image">
			<p class="image-description"><h3>Gampaha Store</h3>No 8,<br>Kaduwela Road,<br>Gampaha</p>
		</div>
	</div>
	<br>
	<br><br><br>
	<div class="container2">
		<h2>FIND THE BEST WAY TO OUR FINE STYILISH KIDS SHOPS</h2><br>
		<b><p>Monday-Firday from 09:00 to 18:00</p></b><br>
	<p>Our kids' shop is conveniently located in the heart of the city, making it easily accessible to f
	</p>
	<div class="scroll-to-top" id="scrollToTop">
    <img src="image/imge13.png" width=30% height=10%>
</div>
	</div>
	
	
	
	 <iframe
        width="50%"
        height="450"
        frameborder="0"
        style="border:0"
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31729.292444364655!2d80.034331!3d7.0339495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae256db1a6771c5%3A0x2c63e344ab9a7536!2sSri%20Lanka%20Institute%20of%20Information%20Technology%2C%20SLIIT%20Malabe%20Campus!5e0!3m2!1sen!2slk!4v1640305468557!5m2!1sen!2slk"
        allowfullscreen>
    </iframe>
   <script>window.onscroll = function() {
	   
	    scrollFunction();
   };

   function scrollFunction() {
       var scrollToTopButton = document.getElementById("scrollToTop");
       if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
           scrollToTopButton.style.display = "block";
       } else {
           scrollToTopButton.style.display = "none";
       }
   }

   document.getElementById("scrollToTop").addEventListener("click", function() {
       document.body.scrollTop = 0;
       document.documentElement.scrollTop = 0;
   });
</script>
<%@include file="Footer.jsp" %>
</body>

</html>
