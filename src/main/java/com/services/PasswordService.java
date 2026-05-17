package com.services;

import com.dao.PasswordDAO;
import com.utils.PasswordUtil;

public class PasswordService{
	 
	private PasswordDAO dao = new PasswordDAO();
	
	public String changePassword(int user_id, String currentPassword, String newPassword, String confirmPassword ) throws Exception {
		
		String storedHash = dao.getCurrentHashedPassword(user_id);
		 System.out.println("user_id: " + user_id);
		 System.out.println("storedHash: " + storedHash);
		
		if (storedHash == null) {
			return "User not found";
		}
		System.out.println("currentPassword entered: " + currentPassword);
		boolean match = PasswordUtil.checkPassword(currentPassword, storedHash);
		System.out.println("Password match: " + match);
		
		if (!PasswordUtil.checkPassword(currentPassword, storedHash)) {
			return"Currrent Password is incorrect";
		}
		
		if (PasswordUtil.checkPassword(newPassword, storedHash)) {
			return"New Password cant be same as old password";
		}
		
		if(!newPassword.equals(confirmPassword)) {
			return"The Passwords dont match";
		}
		
		String newhashedPassword = PasswordUtil.getHashPassword(newPassword);
		boolean updated= dao.updatePassword(user_id, newhashedPassword);
		System.out.println("Updated: " + updated);
		if (updated) {
			return "success";
		}
		return "Failed to update Password";
	}
	}
