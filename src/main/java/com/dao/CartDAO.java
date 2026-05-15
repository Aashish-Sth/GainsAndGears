package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.CartItemModel;

import com.utils.DBconfig;

public class CartDAO {
	
	//method to insert details into cart 
	public boolean addToCart(int userId, int productId, String attr1, String attr2) {
		
	    String findQuery = "SELECT variant_id FROM product_variant " +
	        "WHERE product_id = ? AND attribute_1 = ? AND attribute_2 = ?";

	    String insertQuery = "INSERT INTO cart (user_id, variant_id, quantity) VALUES (?, ?, 1) " +
                "ON DUPLICATE KEY UPDATE quantity = quantity + 1";

	    try (Connection conn = DBconfig.getConnection()) {
	        
	        //Finding the correct Variant_id 
	        try (PreparedStatement pst = conn.prepareStatement(findQuery)) {
	        	pst.setInt(1, productId);
	        	pst.setString(2, attr1);
	        	pst.setString(3, attr2);
	            
	            try (ResultSet rs = pst.executeQuery()) {
	                if (rs.next()) {
	                    //if the variant is found 
	                    int variantId = rs.getInt("variant_id");

	                    //Insert query into cart
	                    try (PreparedStatement pst1 = conn.prepareStatement(insertQuery)) {
	                    	pst1.setInt(1, userId);
	                    	pst1.setInt(2, variantId);
	                    	pst1.executeUpdate(); 
	                        return true; 
	                    }
	                }
	            }
	        }
	        
	        //if no variant was found
	        return false;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	//method to insert details into wishlist 
	public boolean addToWishlist(int userId, int productId) {
		
	    String query = "INSERT IGNORE INTO wishlist (user_id, product_id) VALUES (?, ?)";
	    
	    try (Connection conn = DBconfig.getConnection();
	         PreparedStatement pst = conn.prepareStatement(query)) {
	    	
	        pst.setInt(1, userId);
	        pst.setInt(2, productId);
	        return pst.executeUpdate() > 0;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	//method to select details to display in cart using userID
	public List<CartItemModel> getCartItem(int user_id) throws Exception {
		List<CartItemModel> items = new ArrayList<>();
		String query = "SELECT c.user_id, c.variant_id, c.quantity, pv.product_id, pv.attribute_1, "
				+ "pv.attribute_2, p.product_name, p.product_price, p.product_image "
				+ "FROM cart c "
				+ "JOIN product_variant pv ON c.variant_id = pv.variant_id "
				+ "JOIN products p ON pv.product_id = p.product_id "
				+ "WHERE c.user_id = ? ";
		
		try (Connection con = DBconfig.getConnection();
		         PreparedStatement pst = con.prepareStatement(query)) {

		        pst.setInt(1, user_id);

		        ResultSet rs = pst.executeQuery();

		        while (rs.next()) {

		            CartItemModel item = new CartItemModel();

		            item.setUser_Id(rs.getInt("user_id"));
		            item.setVariant_Id(rs.getInt("variant_id"));
		            item.setProduct_Id(rs.getInt("product_id"));
		            item.setQuantity(rs.getInt("quantity"));
		            item.setAttribute_1(rs.getString("attribute_1"));
		            item.setAttribute_2(rs.getString("attribute_2"));
		            item.setProduct_name(rs.getString("product_name"));
		            item.setProduct_price(rs.getDouble("product_price"));
		            item.setProduct_image(rs.getBytes("product_image"));

		            items.add(item);
		        }
		    } catch (SQLException e) {
	            e.printStackTrace();
	        }


		return items;	
	}

	//method to set the favorite icon to red 
	public boolean isInWishlist(int userId, int productId) {
	    String query = "SELECT 1 FROM wishlist WHERE user_id = ? AND product_id = ?";
	    try (Connection conn = DBconfig.getConnection();
	         PreparedStatement pst = conn.prepareStatement(query)) {
	        pst.setInt(1, userId);
	        pst.setInt(2, productId);
	        ResultSet rs = pst.executeQuery();
	        return rs.next();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	//method to select details to display in wishlist using userID
	public List<CartItemModel> getWishlistItem(int user_id) throws Exception {
		List<CartItemModel> items = new ArrayList<>();
		String query = "SELECT w.user_id,p.product_id,p.product_name,p.product_price,p.product_image "
				+ "FROM wishlist w "
				+ "JOIN products p ON w.product_id = p.product_id "
				+ "WHERE w.user_id = ? ";
		
		try (Connection con = DBconfig.getConnection();
		         PreparedStatement pst = con.prepareStatement(query)) {

		        pst.setInt(1, user_id);

		        ResultSet rs = pst.executeQuery();

		        while (rs.next()) {

		            CartItemModel item = new CartItemModel();

		            item.setUser_Id(rs.getInt("user_id"));
                    item.setProduct_Id(rs.getInt("product_id"));
                    item.setProduct_name(rs.getString("product_name"));
                    item.setProduct_price(rs.getDouble("product_price"));
                    item.setProduct_image(rs.getBytes("product_image"));

		            items.add(item);
		        }
		    } catch (SQLException e) {
	            e.printStackTrace();
	        }

		return items;
	}
	
	//method to increase the quantity in cart
	public boolean increaseQuantity(int userId, int variantId) {
	    String query = "UPDATE cart SET quantity = quantity + 1 WHERE user_id = ? AND variant_id = ?";
	    try (Connection con = DBconfig.getConnection();
	         PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setInt(1, userId);
	        pst.setInt(2, variantId);
	        return pst.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	//method to decrease the quantity in cart
	public boolean decreaseQuantity(int userId, int variantId) {
	    // Only decrease if quantity > 1
	    String query = "UPDATE cart SET quantity = quantity - 1 WHERE user_id = ? AND variant_id = ? AND quantity > 1";
	    try (Connection con = DBconfig.getConnection();
	         PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setInt(1, userId);
	        pst.setInt(2, variantId);
	        return pst.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	//method to remove a product from the cart
	public boolean removeFromCart(int userId, int variantId) {
	    String query = "DELETE FROM cart WHERE user_id = ? AND variant_id = ?";
	    try (Connection con = DBconfig.getConnection();
	         PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setInt(1, userId);
	        pst.setInt(2, variantId);
	        return pst.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	//method to remove a product from the wishlist
	public boolean removeFromWishlist(int userId, int productId) {
	    String query = "DELETE FROM wishlist WHERE user_id = ? AND product_id = ?";
	    try (Connection con = DBconfig.getConnection();
	         PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setInt(1, userId);
	        pst.setInt(2, productId);
	        return pst.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
}
