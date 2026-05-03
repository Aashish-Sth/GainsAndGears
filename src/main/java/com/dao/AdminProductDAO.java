package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.utils.DBconfig;

public class AdminProductDAO {
	
	Connection con = DBconfig.getConnection();
	
	//function to get all the product from the DB
	public ResultSet getAllProducts() throws Exception {
        String query = "SELECT product_id, product_name, product_price, category, has_been_deleted FROM products";
        PreparedStatement pst = con.prepareStatement(query);
        return pst.executeQuery();
    }

    
    public boolean updateStatus(int product_id, boolean has_been_deleted) throws Exception {
        String query = "UPDATE products SET has_been_deleted = ? WHERE product_id = ?";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setBoolean(1, has_been_deleted);
        pst.setInt(2, product_id);
        int rowsUpdated = pst.executeUpdate();
        
        return rowsUpdated>0;
    }
    
	
}