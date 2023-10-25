<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
    <%@ page import="java.util.*,com.model.*,java.util.*,com.service.*,java.util.*,com.util.*,java.util.*,com.servlet.*"%>
    
    
<!DOCTYPE html>
<html>
<head>
 <link rel="icon" href="images/babyl.jpg" type="image/png" >
<meta charset="ISO-8859-1">
			<title>Update Product</title>
			<style>
			/* Reset default margin and padding */
			* {
			    margin: 0;
			    padding: 0;
			    box-sizing: border-box;
			}
			
			/* Body background color */
			body {
			    background-color: #F3F1EC;
			    font-family: Arial, sans-serif;
			    margin-top:8%;
			    margin-bottom:8%;
			}
			
			/* Form container */
			form {
			    max-width: 400px;
			    margin: 0 auto;
			    padding: 20px;
			    background-color: #CEE0D8;
			    border-radius: 10px;
			    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
			}
			
			/* Form headings */
			h1, h2 {
			    color: #39599E;
			    text-align: center;
			    margin-bottom: 20px;
			}
			
			/* Form labels */
			label {
			    color: #00000;
			    display: block;
			    margin-bottom: 5px;
			}
			
			/* Text input fields */
			input {
			    width: 100%;
			    padding: 10px;
			    margin-bottom: 10px;
			    border: 1px solid #C69064;
			    border-radius: 5px;
			    color: #39599E;
			}
			
			/* Select dropdown */
			select {
			    width: 100%;
			    padding: 10px;
			    margin-bottom: 10px;
			    border: 1px solid #C69064;
			    border-radius: 5px;
			    color: #39599E;
			}
			
			
			
			/* Submit button */
			button[type="submit"] {
			    background-color:#a3e8cc;
			    color: #00000;
			    border: none;
			    padding: 10px 20px;
			    border-radius: 5px;
			    cursor: pointer;
			    font-size: 16px;
			    transition: background-color 0.3s;
			}
			
			button[type="submit"]:hover {
			    background-color: #e5bca7;
			}
</style>
</head>
<body>
    <%
    String prodid = request.getParameter("prodid");
    System.out.println("prodId from URL: " + prodid);
    Product product = new ProductServiceImpl().getProductDetails(prodid);
    System.out.println("products are: " + product);
        if (prodid == null || product == null) {
            response.sendRedirect("updateProductById.jsp?message=Please Enter a valid product Id");
        } else {
            String prodName = product.getProdName();
            double prodPrice = product.getProdPrice();
            int prodQuantity = product.getProdQuantity();
            String prodType = product.getProdType();
            String prodSub =product.getProdSubtype();
            String proddescription=product.getDescription();
    
   
    
    %>
    <form action="./update"  method="get" enctype="multipart/form-data" onsubmit="return validateForm();">
        <h2 style="color: green;">Product Update Form</h2>
	<img src="./ShowImages?pid=<%=product.getProdId() %>"
					            style="width: 10 0px; height: 100px;">
        <!-- Hidden input field for product ID -->
        <input type="hidden" id="pid" name="pid" value="<%= prodid %>"><br>
        
           
        <!-- Text field to enter product name -->
        <label for="pname">Product Name:</label>
        <input type="text" id="pname" name="pname" value="<%= prodName %>"><br>

        <!-- Text field to enter product price -->
        <label for="pprice">Product Price (LKR):</label>
        <input type="text" id="pprice" name="pprice" value="<%= prodPrice %>"><br>

        <!-- Text field to enter product quantity -->
        <label for="pquantity">Quantity:</label>
        <input type="number" id="pquantity" name="pquantity" value="<%= prodQuantity %>"><br>
		<!-- Text area for product description -->
   		<label for="description">Description:</label>
    	<input type="text" name="description" value="<%= proddescription %>"><br>
        <!-- Select category -->
        <label for="ptype">Category:</label>
        <select id="ptype" name="ptype">
            <option value="Food" <%= "Food".equalsIgnoreCase(prodType) ? "selected" : "" %>>Food</option>
            <option value="Sanitary" <%= "Sanitary".equalsIgnoreCase(prodType) ? "selected" : "" %>>Sanitary & Hygiene</option>
            <option value="Equipment" <%= "Equipment".equalsIgnoreCase(prodType) ? "selected" : "" %>>Equipment</option>
        </select><br>
        
         <label for="pquantity">Subtype</label>
        <input type="text" id="pquantity" name="subType" value="<%= prodSub %>"><br>

        <!--  <button type="submit">Update Product</button> -->
        
		
        <div class="col-md-6 text-center">
            <button type="submit" class="btn btn-danger">Update Product</button>
             <button type="submit" class="btn btn-danger" onclick="cancelUpdate()">Cancel</button>
		</div>


        
        
   
    </form>
    <%
        }
    %>
</body>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    function cancelUpdate() {
        // Use JavaScript to navigate back to the productview.jsp page
        window.location.href = "productview.jsp";
    }
 // Function to validate non-negative price and quantity
    
    function validateForm() {
        var price = parseFloat(document.getElementById("pprice").value);
        var quantity = parseInt(document.getElementById("pquantity").value);

        if (isNaN(price) || price < 0) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Price must be a non-negative value.',
            });
            return false;
        }

        if (isNaN(quantity) || quantity < 0) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Quantity must be a non-negative value.',
            });
            return false;
        }

        return true;
    }
</script>
</html>