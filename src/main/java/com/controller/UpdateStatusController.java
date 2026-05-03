package com.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.services.UserService;

@WebServlet("/admin/updateStatus")
public class UpdateStatusController extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        

        String userEmail = request.getParameter("userEmail"); 
        String statusStr = request.getParameter("newStatus");

        if (userEmail != null && statusStr != null) {
            try {
                boolean newStatus = Boolean.parseBoolean(statusStr);

                UserService service = new UserService();
                boolean isUpdated = service.updateUserStatus(userEmail, newStatus);

                if (isUpdated) {
                
                    response.sendRedirect("users?success=true");
                    return; 
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        
       
        response.sendRedirect("users?error=true");
    }
}