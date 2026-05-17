package com.dao;

import java.sql.*;
import java.sql.Connection;
import com.utils.DBconfig;

public class PasswordDAO{
	public String getCurrentHashedPassword(int user_id) throws Exception{
		String query= "SELECT user_password FROM users WHERE user_id=?";
		String hashedPassword = null;
		Connection con= DBconfig.getConnection();
		PreparedStatement pst = con.prepareStatement(query);
		pst.setInt(1, user_id);
		ResultSet rs = pst.executeQuery();
	
		if (rs.next()) {
			hashedPassword = rs.getString("user_password");
		}
		return hashedPassword;
		
	}
	
	public boolean updatePassword(int user_id, String newhashedPassword) throws Exception{
		
		String query = "UPDATE users SET user_password = ? WHERE user_id=?";
		
		Connection con = DBconfig.getConnection();
		PreparedStatement pst = con.prepareStatement(query);
		
		pst.setString(1, newhashedPassword);
		pst.setInt(2, user_id);
		
		int rows = pst.executeUpdate();
		return rows>0;
	}
}