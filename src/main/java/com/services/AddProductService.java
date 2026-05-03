package com.services;

import java.sql.Connection;
import java.util.List;

import com.dao.AddProductDAO;
import com.utils.DBconfig;

public class AddProductService {
	
	public void addProduct(int user_id, String product_name, String category, int product_price, String product_brand, 
			byte[] product_image, List<String> attribute_1, List<String> attribute_2) throws Exception {
			
		Connection con = DBconfig.getConnection();
		
		AddProductDAO dao = new AddProductDAO();
		
		try {
			//making sure both query is executed
			con.setAutoCommit(false);
			
			int product_id = dao.addProduct(user_id, product_name, category, 
                    product_price, product_brand, product_image);
			
			for (String attr1 : attribute_1) {
                for (String attr2 : attribute_2) {
                    dao.addVariant(product_id, attr1, attr2);
                }
            }
			
			con.commit();
			
		}
		catch (Exception e) {
            con.rollback();
            throw e;
        } 
		finally {
            con.setAutoCommit(true);
            con.close();
        }
		
		
	}

}
