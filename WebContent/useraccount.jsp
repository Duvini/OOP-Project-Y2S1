<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="icon" href="images/babyl.jpg" type="image/png" >
<title>Insert title here</title>

<style type="text/css">
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5e1c3; /* Light brown background color */
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

.container {
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	max-width: 600px;
	padding: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	font-weight: bold;
}

th {
	background-color: #f5c092; /* Light orange header background color */
	font-weight: bold;
}

a {
	text-decoration: none;
}

.button-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.button1 {
	background-color: green; /* Darker orange button color */
	color: #fff;
	border: none;
	padding: 10px 20px;
	margin: 10px;
	border-radius: 5px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
}
.button2 {
	background-color: red; /* Darker orange button color */
	color: #fff;
	border: none;
	padding: 10px 20px;
	margin: 10px;
	border-radius: 5px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
}

.button:hover {
	background-color: #ff7d33; /* Lighter orange on hover */
}

.rounded-profile {
	border-radius: 50%;
	display: block;
            margin: 0 auto;
}
</style>
</head>
<body>
	<h1>My Account Details</h1>
<div class="container">

	<img src="image/user.png" class="rounded-profile" width="110">
	
	<br>

	<table>
		<c:forEach var="cus" items="${cusDetails}">

			<c:set var="id" value="${cus.id}" />
			<c:set var="name" value="${cus.name}" />
			<c:set var="email" value="${cus.email}" />
			<c:set var="phone" value="${cus.phone}" />
			<c:set var="username" value="${cus.userName}" />
			<c:set var="password" value="${cus.password}" />


			<tr>

				<td>Customer ID </td>

				<td>${cus.id}</td>
			</tr>

			<tr>

				<td>Customer Name </td>
				<td>${cus.name}</td>

			</tr>
			<tr>
				<td>Customer Email </td>
				<td>${cus.email}</td>
			</tr>
			<tr>
				<td>Customer Phone </td>
				<td>${cus.phone}</td>
			</tr>
			<tr>
				<td>Customer User Name </td>
				<td>${cus.userName}</td>
			</tr>

		</c:forEach>
	</table>
</div>
	<c:url value="updatecustomer.jsp" var="cusupdate">
		<c:param name="id" value="${id}" />
		<c:param name="name" value="${name}" />
		<c:param name="email" value="${email}" />
		<c:param name="phone" value="${phone}" />
		<c:param name="uname" value="${username}" />
		<c:param name="pass" value="${password}" />
	</c:url>
	<div class="button-container">
		<a href="${cusupdate}" class="button1">Update My Data</a> <br>
		<c:url value="deletecustomer.jsp" var="cusdelete">
			<c:param name="id" value="${id}" />
			<c:param name="name" value="${name}" />
			<c:param name="email" value="${email}" />
			<c:param name="phone" value="${phone}" />
			<c:param name="uname" value="${username}" />
			<c:param name="pass" value="${password}" />
		</c:url>


		<a href="${cusdelete}" class="button2">Delete My Account</a>
	</div>












</body>
</html>