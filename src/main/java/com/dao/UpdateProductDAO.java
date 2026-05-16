package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.ProductModel;
import com.utils.DBconfig;

public class UpdateProductDAO {
	
	public ProductModel getProductById(int product_id) throws Exception {
        Connection con = DBconfig.getConnection();
        String query = "SELECT * FROM products WHERE product_id = ?";
        PreparedStatement pst = con.prepareStatement(query);
        
        pst.setInt(1, product_id);
        ResultSet rs = pst.executeQuery();

        ProductModel product = null;
        if (rs.next()) {
            product = new ProductModel();
            product.setProduct_id(rs.getInt("product_id"));
            product.setProduct_name(rs.getString("product_name"));
            product.setProduct_price(rs.getInt("product_price"));
            product.setCategory(rs.getString("category"));
            product.setProduct_brand(rs.getString("product_brand"));
            product.setProduct_image(rs.getBytes("product_image"));
        }
        rs.close();
        pst.close();
        con.close();
        return product;
    }
	
	public void updateProduct(int product_id, String product_name, int product_price, String category,
            String product_brand, byte[] product_image) throws Exception {

        Connection con = DBconfig.getConnection();
        String query1 = "UPDATE products SET "
                + "product_name = ?, product_price = ?, category = ?, "
                + "product_brand = ?, product_image = ? "
                + "WHERE product_id = ?";
        
        String query2 = "UPDATE products SET "
                + "product_name = ?, product_price = ?, category = ?, "
                + "product_brand = ?"
                + "WHERE product_id = ?";
        
        if (product_image != null) {
            //if user updates image too
            PreparedStatement pst = con.prepareStatement(query1);
            pst.setString(1, product_name);
            pst.setInt(2, product_price);
            pst.setString(3, category);
            pst.setString(4, product_brand);
            pst.setBytes(5, product_image);
            pst.setInt(6, product_id);
            pst.executeUpdate();
            pst.close();
        } else {
            //if user does not updates image
            PreparedStatement pst = con.prepareStatement(query2);
            pst.setString(1, product_name);
            pst.setInt(2, product_price);
            pst.setString(3, category);
            pst.setString(4, product_brand);
            pst.setInt(5, product_id);
            pst.executeUpdate();
            pst.close();
        }
        con.close();
    }
	
	public void replaceVariants(int product_id, List<String> attr1Values, List<String> attr2Values)
	        throws Exception {

	    Connection con = DBconfig.getConnection();
	    con.setAutoCommit(false);
	    String delete = "DELETE FROM product_variant WHERE product_id = ?";
	    String insert = "INSERT INTO product_variant (product_id, attribute_1, attribute_2) "
	            + "VALUES (?, ?, ?)";

	    try {
	        PreparedStatement pst1 = con.prepareStatement(delete);
	        pst1.setInt(1, product_id);
	        pst1.executeUpdate();
	        pst1.close();

	        PreparedStatement pst2 = con.prepareStatement(insert);
	        for (String a1 : attr1Values) {
	            for (String a2 : attr2Values) {
	                pst2.setInt(1, product_id);
	                pst2.setString(2, a1);
	                pst2.setString(3, a2);
	                pst2.addBatch();
	            }
	        }
	        pst2.executeBatch();
	        pst2.close();

	        con.commit();

	    } catch (Exception e) {
	        con.rollback();
	        throw e;
	    } finally {
	        con.setAutoCommit(true);
	        con.close();
	    }
	}
	
	public List<String> getAttr1Values(int product_id) throws Exception {
	    Connection con = DBconfig.getConnection();
	    String query = "SELECT DISTINCT attribute_1 FROM product_variant WHERE product_id = ?";
	    PreparedStatement pst = con.prepareStatement(query);

	    pst.setInt(1, product_id);
	    ResultSet rs = pst.executeQuery();

	    List<String> attr1 = new ArrayList<>();
	    while (rs.next()) {
	    	attr1.add(rs.getString(1));
	    }
	    rs.close();
	    pst.close();
	    con.close();
	    return attr1;
	}

	public List<String> getAttr2Values(int product_id) throws Exception {
	    Connection con = DBconfig.getConnection();
	    String query = "SELECT DISTINCT attribute_2 FROM product_variant WHERE product_id = ?";
	    PreparedStatement pst = con.prepareStatement(query);

	    pst.setInt(1, product_id);
	    ResultSet rs = pst.executeQuery();

	    List<String> attr2 = new ArrayList<>();
	    while (rs.next()) {
	    	attr2.add(rs.getString(1));
	    }
	    rs.close();
	    pst.close();
	    con.close();
	    return attr2;
	}
}
