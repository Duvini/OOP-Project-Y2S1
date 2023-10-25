package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Product;
import com.service.ProductServiceImpl;

/**
 * Servlet implementation class ProductUpdateSrv
 */
@WebServlet("/ProductUpdateSrv")
public class ProductUpdateSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateSrv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	        String productId = request.getParameter("pid");
	        String productName = request.getParameter("pname");
	        String productPriceStr = request.getParameter("pprice");
	        String productQuantityStr = request.getParameter("pquantity");
	        String productType = request.getParameter("ptype");
	        String productSubType =request.getParameter("subType");
	        String productDes=request.getParameter("description");

	        // Convert the string values to their respective data types
	        double productPrice = Double.parseDouble(productPriceStr);
	        int productQuantity = Integer.parseInt(productQuantityStr);
	        
	        Product product = new Product ();
	        product.setProdId(productId);
	        product.setProdName(productName);
	        product.setProdPrice(productPrice);
	        product.setProdQuantity(productQuantity);
	        product.setProdType(productType);
	        product.setProdSubtype(productSubType);
	        product.setDescription(productDes);
	        
	        ProductServiceImpl dao = new ProductServiceImpl();

			String status = dao.updateProductWithoutImage(productId, product);
			
			if(status!=null) {
	        	RequestDispatcher dis=request.getRequestDispatcher("success.jsp?message="+status);
	        	dis.forward(request, response);
	        }else {
	        	RequestDispatcher dis2 =request.getRequestDispatcher("unsuccess.jsp?message="+status);
	        	dis2.forward(request, response);
	        }
}
	}
