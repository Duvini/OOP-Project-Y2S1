<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<style>
body {
	background-color: #C9DFD6; /* Light Brown Background */
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.form-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 10vh;
}

.register-form {
	width: 500px;
	background: rgba(255, 255, 255, 0.8);
	border: 2px solid #0ecced;
	border-radius: 20px;
	padding: 30px;
	height: 500px;
	animation: fadeIn 1s ease-in-out;
}

h1 {
	color: #0c3f47;
	text-align: center;
}

label {
	font-weight: bold;
}

input[type="text"], input[type="password"] {
	width: 90%;
	/* Make text input fields span the entire width of the form */
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc; /* Add a border */
	border-radius: 3px;
}

.register-button {
	background-color: #0b1961;
	color: white;
	border: none;
	border-radius: 8px;
	padding: 10px 20px;
	font-size: 18px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	width: 120px;
	height: 45px;
}

input[type="submit"] {
	background-color: #0074D9; /* Set button background color to blue */
	color: white; /* Set button text color to white */
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="form-container">
		<div class="register-form">
			<form action="cusregister" method="post">
				<h1>Create an Account</h1>

				<label>Name <input type="text" name="name"><br></label>
				<label>Email <input type="text" name="email"><br></label>
				<label> Phone Number <input type="text" name="phone"><br></label><label>
					User Name <input type="text" name="uid"><br>
				</label><label>Password <input type="password" name="psw"><br></label>
				<center>
					     <input type="submit" name="submit" class="register-button" value="Register">
				</center>
			</form>
		</div>
	</div>





</body>
</html>