package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ProductServiceImpl;

/**
 * Servlet implementation class RemoveProducts
 */
@WebServlet("/RemoveProducts")
public class RemoveProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prodId = request.getParameter("prodid");

		ProductServiceImpl product = new ProductServiceImpl();

		String status = product.removeProduct(prodId);

		if(status!=null) {
        	RequestDispatcher dis=request.getRequestDispatcher("success.jsp?message="+status);
        	dis.forward(request, response);
        }else {
        	RequestDispatcher dis2 =request.getRequestDispatcher("unsuccess.jsp?message="+status);
        	dis2.forward(request, response);
        }
        
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
