package com.service;

import java.util.List;

import com.model.cart;

public interface cartService {
	
	public String addProductToCart(int id,String pid,int pquantity);
	
	public String updateProductToCart(int id,String pid,int pquantity);

	public List<cart> getAllCartItems(int id);

	public int getCartCount(int id);

	public int getCartItemCount(int id, String pid);

	public String removeProductFromCart(int id, String pid);

	public boolean removeAProduct(int id, String pid);

	

	

}
