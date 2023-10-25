package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.service.ProductServiceImpl;

@WebServlet("/AddProductSrvlt")
@MultipartConfig(maxFileSize = 16177215)
public class AddProductSrvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = "Product Registration Failed!";
		
		
		String prodName = request.getParameter("pname");
		double prodPrice = Double.parseDouble(request.getParameter("pprice"));
		int prodQuantity = Integer.parseInt(request.getParameter("pquantity"));
		String prodType = request.getParameter("ptype");
		String prodSubtype = request.getParameter("psubtype");
		Part part = request.getPart("image");
		String description = request.getParameter("pdescription");
		int pstock = Integer.parseInt(request.getParameter("pstock")); 

		InputStream inputStream = part.getInputStream();

		InputStream prodImage = inputStream;

		  ProductServiceImpl product = new ProductServiceImpl();

	      status = product.addProduct(prodName, prodPrice, prodQuantity, prodType, prodSubtype, prodImage,pstock,description);


	       if(status!=null) {
	        	RequestDispatcher dis=request.getRequestDispatcher("success.jsp?message="+status);
	        	dis.forward(request, response);
	        }else {
	        	RequestDispatcher dis2 =request.getRequestDispatcher("unsuccess.jsp?message="+status);
	        	dis2.forward(request, response);
	        }
	        
	    }

	}
	
