package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.utils.CookieUtil;
import com.model.UserModel;
import com.services.LoginService;
import com.utils.SessionUtil;

/**
 * Servlet implementation class LoginController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
        	request.setAttribute("errorMessage", "Username and Password are required");
        	request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
            return;
        }
        UserModel user = new UserModel();
        user.setUser_email(email);
        user.setUser_password(password);
        
        LoginService service = new LoginService();
        try {
        	 if(service.validateUser(user)) {
             	SessionUtil.setAttribute(request, "user_email", email);
             	CookieUtil.addCookie(response, "user_email", email, 60*60);
             }
        	 else {
                 request.setAttribute("errorMessage", "Invalid username or password");
                 request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
             }
        }
        catch(Exception e) {
        	e.printStackTrace();
        	
        }
       
        
	}

}
