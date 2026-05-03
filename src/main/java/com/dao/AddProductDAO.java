package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.utils.DBconfig;

public class AddProductDAO {
	
	Connection con = DBconfig.getConnection();
	
	public int addProduct(int user_id, String product_name, String category, int product_price, String product_brand, byte[] product_image) throws Exception {

		//query to insert or add new product in products table
        String insertProduct = "INSERT INTO products (user_id, product_name, category, product_price, product_brand, has_been_deleted, product_image) "
                   + "VALUES (?, ?, ?, ?, ?, 0, ?)";
        
        PreparedStatement pst1 = con.prepareStatement(insertProduct);
        pst1.setInt(1, user_id);
        pst1.setString(2, product_name);
        pst1.setString(3, category);
        pst1.setInt(4, product_price);
        pst1.setString(5, product_brand);
        pst1.setBytes(6, product_image);
        pst1.executeUpdate();
        
        PreparedStatement getIdPst = con.prepareStatement("SELECT LAST_INSERT_ID()");
        ResultSet rs = getIdPst.executeQuery();
        int product_id = 0;
        if (rs.next()) {
        	product_id = rs.getInt(1);
        }
        rs.close();
        pst1.close();
        getIdPst.close();
        
        return product_id;
	}
        
    public void addVariant(int product_id, String attribute_1, String attribute_2) throws Exception {

      //query to insert or add new record in product_variant
        String insertVariant = "INSERT INTO product_variant (product_id, attribute_1, attribute_2) "
                   + "VALUES (?, ?, ?)";
        
        PreparedStatement pst2 = con.prepareStatement(insertVariant);
        
        pst2.setInt(1, product_id);
		pst2.setString(2, attribute_1);
        pst2.setString(3, attribute_2);
        pst2.executeUpdate();
      
        pst2.close();
	}
}
