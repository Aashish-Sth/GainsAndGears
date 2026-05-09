package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.UserModel;
import com.services.UserService;

@WebServlet("/admin/users")
public class ViewAllUsersController extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
     
        List<UserModel> allUsers = userService.getAllUsers();
        
     
        String searchQuery = request.getParameter("search");
        
        List<UserModel> displayList = userService.filterUsers(allUsers, searchQuery);

     
        request.setAttribute("userList", displayList);
        request.setAttribute("searchedName", searchQuery); 
     
        request.setAttribute("totalCount", allUsers.size());
        request.setAttribute("activeCount", userService.countActive(allUsers));
        request.setAttribute("inactiveCount", userService.countInactive(allUsers));
        

        request.getRequestDispatcher("/WEB-INF/pages/viewAllusers.jsp").forward(request, response);
    }
}