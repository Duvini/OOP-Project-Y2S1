package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import com.customer.*;
import com.model.*;
import com.util.*;
import com.service.*;



@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strid = request.getParameter("id");
		int id = Integer.parseInt(strid);
		String pid = request.getParameter("pid");
		int pQty = Integer.parseInt(request.getParameter("pquantity")); // 1

		cartServiceImpl carts = new cartServiceImpl();

		ProductServiceImpl productDao = new ProductServiceImpl();

		Product product = productDao.getProductDetails(pid);

		int availableQty = product.getProdQuantity();

		int cartQty = carts.getProductCount(id, pid);

		pQty += cartQty;

		PrintWriter pw = response.getWriter();

		response.setContentType("text/html");
		if (pQty == cartQty) {
			String status = carts.removeProductFromCart(id, pid);

			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");

			rd.include(request, response);

			pw.println("<script>document.getElementById('message').innerHTML='" + status + "'</script>");
		} else if (availableQty < pQty) {

			String status = null;

			if (availableQty == 0) {
				status = "Product is Out of Stock!";
			} else {

				carts.updateProductToCart(id, pid, availableQty);

				status = "Only " + availableQty + " no of " + product.getProdName()
						+ " are available in the shop! So we are adding only " + availableQty
						+ " products into Your Cart" + "";
			}
			

		
			RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");

			rd.include(request, response);

			pw.println("<script>document.getElementById('message').innerHTML='" + status + "'</script>");

		} else {
			String status = carts.updateProductToCart(id, pid, availableQty);

			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");

			rd.include(request, response);

			pw.println("<script>document.getElementById('message').innerHTML='" + status + "'</script>");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}