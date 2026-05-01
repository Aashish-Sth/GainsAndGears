package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

// Import your Model and Service
import com.model.userModel;
import com.services.UserService;

/**
 * Servlet implementation class ViewAllUsersController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/users" })
public class ViewAllUsersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewAllUsersController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. Create an instance of the Service
		UserService userService = new UserService();
		
		// 2. Fetch the list of users from the DB via the Service/DAO
		List<userModel> userList = userService.getAllUsers();
		
		// 3. Attach the list to the request object. 
		// The JSP will look for the name "userList" to display the data.
		request.setAttribute("userList", userList);
		
		// 4. Forward the request and the data to the JSP
		request.getRequestDispatcher("/WEB-INF/pages/viewAllusers.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}