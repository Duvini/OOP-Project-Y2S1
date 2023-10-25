<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
 <link rel="icon" href="images/babyl.jpg" type="image/png" >
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
		
		/* File input for image upload */
		input[type="file"] {
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
	String message = request.getParameter("message");
	%>
<form action="insert" method="post" enctype="multipart/form-data"  onsubmit="return validateForm();">

        
        <!-- Text field to enter product name -->
        <label for="pname">Product Name:</label>
        <input type="text" id="pname" name="pname" required placeholder="Enter Product name"><br>

		   <!-- Text field to enter product price -->
        <label for="price">Product Price:(LKR)</label>
        <input type="text" id="price" name="pprice" required placeholder="Enter Product price"><br>
        
        <!-- Text field to enter product quantity -->
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="pquantity" required placeholder="Enter Quantity"><br>
        
         <label for="quantity">Description:</label>
        <input type="text" id="description" name="pdescription" required placeholder="Enter Description"><br>

		  <label for="quantity">Stock Quantity:</label>
        <input type="number" id="pstock" name="pstock" required placeholder="Enter Stock Quantity"><br>

        <!-- Select category -->
        <label for="categories">Category:</label>
        <select id="categories" name="ptype" required>
            <option value="Food">Food</option>
            <option value="Sanitary">Sanitary & Hygiene</option>
            <option value="Equipment">Equipment</option>
        </select><br>

        <!-- Select sub-category based on the chosen category -->
        <label for="subcategories">Sub-category:</label> 
        <select id="subcategories" name="psubtype" required>
            <!-- Options will be populated dynamically based on the selected category using JavaScript -->
        </select><br>

        <!-- Upload product images -->
        <label for="fileToUpload">Upload Product Images:</label>
        <input type="file" id="fileToUpload" name="image"   required><br>
        
        <!-- Add new product submit button -->
        <button type="submit">Add New Product</button>
        </form>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <script>
    // JavaScript code to populate subcategories based on the selected category
    document.getElementById("categories").addEventListener("change", function() {
        var selectedCategory = this.value;
        var subcategoriesSelect = document.getElementById("subcategories");
        subcategoriesSelect.innerHTML = ""; // Clear existing options
        
        // Define subcategories based on the selected category
        var subcategories = {};
        subcategories.Food = ["Age 6 months - 1 year", "Age 1 - 3 years", "Age 3 - 5 years"];
        subcategories.Sanitary = ["Napkins", "Bathing", "Colognes & Creams"];
        subcategories.Equipment = ["Bedding", "Other", "Storing"];
        
        // Populate subcategories dropdown based on the selected category
        if (subcategories[selectedCategory]) {
            subcategories[selectedCategory].forEach(function(subcategory) {
                var option = document.createElement("option");
                option.text = subcategory;
                option.value = subcategory;
                subcategoriesSelect.appendChild(option);
            });
        }
    });
 // Function to validate non-negative price and quantity
   
    function validateForm() {
        var price = parseFloat(document.getElementById("price").value);
        var quantity = parseInt(document.getElementById("quantity").value);

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







        
</body>
</html>