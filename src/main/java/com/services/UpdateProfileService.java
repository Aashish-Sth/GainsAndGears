package com.services;
import com.dao.UpdateProfileDAO;

public class UpdateProfileService {
	public boolean updateUserDetails(String user_first_name,String user_last_name,String user_email,
			String user_phone_number, String user_gender,String user_image,String actual_mail) {
		UpdateProfileDAO dao = new UpdateProfileDAO();
		try {
			dao.updateUserDetails(user_first_name, user_last_name, user_email, user_phone_number, user_gender, user_image, actual_mail);
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		
	}
}
