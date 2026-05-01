package com.services;

import java.util.ArrayList;
import java.util.List;
import com.dao.UserDAO;
import com.model.userModel;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public List<userModel> getAllUsers() {
        return userDAO.getAllUsers();
    }

    /**
     * Filters users using a simple loop instead of streams.
     */
    public List<userModel> filterUsers(List<userModel> allUsers, String query) {
        // 1. If the search box is empty, return the original list immediately
        if (query == null || query.trim().isEmpty()) {
            return allUsers;
        }

        // 2. Prepare the search term (lowercase to make it case-insensitive)
        String lowerQuery = query.toLowerCase().trim();
        
        // 3. Create a new empty list to hold the matches
        List<userModel> filteredList = new ArrayList<>();

        // 4. Loop through every user in the master list
        for (userModel user : allUsers) {
            // Combine first and last name into one string
            String fullName = (user.getUser_first_name() + " " + user.getUser_last_name()).toLowerCase();
            
            // Check if the search term exists inside that full name
            if (fullName.contains(lowerQuery)) {
                filteredList.add(user); // Add the match to our result list
            }
        }

        return filteredList;
    }

    /**
     * Counts active users using a basic counter and loop.
     */
    public int countActive(List<userModel> list) {
        int count = 0;
        for (userModel user : list) {
            if (user.getUser_status() == 1) { 
                count++;
            }
        }
        return count;
    }

    /**
     * Counts inactive users using a basic counter and loop.
     */
    public int countInactive(List<userModel> list) {
        int count = 0;
        for (userModel user : list) {
            if (user.getUser_status() == 0) {
                count++;
            }
        }
        return count;
    }
    
    public boolean updateUserStatus(String userId, int newStatus) {
        // This calls your DAO method: UPDATE users SET user_status = ? WHERE user_id = ?
        return userDAO.updateStatus(userId, newStatus);
    }
}