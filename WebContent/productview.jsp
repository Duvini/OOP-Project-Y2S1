
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
<%@ page import="java.util.*,com.model.*,java.util.*,com.service.*,java.util.*,com.util.*,java.util.*,com.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
 <link rel="icon" href="images/babyl.jpg" type="image/png" >
<title>Product Stocks</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> 
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style>
	input,
button,
select,
textarea {
  font-family: inherit;
  font-size: inherit;
  line-height: inherit;
  color:black;
}
 link[rel="icon"] {
    border-radius: 50%;
  }
	</style>
	
</head>
<%@include file="sidepane.jsp" %>
<div class="main-content">
<body style="background-color: #C9DFD6;">
 
<div class="text-center"
     style="color:  black; font-size: 34px; font-weight: bold;margin-left:120px; margin-top: 20px;">Product Management System

    <a class="btn btn-success pull-right" style="margin-right: 20px;margin-top: 135px; color:black;" href="AddProduct.jsp">
       + Add Products
    
    </a>
    
      
   
</div>

<div class="btn btn-success pull-right" style="margin-right: 30px;margin-top: 84px;">
   <form action="<%= request.getRequestURI() %>" method="GET" >
    <input type="text" name="query" placeholder="Search products" value="${param.query}" >
    <button type="submit" >Search</button>
</form>
</div>

<div class="btn btn-success pull-right" style="margin-right: 20px;margin-top: 84px;">
  <form action="<%= request.getRequestURI() %>"method="GET">
        <input type="hidden" name="showAll" value="false">
        <button type="submit" name="showAll" class=value="true">Show All Products</button>
    </form>
</div>


	<div class="text-center"
		style="color:  black; font-size: 24px; font-weight: bold;margin-top:90px">Stock
		Products</div>
	<div class="container-fluid">
		<div class="table-responsive ">
			<table class="table table-hover table-sm" style="margin-top:20px">
				<thead
					style="background-color:#C69064 ; color: white; font-size: 18px;">
					<tr>
						<th>Image</th>
						<th>Code   </th>
						<th>Name</th>
						<th>Price</th>
						<th>Stock Qty</th>
						<th>Category</th>
						<th>Sub-Category</th>
						<th>Sold Qty</th>
						<th colspan="2" style="text-align: center">Actions</th>
						<th></th>
					</tr>
				</thead>
				<tbody style="background-color: #F3F1EC; font-size: 16px;">


					<%
					    String query = request.getParameter("query");
					
					  if (query != null && !query.isEmpty()) {
					        
						  ProductServiceImpl dao = new ProductServiceImpl();
						  List<Product> products=dao.searchProduct(query);
						  
							for (Product product : products){
								%>
								
								<tr>
								    <td><img src="./ShowImages?pid=<%=product.getProdId() %>"
								            style="width: 10 0px; height: 100px;"></td>
								            
								    <td><%=product.getProdId() %></td>
								    <%
								    String name = product.getProdName();
								    name = name.substring(0, Math.min(name.length(), 25)) ;
								    %>
								    <td><%=name %></td>
								    <td><%=product.getProdPrice() %></td>
								    <td><%=product.getProdQuantity() %></td>
								    <td><%=product.getProdType() %></td>
								    <td><%=product.getProdSubtype() %></td>
								    <td><%=product.getpstock() %></td>
								    <td></td>
								    <td>
								    	<form method="post">
								        
								            <button type="submit" class="btn btn-primary" formaction ="updateProduct.jsp?prodid=<%=product.getProdId()%>"
								                   style="background-color: #4ABDAC" >Update
								                 
								      </button>
								      </form>
								    </td>
								    <td>
								   		<form method="post">
								             <button type="submit" class="btn btn-primary" formaction ="Remove.jsp?prodid=<%=product.getProdId() %>"
								                   style="background-color: #DC143C">Remove
								            </button>
								           </form>
								    </td>
								</tr>
								<%
								}
								%>
								
						<% 
						   
						
						 if (products.isEmpty()) { %>
					    <tr>
					        <td colspan="10" style="text-align: center;">No items are matched</td>
					    </tr>
					<% } %>

						 
					 

							
						  
						  
						  <% 
					    }else{
					
					
						ProductServiceImpl productDao =new ProductServiceImpl();
						List<Product> products =new ArrayList<Product>();
						products =productDao.getAllProducts();
						for (Product product : products){
					%>
					
					<tr>
					    <td><img src="./ShowImages?pid=<%=product.getProdId() %>"
					            style="width: 10 0px; height: 100px;"></td>
					            
					    <td><%=product.getProdId() %></td>
					    <%
					    String name = product.getProdName();
					    name = name.substring(0, Math.min(name.length(), 25)) ;
					    %>
					    <td><%=name %></td>
					    <td><%=product.getProdPrice() %></td>
					    <td><%=product.getProdQuantity() %></td>
					    <td><%=product.getProdType() %></td>
					    <td><%=product.getProdSubtype() %></td>
					    <td><%=product.getpstock() %></td>
					    <td></td>
					    <td>
					    	<form method="post">
					        
					            <button type="submit" class="btn btn-primary" formaction ="updateProduct.jsp?prodid=<%=product.getProdId()%>"
					                   style="background-color: #5cb85c" >Update
					                 
					      </button>
					      </form>
					    </td>
					    <td>
					   		<form method="post">
					             <button type="submit" class="btn btn-primary" formaction ="Remove.jsp?prodid=<%=product.getProdId() %>"
					                   style="background-color: #DC143C">Remove
					            </button>
					           </form>
					    </td>
					</tr>
					<%
					}
					%>

					<%
					if (products.size() == 0) {
					%>
					<tr style="background-color: grey; color: white;">
						<td colspan="10" style="text-align: center;">No Items
							Available</td>

					</tr>
					<%
					}
					%>
					
					
					<%
                    if (products.isEmpty()) {
                    %>
                    <tr style="background-color: grey; color: white;">
                        <td colspan="10" style="text-align: center;">No Items Available</td>
                    </tr>
                    <%
                    }}
                    %>
					
				</tbody>
			</table>
		</div>
	</div>

	
</div>
</body>
</html>