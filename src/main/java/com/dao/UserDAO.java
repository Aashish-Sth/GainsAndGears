package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.userModel;
import com.utils.DBconfig;

public class UserDAO {

    /**
     * Fetches all users from the database and returns them as a List of userModel objects.
     */
	public List<userModel> getAllUsers() {
	    List<userModel> userList = new ArrayList<>();
	    
	    // 1. Added 'user_id' to the beginning of this string
	    String query = "SELECT user_id, user_first_name, user_last_name, user_email, "
	                 + "user_phone_number, user_role, user_gender, user_status, user_img FROM users";

	    try (Connection conn = DBconfig.getConnection();
	         PreparedStatement st = conn.prepareStatement(query);
	         ResultSet rs = st.executeQuery()) {

	        while (rs.next()) {
	            userModel user = new userModel();
	            
	            // This now works because user_id is in the query above
	            user.setUser_id(rs.getInt("user_id")); 
	            
	            user.setUser_first_name(rs.getString("user_first_name"));
	            user.setUser_last_name(rs.getString("user_last_name"));
	            user.setUser_email(rs.getString("user_email"));
	            user.setUser_phone_number(rs.getString("user_phone_number"));
	            user.setUser_role(rs.getString("user_role"));
	            user.setUser_gender(rs.getString("user_gender"));
	            user.setUser_status(rs.getInt("user_status"));
	            user.setUser_img(rs.getBlob("user_img"));

	            userList.add(user);
	        }
	        
	        System.out.println("Successfully retrieved " + userList.size() + " users from DB.");

	    } catch (SQLException e) {
	        System.err.println("SQL Error: " + e.getMessage());
	        e.printStackTrace();
	    }
	    
	    return userList;
	}
	
	
	public boolean updateStatus(String email, int newStatus) {
	    String query = "UPDATE users SET user_status = ? WHERE user_email = ?";
	    
	    try (Connection conn = DBconfig.getConnection();
	         PreparedStatement st = conn.prepareStatement(query)) {
	        
	        st.setInt(1, newStatus);
	        st.setString(2, email);
	        
	        int rowsUpdated = st.executeUpdate();
	        return rowsUpdated > 0; // Returns true if the user was found and updated

	    } catch (SQLException e) {
	        System.err.println("Update Error: " + e.getMessage());
	        return false;
	    }
	}
	}