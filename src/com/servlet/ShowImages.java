 package com.servlet;


import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ProductServiceImpl;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

@WebServlet("/ShowImages")
public class ShowImages extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShowImages() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String prodId = request.getParameter("pid");

		ProductServiceImpl dao = new ProductServiceImpl();

		byte[] image = dao.getImage(prodId);
		System.out.println("image"+image);

		if (image == null) {
			File fnew = new File(request.getServletContext().getRealPath("images/noimage.jpg"));
			BufferedImage originalImage = ImageIO.read(fnew);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(originalImage, "jpg", baos);
			image = baos.toByteArray();
		}

		ServletOutputStream sos = null;

		sos = response.getOutputStream();

		sos.write(image);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}