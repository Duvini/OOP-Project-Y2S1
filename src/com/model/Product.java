package com.model;

import java.io.InputStream;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Product  implements Serializable{

	public Product(){
		
	}
	private String prodId;
	private String prodName;
	private double prodPrice;
	private int prodQuantity;
	private String prodType;
	private String prodSubtype;
	private InputStream prodImage;
	private int pstock;
	private String description;
	
	public Product(String prodId, String prodName, double prodPrice, int prodQuantity, String prodType,String prodSubtype, InputStream prodImage,int pstock,String description) {
		super();
		this.prodId = prodId;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodQuantity = prodQuantity;
		this.prodType = prodType;
		this.prodSubtype = prodSubtype;
		this.prodImage = prodImage;
		this.pstock = pstock;
		this.description=description;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public double getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(double prodPrice) {
		this.prodPrice = prodPrice;
	}

	public int getProdQuantity() {
		return prodQuantity;
	}

	public void setProdQuantity(int prodQuantity) {
		this.prodQuantity = prodQuantity;
	}

	public String getProdType() {
		return prodType;
	}

	public void setProdType(String prodType) {
		this.prodType = prodType;
	}

	public String getProdSubtype() {
		return prodSubtype;
	}

	public void setProdSubtype(String prodSubtype) {
		this.prodSubtype = prodSubtype;
	}

	public InputStream getProdImage() {
		return prodImage;
	}
	public int getpstock() {
		return pstock;
	}
	public void setpstock(int pstock) {
		
		this.pstock=pstock;
	}

	public void setProdImage(InputStream prodImage) {
		this.prodImage = prodImage;
	}
	
	public void setDescription(String description) {
		this.description =description;
	}
	public String getDescription(){
		
		return description;
	}
	
}
