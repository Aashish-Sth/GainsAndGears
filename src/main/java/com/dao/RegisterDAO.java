package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.mysql.cj.jdbc.Blob;
import com.utils.DBconfig;

public class RegisterDAO {
	public void addUser(String user_first_name,String user_last_name,String user_password,
			String user_email,String user_gender,byte[] user_img,String user_phone_number) throws Exception {
		Connection con = DBconfig.getConnection();
		String query = "INSERT INTO Users (user_first_name, user_last_name, user_password, user_email, user_gender,user_img, user_phone_number) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, user_first_name);
		pst.setString(2, user_last_name);
		pst.setString(3, user_password);
		pst.setString(4, user_email);
		pst.setString(5, user_gender);
		pst.setBytes(6, user_img);
		pst.setString(7, user_phone_number);
		pst.executeUpdate();
        pst.close();
        con.close();
		}

}
