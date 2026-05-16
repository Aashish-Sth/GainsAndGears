package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.model.UserModel;
import com.services.PasswordService;
import com.utils.SessionUtil;

/**
 * Servlet implementation class ChangePasswordController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ChangePassword" })
public class ChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/changepassword.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub

		UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
		
		int user_id = loggedInUser.getUser_id();
		System.out.println("User ID from session: " + user_id);
		
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		
		if(currentPassword == null || newPassword == null || confirmPassword == null || currentPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {
			request.setAttribute("error", "All the fields are required.");
			request.getRequestDispatcher("/WEB-INF/pages/changepassword.jsp").forward(request, response);
			return;
		}
		try {
		    PasswordService service = new PasswordService();
		    String result = service.changePassword(user_id, currentPassword, newPassword, confirmPassword);

		    if ("success".equals(result)) {
		        request.setAttribute("success", "Password changed successfully.");
		    } else {
		        request.setAttribute("error", result);
		    }
		}
		catch(Exception e) { 
			e.printStackTrace();
			request.setAttribute("error", "Something went wrong. Please try again.");

    }

		    request.getRequestDispatcher("/WEB-INF/pages/changepassword.jsp").forward(request, response);
	}
}
	


