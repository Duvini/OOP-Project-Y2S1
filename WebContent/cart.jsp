<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,com.model.*,java.util.*,com.service.*,java.util.*,com.util.*,java.util.*,com.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Details</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: #E6F9E6;">
<%
	/* Checking the user credentials */
	
	String addS = request.getParameter("add");
	if (addS != null) {

		int add = Integer.parseInt(addS);
		String strid = request.getParameter("id");
		int id = Integer.parseInt(strid);
		String pid = request.getParameter("pid");
		int avail = Integer.parseInt(request.getParameter("avail"));
		int cartQty = Integer.parseInt(request.getParameter("qty"));
		cartServiceImpl cart = new cartServiceImpl();

		if (add == 1) {
			//Add Product into the cart
			cartQty += 1;
			if (cartQty <= avail) {
cart.addProductToCart(id, pid, 1);
			} else {
		response.sendRedirect("./AddtoCart?pid=" + pid + "&pqty=" + cartQty);
			}
		} else if (add == 0) {
			//Remove Product from the cart
			cart.removeProductFromCart(id, pid);
		}
	} 
	%>


<%@ include file="Header.jsp" %>

	<div class="text-center"
		style="color: green; font-size: 24px; font-weight: bold;">Cart
		Items</div>
	<!-- <script>document.getElementById('mycart').innerHTML='<i data-count="20" class="fa fa-shopping-cart fa-3x icon-white badge" style="background-color:#333;margin:0px;padding:0px; margin-top:5px;"></i>'</script>
 -->
	<!-- Start of Product Items List -->
	<div class="container">

		<table class="table table-hover">
			<thead
				style="background-color: #186188; color: white; font-size: 16px; font-weight: bold;">
				<tr>
					<th>Picture</th>
					<th>Products</th>
<th>Price</th>
					<th>Quantity</th>
					<th>Add</th>
					<th>Remove</th>
					<th>Amount</th>
				</tr>
			</thead>
			<tbody
				style="background-color: white; font-size: 15px; font-weight: bold;">



				<%
				cartServiceImpl cart = new cartServiceImpl();
				List<cart> cartItems = new ArrayList<cart>();
				String strid = request.getParameter("id");
				int id = Integer.parseInt(strid);
				cartItems=cart.getAllCartItems(id);
				double totAmount = 0;
				for (cart item : cartItems) {
				String pid= item.getPid();

					int prodQuantity = item.getPquantity();

					Product product = new ProductServiceImpl().getProductDetails(pid);

					double currAmount = product.getProdPrice() * prodQuantity;

					totAmount += currAmount;

					if (prodQuantity > 0) {
				%>

				<tr>
					<td><img src="./ShowImage?pid=<%=product.getProdId()%>"
						style="width: 50px; height: 50px;"></td>
					<td><%=product.getProdName()%></td>
					<td><%=product.getProdPrice()%></td>
					<td><form method="post" action="./UpdateToCart">
							<input type="number" name="pqty" value="<%=prodQuantity%>"
								style="max-width: 70px;" min="0"> <input type="hidden"
								name="pid" value="<%=product.getProdId()%>"> <input
								type="submit" name="Update" value="Update"
								style="max-width: 80px;">
						</form></td>
					<td><a
						href="cartDetails.jsp?add=1&id=<%=id%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>"><i
							class="fa fa-plus"></i></a></td>
<td><a
						href="cartDetails.jsp?add=0&id=<%=id%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>"><i
							class="fa fa-minus"></i></a></td>
					<td><%=currAmount%></td>
				</tr>

				<%
				}
				}
				%>

				<tr style="background-color: grey; color: white;">
					<td colspan="6" style="text-align: center;">Total Amount to
						Pay (in Rupees)</td>
					<td><%=totAmount%></td>
				</tr>
				<%
				if (totAmount != 0) {
				%>
				<tr style="background-color: grey; color: white;">
					<td colspan="4" style="text-align: center;">
					<td><form method="post">
							<button formaction="userHome.jsp"
								style="background-color: black; color: white;">Cancel</button>
						</form></td>
					<td colspan="2" align="center"><form method="post">
							<button style="background-color: blue; color: white;"
								formaction="payment.jsp?amount=<%=totAmount%>">Pay Now</button>
						</form></td>
</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<!-- ENd of Product Items List -->

<%@ include file="Footer.jsp" %>

</body>
</html>