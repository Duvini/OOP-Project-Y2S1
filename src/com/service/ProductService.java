package com.service;

import java.io.InputStream;

import java.util.List;

import com.model.Product;

public interface ProductService {
	
	public String addProduct(String prodName, double prodPrice, int prodQuantity, String prodType,String prodSubtype, InputStream prodImage , int pstock,String description);

	public String addProduct(Product product);
	
	public List<Product> getAllProducts();
	public byte[] getImage(String prodId);
	public String updateProduct(String prevProduct, Product updatedProduct);
	public String updateProductWithoutImage(String prevProductId, Product updatedProduct);
	public Product getProductDetails(String prodId);
	public String updateProductPrice(String prodId, double updatedPrice);
	public String removeProduct(String prodId);
	public String setdescription(String description);
	public void setpstock(int pstock);
	public int getpstock();
	

}
