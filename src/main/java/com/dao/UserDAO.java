package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.UserModel;
import com.utils.DBconfig;

public class UserDAO {

  
	public List<UserModel> getAllUsers() {
	    List<UserModel> userList = new ArrayList<>();
	    

	    String query = "SELECT user_id, user_first_name, user_last_name, user_email, "
	                 + "user_phone_number, user_role, user_gender, user_status, user_img FROM users";

	    try (Connection conn = DBconfig.getConnection();
	         PreparedStatement st = conn.prepareStatement(query);
	         ResultSet rs = st.executeQuery()) {

	        while (rs.next()) {
	            UserModel user = new UserModel();
	            

	            user.setUser_id(rs.getInt("user_id")); 
	            
	            user.setUser_first_name(rs.getString("user_first_name"));
	            user.setUser_last_name(rs.getString("user_last_name"));
	            user.setUser_email(rs.getString("user_email"));
	            user.setUser_phone_number(rs.getString("user_phone_number"));
	            user.setUser_role(rs.getString("user_role"));
	            user.setUser_gender(rs.getString("user_gender"));
	            user.setUser_status(rs.getBoolean("user_status"));
	       

	            userList.add(user);
	        }
	        
	        System.out.println("Successfully retrieved " + userList.size() + " users from DB.");

	    } catch (SQLException e) {
	        System.err.println("SQL Error: " + e.getMessage());
	        e.printStackTrace();
	    }
	    
	    return userList;
	}
	
	
	public boolean updateStatus(String email, boolean newStatus) {
	    String query = "UPDATE users SET user_status = ? WHERE user_email = ?";
	    
	    try (Connection conn = DBconfig.getConnection();
	         PreparedStatement st = conn.prepareStatement(query)) {
	        
	        st.setBoolean(1, newStatus);
	        st.setString(2, email);
	        
	        int rowsUpdated = st.executeUpdate();
	        return rowsUpdated > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	}