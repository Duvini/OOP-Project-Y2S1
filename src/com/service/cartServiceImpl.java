package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.*;
import com.util.*;

public class cartServiceImpl implements cartService {
	@Override
	public String addProductToCart(int id,String pid,int pquantity) {
		String status = "Failed to Add into Cart";

		Connection con = DBConnect.getConnection();

		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from cart where id=? and pid=?");

			ps.setInt(1, id);
			ps.setString(2, pid);

			rs = ps.executeQuery();
if (rs.next()) {

		int cartQuantity = rs.getInt("quantity");

				Product product = new ProductServiceImpl().getProductDetails(pid);

				int availableQty = product.getProdQuantity();

				pquantity += cartQuantity;
				//
				if (availableQty <pquantity) {

					status = updateProductToCart(id, pid, availableQty);

					status = "Only " + availableQty + " no of " + product.getProdName()
							+ " are available in the shop! So we are adding only " + availableQty
+ " no of that item into Your Cart" + "";

					
				} else {
					status = updateProductToCart(id, pid, pquantity);

				}
			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}
		return status;
	
	

}

	@Override
	public String updateProductToCart(int id, String pid, int pquantity) {
		String status = "Failed to Add into Cart";

		Connection con = DBConnect.getConnection();

		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from cart where id=? and pid=?");

			ps.setInt(1, id);
			ps.setString(2, pid);

			rs = ps.executeQuery();

			if (rs.next()) {

				if (pquantity > 0) {
					ps2 = con.prepareStatement("update cart set pquantity=? where id=? and pid=?");

					ps2.setInt(1, pquantity);

					ps2.setInt(2, id);

					ps2.setString(3, pid);
int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product Successfully Updated to Cart!";
				} else if (pquantity== 0) {
					ps2 = con.prepareStatement("delete from usercart where username=? and prodid=?");

					ps2.setInt(1, id);

					ps2.setString(2, pid);

					int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product Successfully Updated in Cart!";
				}
			} else {

				ps2 = con.prepareStatement("insert into cart values(?,?,?)");

				ps2.setInt(1, id);

				ps2.setString(2, pid);

				ps2.setInt(3, pquantity);

				int k = ps2.executeUpdate();
if (k > 0)
					status = "Product Successfully Updated to Cart!";

			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}


		return status;
		
	}
		

	@Override
	public List<cart> getAllCartItems(int id) {
		List<cart> items = new ArrayList<cart>();

		Connection con = DBConnect.getConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from cart where id=?");

			ps.setInt(1, id);

			rs = ps.executeQuery();

			while (rs.next()) {
				cart cart = new cart();
				
				cart.setId(Integer.parseInt(rs.getString("id")));
				cart.setPid(rs.getString("pid"));
				cart.setPquantity(Integer.parseInt(rs.getString("pquantity")));

				items.add(cart);

			}
} catch (SQLException e) {

			e.printStackTrace();
		}


		return items;
	}

	@Override
	public int getCartCount(int id) {
		int count = 0;

		Connection con = DBConnect.getConnection();


		PreparedStatement ps = null;

		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select sum(quantity) from cart where id=?");

			ps.setInt(1, id);

			rs = ps.executeQuery();

			if (rs.next() && !rs.wasNull())
				count = rs.getInt(1);

		} catch (SQLException e) {

			e.printStackTrace();
		}


		return count;
	}

	@Override
	public int getCartItemCount(int id, String pid) {
		int count = 0;
		if (id == 0|| pid == null)
			return 0;
		Connection con = DBConnect.getConnection();

		PreparedStatement ps = null;

		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select pquantity from cart where id=? and pid=?");

			ps.setInt(1, id);
			ps.setString(2, pid);

			rs = ps.executeQuery();

			if (rs.next() && !rs.wasNull())
				count = rs.getInt(1);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return count;
	}

	@Override
	public String removeProductFromCart(int id, String pid) {
		String status = "Product Removal Failed";

		Connection con = DBConnect.getConnection();

		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from usercart where id=? and pid=?");

			ps.setInt(1, id);
			ps.setString(2, pid);

			rs = ps.executeQuery();

			if (rs.next()) {

				int prodQuantity = rs.getInt("pquantity");

				prodQuantity -= 1;
if (prodQuantity > 0) {
					ps2 = con.prepareStatement("update cart set pquantity=? where id=? and pid=?");

					ps2.setInt(1, prodQuantity);

					ps2.setInt(2, id);

					ps2.setString(3, pid);

					int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product Successfully removed from the Cart!";
				} else if (prodQuantity <= 0) {

					ps2 = con.prepareStatement("delete from cart where id=? and pid=?");

					ps2.setInt(1, id);

					ps2.setString(2, pid);

					int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product Successfully removed from the Cart!";
				}
} else {

				status = "Product Not Available in the cart!";

			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}


		return status;
	}
	@Override
	public boolean removeAProduct(int id, String pid) {
		boolean flag = false;

		Connection con = DBConnect.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("delete from cart where id=? and pid=?");
			ps.setInt(1, id);
			ps.setString(2, pid);

			int k = ps.executeUpdate();

			if (k > 0)
				flag = true;

		} catch (SQLException e) {
			flag = false;
			e.printStackTrace();
		}


		return flag;
	}
	public int getProductCount(int id, String pid) {
		int count = 0;

		Connection con = DBConnect.getConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select sum(pquantity) from cart where id=? and pid=?");
			ps.setInt(1, id);
			ps.setString(2, pid);
			rs = ps.executeQuery();

			if (rs.next() && !rs.wasNull())
				count = rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}


	
	
	
}
