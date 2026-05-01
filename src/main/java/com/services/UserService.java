package com.services;

import java.util.List;
import com.dao.UserDAO;
import com.model.userModel;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public List<userModel> getAllUsers() {
        return userDAO.getAllUsers();
    }
}