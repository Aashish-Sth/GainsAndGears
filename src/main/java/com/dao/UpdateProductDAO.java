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
        PreparedStatement pst = con.prepareStatement(
                "SELECT * FROM products WHERE product_id = ?");
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

        if (product_image != null) {
            // update image too
            PreparedStatement pst = con.prepareStatement(
                    "UPDATE products SET "
                    + "product_name = ?, product_price = ?, category = ?, "
                    + "product_brand = ?, product_image = ? "
                    + "WHERE product_id = ?");
            pst.setString(1, product_name);
            pst.setInt(2, product_price);
            pst.setString(3, category);
            pst.setString(4, product_brand);
            pst.setBytes(5, product_image);
            pst.setInt(6, product_id);
            pst.executeUpdate();
            pst.close();
        } else {
            // leave existing image untouched
            PreparedStatement pst = con.prepareStatement(
                    "UPDATE products SET "
                    + "product_name = ?, product_price = ?, category = ?, "
                    + "product_brand = ? "
                    + "WHERE product_id = ?");
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
	
	public void replaceVariants(int  product_id, List<String> attr1Values, List<String> attr2Values )
			throws Exception {
 
        Connection con = DBconfig.getConnection();
        con.setAutoCommit(false);
 
        try {
            //deleting the existing variants for this product
            PreparedStatement pst1 = con.prepareStatement(
                    "DELETE FROM product_variant WHERE product_id = ?");
            pst1.setInt(1, product_id);
            pst1.executeUpdate();
            pst1.close();
 
            //inserting one row per (attr1, attr2) combination
            PreparedStatement pst2 = con.prepareStatement(
                    "INSERT INTO product_variant "
                  + "(product_id, attribute_1, attribute_2) "
                  + "VALUES (?, ?, ?)");
 
            for (String a1 : attr1Values) {
                for (String a2 : attr2Values) {
                	pst2.setInt   (1, product_id);
                	pst2.setString(2, a1);
                	pst2.setString(3, a2);
                	pst2.addBatch();
                }
            }
            pst2.executeBatch();
            pst2.close();
 
            con.commit();
 
        } catch (Exception e) {
            con.rollback();   // revert both delete and inserts on any error
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }
	
	private List<String> getDistinct(int product_id, String column) throws Exception {
        Connection con = DBconfig.getConnection();
        PreparedStatement pst = con.prepareStatement(
                "SELECT DISTINCT " + column
              + " FROM product_variant WHERE product_id = ?");
        pst.setInt(1, product_id);
        ResultSet rs = pst.executeQuery();
 
        List<String> values = new ArrayList<>();
        while (rs.next()) {
            values.add(rs.getString(1));
        }
        rs.close();
        pst.close();
        con.close();
        return values;
    }
	
	public List<String> getAttr1Values(int product_id) throws Exception {
        return getDistinct(product_id, "attribute_1");
    }
	
	public List<String> getAttr2Values(int product_id) throws Exception {
        return getDistinct(product_id, "attribute_2");
    }
	
	
}
