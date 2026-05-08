package com.dao;

import com.model.ProductModel;
import com.utils.DBconfig; 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<ProductModel> getAllProducts() throws ClassNotFoundException {
        List<ProductModel> productList = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE has_been_deleted = 0";

        // Connection and resources handled by try-with-resources
        try (Connection conn = DBconfig.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ProductModel product = new ProductModel();
                product.setProduct_id(rs.getInt("product_id"));
                product.setProduct_name(rs.getString("product_name"));
                product.setCategory(rs.getString("category"));
                product.setProduct_price(rs.getInt("product_price"));
                product.setProduct_brand(rs.getString("product_brand"));
                
                // image is retrieved as a byte array from the BLOB column
                product.setProduct_image(rs.getBytes("product_image")); 
                
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
}