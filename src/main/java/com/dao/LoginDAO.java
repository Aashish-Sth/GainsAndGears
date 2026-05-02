package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.UserModel;
import com.utils.DBconfig;

public class LoginDAO {
	public ResultSet checkUser(UserModel user) throws Exception {
		String email = user.getUser_email();
		
		Connection con = DBconfig.getConnection();
		
		String query = "SELECT * FROM users WHERE user_email = ?";
		
		PreparedStatement pst = con.prepareStatement(query);
		
		pst.setString(1, email);
		
		ResultSet rs = pst.executeQuery();
		
		
		return rs;
		
		
		
	}
	
	public UserModel getUserByEmail(String email) throws Exception {
        Connection con = DBconfig.getConnection();
        String query = "SELECT * FROM users WHERE user_email = ?";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1, email);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            UserModel user = new UserModel();
            user.setUser_id(rs.getInt("user_id"));
            user.setUser_first_name(rs.getString("user_first_name"));
            user.setUser_last_name(rs.getString("user_last_name"));
            user.setUser_email(rs.getString("user_email"));
            user.setUser_gender(rs.getString("user_gender"));
            user.setUser_phone_number(rs.getString("user_phone_number"));
            user.setUser_role(rs.getString("user_role"));
            user.setUser_img(rs.getString("user_img"));
            return user;
        }
        return null;
    }
}
