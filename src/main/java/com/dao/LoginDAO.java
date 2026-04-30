package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.userModel;
import com.utils.DBconfig;

public class LoginDAO {
	public ResultSet checkUser(userModel user) throws Exception {
		String email = user.getUser_email();
		
		Connection con = DBconfig.getConnection();
		
		String query = "SELECT * FROM users WHERE user_email = ?";
		
		PreparedStatement pst = con.prepareStatement(query);
		
		pst.setString(1, email);
		
		ResultSet rs = pst.executeQuery();
		
		
		return rs;
		
		
		
	}
}
