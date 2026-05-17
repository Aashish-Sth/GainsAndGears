package com.model;

public class CartItemModel {

	 private int user_Id;
	 private int variant_Id;
	 private int product_Id;
	 private int quantity;
	 private String attribute_1;  // size or flavor 
	 private String attribute_2;  // color or quantity
	 private String product_name;
	 private double product_price;
	 private byte[] product_image;
	 private int total;
	 private String product_brand;
	 
	 
	public int getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(int user_Id) {
		this.user_Id = user_Id;
	}
	public int getVariant_Id() {
		return variant_Id;
	}
	public void setVariant_Id(int variant_Id) {
		this.variant_Id = variant_Id;
	}
	public int getProduct_Id() {
		return product_Id;
	}
	public void setProduct_Id(int product_Id) {
		this.product_Id = product_Id;
	}
	public String getAttribute_1() {
		return attribute_1;
	}
	public void setAttribute_1(String attribute_1) {
		this.attribute_1 = attribute_1;
	}
	public String getAttribute_2() {
		return attribute_2;
	}
	public void setAttribute_2(String attribute_2) {
		this.attribute_2 = attribute_2;
	}

	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(double product_price) {
		this.product_price = product_price;
	}
	public byte[] getProduct_image() {
		return product_image;
	}
	public void setProduct_image(byte[] product_image) {
		this.product_image = product_image;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}
	
	
	 
	 
}
