package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.utils.DBconfig;

public class UpdateProfileDAO {
	public void updateUserDetails(String user_first_name,String user_last_name,String user_email,
			String user_phone_number, String user_gender,String user_image,String actual_mail) throws Exception  {
		Connection con = DBconfig.getConnection();
		String query = "UPDATE users SET "
				+ "user_first_name = ?,"
				+ " user_last_name = ?,"
				+ " user_email = ?,"
				+ " user_phone_number = ?,"
				+ " user_gender = ?, "
				+ "user_img= ? "
				+ "WHERE user_email = ?";
		
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, user_first_name);
		pst.setString(2, user_last_name);
		pst.setString(3, user_email);
		pst.setString(4, user_phone_number);
		pst.setString(5, user_gender);
		pst.setString(6, user_image);
		pst.setString(7, actual_mail);
		pst.executeUpdate();
		pst.close();
		con.close();
	}
}
