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
        
        // Ensure table name 'users' and column names match your XAMPP/MySQL schema
        String query = "SELECT user_first_name, user_last_name, user_email, "
        		     + "user_phone_number, user_role, user_gender, user_img FROM users";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement st = conn.prepareStatement(query);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                userModel user = new userModel();
                
                // Map database columns to your model setters
                user.setUser_first_name(rs.getString("user_first_name"));
                user.setUser_last_name(rs.getString("user_last_name"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_phone_number(rs.getString("user_phone_number"));
                user.setUser_role(rs.getString("user_role"));
                user.setUser_gender(rs.getString("user_gender"));
                
                // Handling the Blob image
                user.setUser_img(rs.getBlob("user_img"));

                userList.add(user);
            }
            
            System.out.println("Successfully retrieved " + userList.size() + " users from DB.");

        } catch (SQLException e) {
            System.err.println("Error while fetching all users: " + e.getMessage());
            e.printStackTrace();
        }
        
        return userList;
    }
}