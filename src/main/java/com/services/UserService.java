package com.services;

import java.util.ArrayList;
import java.util.List;
import com.dao.UserDAO;
import com.model.UserModel;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public List<UserModel> getAllUsers() {
        return userDAO.getAllUsers();
    }

  
    public List<UserModel> filterUsers(List<UserModel> allUsers, String query) {
 
        if (query == null || query.trim().isEmpty()) {
            return allUsers;
        }

        String lowerQuery = query.toLowerCase().trim();
        
     
        List<UserModel> filteredList = new ArrayList<>();

    
        for (UserModel user : allUsers) {
       
            String fullName = (user.getUser_first_name() + " " + user.getUser_last_name()).toLowerCase();
            
         
            if (fullName.contains(lowerQuery)) {
                filteredList.add(user); 
            }
        }

        return filteredList;
    }

 
    public int countActive(List<UserModel> list) {
        int count = 0;
        for (UserModel user : list) {
            if (user.getUser_status()) { 
                count++;
            }
        }
        return count;
    }

    public int countInactive(List<UserModel> list) {
        int count = 0;
        for (UserModel user : list) {
            if (!user.getUser_status()) {
                count++;
            }
        }
        return count;
    }
    
    public boolean updateUserStatus(String userId, Boolean newStatus) {
       
        return userDAO.updateStatus(userId, newStatus);
    }
}