package com.model;

public class ProductVariantModel {
	private int variant_id;
    private int product_id;
    private String attribute_1;  // size or flavor 
    private String attribute_2;  // color or quantity 
    private int stock;
    
    
    //constructor
	public ProductVariantModel(int variant_id, int product_id, String attribute_1, String attribute_2, int stock) {
		super();
		this.variant_id = variant_id;
		this.product_id = product_id;
		this.attribute_1 = attribute_1;
		this.attribute_2 = attribute_2;
		this.stock = stock;
	}
	
	//getter and setter
	public int getVariant_id() {
		return variant_id;
	}
	public void setVariant_id(int variant_id) {
		this.variant_id = variant_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}

    
    
}
