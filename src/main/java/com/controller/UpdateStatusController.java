package com.controller;

import java.io.IOException; // Added this
import jakarta.servlet.ServletException; // Added this
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest; // Ensure this is imported
import jakarta.servlet.http.HttpServletResponse;

import com.services.UserService;

@WebServlet("/admin/updateStatus")
public class UpdateStatusController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Match the parameter name sent from the JSP (we'll use email)
        String userEmail = request.getParameter("email"); 
        String statusStr = request.getParameter("status");

        if (userEmail != null && statusStr != null) {
            int newStatus = Integer.parseInt(statusStr);

            UserService service = new UserService();
            boolean isUpdated = service.updateUserStatus(userEmail, newStatus);

            if (isUpdated) {
                // Success: Redirect back
                response.sendRedirect("users?success=true");
                return; // Stop execution here
            }
        }
        
        // If it fails or parameters are missing
        response.sendRedirect("users?error=true");
    }
}