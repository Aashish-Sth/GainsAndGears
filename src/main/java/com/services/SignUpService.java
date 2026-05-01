package com.services;

import com.dao.RegisterDAO;
import com.mysql.cj.jdbc.Blob;
import com.utils.PasswordUtil;

public class SignUpService {
	public void adduser(String user_first_name,String user_last_name,String user_password,
			String user_email,String user_gender,String user_img,String user_phone_number) {
		user_password = PasswordUtil.getHashPassword(user_password);
		
		RegisterDAO dao = new RegisterDAO();
		
		try {
			dao.addUser(user_first_name, user_last_name, user_password, user_email, user_gender, user_img, user_phone_number);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
