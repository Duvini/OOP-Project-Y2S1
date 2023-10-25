package com.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class cart implements Serializable{
	
	public cart() {
		
	}
	
	public int id;
	public String pid;
	public int pquantity;
	
	public cart(int id, String pid, int pquantity) {
		super();
		this.id = id;
		this.pid = pid;
		this.pquantity = pquantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public int getPquantity() {
		return pquantity;
	}

	public void setPquantity(int pquantity) {
		this.pquantity = pquantity;
	}

	

	
	

}
