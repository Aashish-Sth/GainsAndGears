package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class SignUpController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/signUp" })
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/signUp.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String step = request.getParameter("step");
		
		if("first".equals(step))
		{
			handleFirstHalf(request,response);
		}
		else if("second".equals(step))
		{
			handleSignUp(request, response);
		}
		else
		{
			response.sendRedirect(request.getContextPath() + "/signUpController");
		}
	}
	
	private void handleFirstHalf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String firstName = request.getParameter("firstName").trim();
		String lastName = request.getParameter("lastName").trim();
		String email = request.getParameter("email").trim();
		String phoneNumber = request.getParameter("phoneNumber").trim();
		String gender = request.getParameter("gender");
		
		if (firstName.isBlank() || lastName.isBlank() || email.isBlank() || phoneNumber.isBlank()|| gender == null) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("email", email);
            request.setAttribute("phoneNumber", phoneNumber);
            request.setAttribute("gender", gender);
            request.getRequestDispatcher("/WEB-INF/pages/signUp.jsp").forward(request, response);
            return;
        }
		
		if (!email.contains("@")) {
            request.setAttribute("errorMessage", "Please enter a valid email.");
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("email", email);
            request.setAttribute("phoneNumber", phoneNumber);
            request.setAttribute("gender", gender);
            request.getRequestDispatcher("/WEB-INF/pages/signUp.jsp").forward(request, response);
            return;
        }
		
		
		
		HttpSession session = request.getSession(true);
		session.setAttribute("firstName", firstName);
        session.setAttribute("lastName",  lastName);
        session.setAttribute("email",     email);
        session.setAttribute("phone",     phoneNumber);
        session.setAttribute("gender", gender);
		
        //Using query parameter to set value of step variable in jsp file.
        response.sendRedirect(request.getContextPath() + "/signUpController?step=second");
        
	}
	
	private void handleSignUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession(false);
		
		
		String firstName = (String) session.getAttribute("firstName");
        String lastName = (String) session.getAttribute("lastName");
        String email = (String) session.getAttribute("email");
        String phoneNumber = (String) session.getAttribute("phoneNumber");
        String gender = (String) session.getAttribute("gender");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if (password.isBlank() || confirmPassword.isBlank()) {
            request.setAttribute("errorMessage", "Password fields cannot be empty.");
            request.getRequestDispatcher("/WEB-INF/pages/signUp.jsp").forward(request, response);
            return;
        }
        
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("/WEB-INF/pages/signUp.jsp").forward(request, response);
            return;
        }
        
        if (password.length() < 8) {
            request.setAttribute("errorMessage", "Password must be at least 8 characters.");
            request.getRequestDispatcher("/WEB-INF/pages/signUp.jsp").forward(request, response);
            return;
        }
        
        session.removeAttribute("firstName");
        session.removeAttribute("lastName");
        session.removeAttribute("email");
        session.removeAttribute("phone");
        session.removeAttribute("gender");
        
        session.invalidate();
        // Redirect to login
        response.sendRedirect(request.getContextPath() + "/LoginController");
	}
}
