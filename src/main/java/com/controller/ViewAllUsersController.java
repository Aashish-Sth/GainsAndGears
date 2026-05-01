package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.userModel;
import com.services.UserService;

@WebServlet("/admin/users")
public class ViewAllUsersController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        
        // 1. Get the data
        List<userModel> allUsers = userService.getAllUsers();
        String searchQuery = request.getParameter("search");
        
        // 2. Use the service to filter
        List<userModel> displayList = userService.filterUsers(allUsers, searchQuery);

        // 3. Set attributes for JSP
        request.setAttribute("userList", displayList);
        request.setAttribute("searchedName", searchQuery); // Keeps text in search box
        
        // Stats are always calculated from the full list
        request.setAttribute("totalCount", allUsers.size());
        request.setAttribute("activeCount", userService.countActive(allUsers));
        request.setAttribute("inactiveCount", userService.countInactive(allUsers));
        
        request.getRequestDispatcher("/WEB-INF/pages/viewAllusers.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}