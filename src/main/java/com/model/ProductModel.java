package com.model;

public class ProductModel {
	private int product_id;
	private int user_id;
    private String product_name;
    private String category;
    private int product_price;
    private String product_brand;
    private boolean has_been_deleted;
    private byte[] product_image;
    
    
    
    //constructor 
    public ProductModel() {
		super();
		// TODO Auto-generated constructor stub
	}


  //getter and setter methods
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getProduct_price() {
		return product_price;
	}


	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}


	public String getProduct_brand() {
		return product_brand;
	}


	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}


	public boolean getHas_been_deleted() {
		return has_been_deleted;
	}


	public void setHas_been_deleted(boolean has_been_deleted) {
		this.has_been_deleted = has_been_deleted;
	}


	public byte[] getProduct_image() {
		return product_image;
	}


	public void setProduct_image(byte[] product_image) {
		this.product_image = product_image;
	}
    
	
    
}