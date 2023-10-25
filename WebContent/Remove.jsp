<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="icon" href="images/babyl.jpg" type="image/png" >
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #E6F9E6;">


	<%
	String message = request.getParameter("message");
	
    String prodid = request.getParameter("prodid");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
			<form action="./remove" method="post"
				class="col-md-4 col-md-offset-4"
				style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h3 style="color: green;">Product Deletion Form</h3>
					<%
					if (message != null) {
					%>
					<p style="color: blue;">
						<%=message%>
					</p>
					<%
					}
					%>
				</div>
				<div></div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Product Id</label> <input type="text"
							placeholder="Enter Product Id" name="prodid" class="form-control"
							id="last_name" value="<%= prodid %>" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 text-center" style="margin-bottom: 2px;">
						<a href="productview.jsp" class="btn btn-info">Cancel</a>
					</div>
					<div class="col-md-6 text-center">
						<button type="submit" class="btn btn-danger">Remove
							Product</button>
					</div>
				</div>
			</form>
		</div>
	</div>


</body>
</html>