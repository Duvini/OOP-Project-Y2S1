package com.service;

import java.io.InputStream;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.model.Product;
import com.util.DBConnect;
import com.util.IDUtil;

public class ProductServiceImpl implements ProductService {
	
	
@Override
public String addProduct(String prodName, double prodPrice, int prodQuantity, String prodType,String prodSubtype, InputStream prodImage ,int pstock,String description) {
		String status = null;
		System.out.println("Debug: prodName=" + prodName);
	    System.out.println("Debug: prodPrice=" + prodPrice);
	    System.out.println("Debug: prodQuantity=" + prodQuantity);
	    System.out.println("Debug: prodType=" + prodType);
	    System.out.println("Debug: prodSubtype=" + prodSubtype);
	    System.out.println("Debug: description=" + description);
	    System.out.println("Debug: pstock=" + pstock);
		String prodId = IDUtil.generateId();
		System.out.println("Debug: prodId="+ prodId);
		Product product = new Product(prodId,prodName,prodPrice,  prodQuantity,  prodType, prodSubtype,  prodImage,pstock,description);
		status=addProduct(product);
		


	return status;
}

@Override
public String addProduct(Product product) {
	String status = null;
    Connection con = null;
    PreparedStatement pstmt = null;
    
    try {
        con = DBConnect.getConnection();
        String sql = "INSERT INTO productmanagement (pid, pname, pprice, pquantity, ptype, psubtype, image,pstock,description) VALUES (?, ?, ?, ?, ?, ?, ?,?,?) ";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, product.getProdId());
        pstmt.setString(2, product.getProdName());
        pstmt.setDouble(3, product.getProdPrice());
        pstmt.setInt(4, product.getProdQuantity());
        pstmt.setString(5, product.getProdType());
        pstmt.setString(6, product.getProdSubtype());
        pstmt.setBlob(7, product.getProdImage());
        pstmt.setInt(8, product.getpstock());
        pstmt.setString(9,product.getDescription());
        
        
        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            status = "Product Added Successfully with Product Id: " + product.getProdId();
        } else {
    	status="null";
    }
    
}catch (SQLException e) {
        	status = "Error: " + e.getMessage();
            e.printStackTrace();
            System.out.println("Error:"+status);
           } 
        
   
    return status;
}

@Override
public List<Product> getAllProducts(){
	List<Product> products =new ArrayList<Product>();
	Connection con = DBConnect.getConnection();
	
	PreparedStatement ps=null;
	ResultSet rs =null;
	
	try {
		ps=con.prepareStatement("SELECT * FROM productmanagement");
		rs =ps.executeQuery();
		
		while (rs.next()) {
			Product product = new Product();
			
			product.setProdId(rs.getString(1));
			product.setProdName(rs.getString(2));
			product.setProdPrice(rs.getDouble(3));
			product.setProdQuantity(rs.getInt(4));
			product.setProdType(rs.getString(5));
			product.setProdSubtype(rs.getString(6));
			product.setProdImage(rs.getAsciiStream(7));
			product.setpstock(rs.getInt(8));
			product.setDescription(rs.getString(9));;
			
			products.add(product);
			
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return products;
	
}
public List<Product> getFoodProducts() {
    List<Product> allProducts = getAllProducts(); // Assuming getAllProducts() fetches all products

    // Filter the list to only include food products
    List<Product> foodProducts = new ArrayList<>();
    for (Product product : allProducts) {
        if (product.getProdType().equals("Food")) {
        	            foodProducts.add(product);
        }
    }

    return foodProducts;
}

public List<Product> getSanitaryProducts() {
    List<Product> allProducts = getAllProducts(); // Assuming getAllProducts() fetches all products

    // Filter the list to only include food products
    List<Product> sanProducts = new ArrayList<>();
    for (Product product : allProducts) {
        if (product.getProdType().equals("Sanitary")) {
        	            sanProducts.add(product);
        }
    }

    return sanProducts;
}


public List<Product> getEquipProducts() {
    List<Product> allProducts = getAllProducts(); // Assuming getAllProducts() fetches all products

    // Filter the list to only include food products
    List<Product> equipProducts = new ArrayList<>();
    for (Product product : allProducts) {
        if (product.getProdType().equals("Equipment")) {
        	            equipProducts.add(product);
        }
    }

    return equipProducts;
}

@Override
public byte[] getImage(String prodId) {
	byte[] image = null;

	Connection con = DBConnect.getConnection();

	PreparedStatement ps = null;
	ResultSet rs = null;

	try {
		ps = con.prepareStatement("select image from productmanagement where  pid=?");

		ps.setString(1, prodId);

		rs = ps.executeQuery();

		if (rs.next())
			image = rs.getBytes("image");

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("image in "+image);
	return image;

}
@Override
public String updateProduct(String prevProduct, Product updatedProduct) {
	String status = "null";

	if (!prevProduct.equals(updatedProduct.getProdId())) {

		status = "Both Products are Different, Updation Failed!";

		return status;
	}

	Connection con = DBConnect.getConnection();

	PreparedStatement ps = null;

	try {
		ps = con.prepareStatement(
				"update productmanagement set pname=?,pprice=?,pquantity=?,ptype=?,psubtype=?,image=?,description=? where pid=?");

		   
	        ps.setString(1, updatedProduct.getProdName());
	        ps.setDouble(2, updatedProduct.getProdPrice());
	        ps.setInt(3, updatedProduct.getProdQuantity());
	        ps.setString(4, updatedProduct.getProdType());
	        ps.setString(5, updatedProduct.getProdSubtype());
	        ps.setBlob(6, updatedProduct.getProdImage());
	        ps.setString(8,updatedProduct.getProdId() );
	        ps.setString(7,updatedProduct.getDescription());

		int k = ps.executeUpdate();
		
		   System.out.println("Generated SQL Query: " + ps.toString());
if (k > 0)
			status = "Product Updated Successfully!";

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	

	return status;
}
@Override
public String updateProductWithoutImage(String prevProductId, Product updatedProduct) {
	String status = "Product Updation Failed!";

	if (!prevProductId.equals(updatedProduct.getProdId())) {

		status = "Both Products are Different, Updation Failed!";

		return status;
	}
	Connection con = DBConnect.getConnection();
	PreparedStatement ps = null;

	try {
		ps = con.prepareStatement("update productmanagement set  pname=?,pprice=?,pquantity=?,ptype=?,psubtype=?,description=? where pid=?");

			ps.setString(1, updatedProduct.getProdName());
	        ps.setDouble(2, updatedProduct.getProdPrice());
	        ps.setInt(3, updatedProduct.getProdQuantity());
	        ps.setString(4, updatedProduct.getProdType());
	        ps.setString(5, updatedProduct.getProdSubtype());
	        ps.setString(6,updatedProduct.getDescription());
	        ps.setString(7, prevProductId);
	        

		int k = ps.executeUpdate();
		 if (k > 0)
		status = "Product Updated Successfully!";
	else
		status = null;

} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	return status;
}

@Override
public Product getProductDetails(String prodId) {
	Product product = null;

	Connection con = DBConnect.getConnection();

	PreparedStatement ps = null;
	ResultSet rs = null;

	try {
		ps = con.prepareStatement("select * from productmanagement where pid=?");
		   ps.setString(1, prodId);
	
		
		
		rs = ps.executeQuery();
		

		if (rs.next()) {
			product = new Product();
			
			product.setProdId(rs.getString(1));
			product.setProdName(rs.getString(2));
			product.setProdPrice(rs.getDouble(3));
			product.setProdQuantity(rs.getInt(4));
			product.setProdType(rs.getString(5));
			product.setProdSubtype(rs.getString(6));
			product.setProdImage(rs.getAsciiStream(7));
			product.setDescription(rs.getString(9));
		}

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return product;
}


@Override
public String updateProductPrice(String prodId, double updatedPrice) {
	String status = "Price Updation Failed!";

	Connection con = DBConnect.getConnection();

	PreparedStatement ps = null;

	try {
		ps = con.prepareStatement("update productmanagement set pprice=? where pid=?");

		ps.setDouble(1, updatedPrice);
		ps.setString(2, prodId);

		int k = ps.executeUpdate();

		if (k > 0)
			status = "Price Updated Successfully!";
	} catch (SQLException e) {
		status = "Error: " + e.getMessage();
		e.printStackTrace();
	}


	return status;
}
@Override
public String removeProduct(String prodId) {
	String status = "Product Removal Failed!";

	Connection con = DBConnect.getConnection();

	PreparedStatement ps = null;
	PreparedStatement ps2 = null;

	try {
		ps = con.prepareStatement("delete from productmanagement where pid=?");
		ps.setString(1, prodId);

		int k = ps.executeUpdate();

		if (k > 0) {
			status = "Product Removed Successfully!";


		}

	} catch (SQLException e) {
		status = "Error: " + e.getMessage();
		e.printStackTrace();
	}
	return status;
}



@Override
public String setdescription(String description) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public void setpstock(int pstock) {
	// TODO Auto-generated method stub
	
}

@Override
public int getpstock() {
	// TODO Auto-generated method stub
	return 0;
}



public List<Product> searchProduct(String query) {
    List<Product> products = new ArrayList<>();
    Connection con = DBConnect.getConnection();
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // Define the SQL query for searching across multiple columns
        String sql = "SELECT * FROM productmanagement " +
                     "WHERE pid LIKE ? OR pname LIKE ? OR pprice LIKE ? OR " +
                     "ptype LIKE ? OR psubtype LIKE ? OR description LIKE ?";

        ps = con.prepareStatement(sql);

        // Set the query parameter for each column
        String likeParameter = "%" + query + "%";
        for (int i = 1; i <= 6; i++) {
            ps.setString(i, likeParameter);
        }

        rs = ps.executeQuery();

        while (rs.next()) {
            Product product = new Product();

            product.setProdId(rs.getString(1));
            product.setProdName(rs.getString(2));
            product.setProdPrice(rs.getDouble(3));
            product.setProdQuantity(rs.getInt(4));
            product.setProdType(rs.getString(5));
            product.setProdSubtype(rs.getString(6));
            product.setProdImage(rs.getAsciiStream(7));
            product.setpstock(rs.getInt(8));
            product.setDescription(rs.getString(9));

            products.add(product);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Close resources in the reverse order of their creation
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    return products;
}

public List<Product> sortbytype(String type){
	
	
	 List<Product> products = new ArrayList<>();
	    Connection con = DBConnect.getConnection();
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    try {
	        // Define the SQL query for searching across multiple columns
	    	String sql ="SELECT * FROM products WHERE product_type IN ('food', 'sanitary & hygiene', 'equipments')";


	        ps = con.prepareStatement(sql);

	        rs = ps.executeQuery();

	        while (rs.next()) {
	            Product product = new Product();

	            product.setProdId(rs.getString(1));
	            product.setProdName(rs.getString(2));
	            product.setProdPrice(rs.getDouble(3));
	            product.setProdQuantity(rs.getInt(4));
	            product.setProdType(rs.getString(5));
	            product.setProdSubtype(rs.getString(6));
	            product.setProdImage(rs.getAsciiStream(7));
	            product.setpstock(rs.getInt(8));
	            product.setDescription(rs.getString(9));

	            products.add(product);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Close resources in the reverse order of their creation
	        if (rs != null) {
	            try {
	                rs.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (ps != null) {
	            try {
	                ps.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }

	    return products;
	
	
}

}




