package com.services;

import com.model.UserModel;


import java.sql.ResultSet;
import com.utils.PasswordUtil;
import com.dao.LoginDAO;

public class LoginService {
	public Boolean validateUser(UserModel user)throws Exception {
		
		LoginDAO dao = new LoginDAO();
		ResultSet rs =dao.checkUser(user);
		if(rs.next()) {
			return PasswordUtil.checkPassword(user.getUser_password(), rs.getString("user_password"));
	}
		return false;
}
	
	 public UserModel getUserByEmail(String email) throws Exception {
	        LoginDAO dao = new LoginDAO();
	        return dao.getUserByEmail(email);
	    }
}

