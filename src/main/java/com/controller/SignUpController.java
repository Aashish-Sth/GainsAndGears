package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.utils.SessionUtil;
import jakarta.servlet.http.Part;
import java.io.IOException;

import com.services.SignUpService;


/**
 * Servlet implementation class SignUpController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/signUp" })
@MultipartConfig
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
			handleSecondHalf(request, response);
		}
		else if("third".equals(step))
		{
			handleSignUp(request,response);
		}
		else
		{
			response.sendRedirect(request.getContextPath() + "/signUp");
		}
	}
	
	private void handleFirstHalf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String firstName = request.getParameter("firstName").trim();
		String lastName = request.getParameter("lastName").trim();
		String email = request.getParameter("email").trim();
		String phoneNumber = request.getParameter("phoneNumber");
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
		
		
		if (!phoneNumber.matches("\\d+")) {
            request.setAttribute("errorMessage", "The Phone Number field can contain numbers only.");
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("email", email);
            request.setAttribute("phoneNumber", phoneNumber);
            request.setAttribute("gender", gender);
            request.getRequestDispatcher("/WEB-INF/pages/signUp.jsp").forward(request, response);
            return;
		}
		
		if (!(phoneNumber.trim().length() == 10)) {
            request.setAttribute("errorMessage", "Phone number must be of 10 digits.");
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("email", email);
            request.setAttribute("phoneNumber", phoneNumber);
            request.setAttribute("gender", gender);
            request.getRequestDispatcher("/WEB-INF/pages/signUp.jsp").forward(request, response);
            return;
		}
		
		
		
		SessionUtil.setAttribute(request,"firstName", firstName);
		SessionUtil.setAttribute(request,"lastName",  lastName);
		SessionUtil.setAttribute(request,"email",     email);
		SessionUtil.setAttribute(request,"phoneNumber",     phoneNumber);
		SessionUtil.setAttribute(request,"gender", gender);
		
        //Using query parameter to set value of step variable in jsp file.
        response.sendRedirect(request.getContextPath() + "/signUp?step=second");
        
	}
	
	private void handleSecondHalf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		
		
		
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
        
        SessionUtil.setAttribute(request,"password",     password);
      
        
        
        // Redirect to login
//        response.sendRedirect(request.getContextPath() + "/login");
        response.sendRedirect(request.getContextPath() + "/signUp?step=third");
	}
	
	private void handleSignUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String user_first_Name = (String) SessionUtil.getAttribute(request,"firstName");
        String user_last_Name = (String) SessionUtil.getAttribute(request,"lastName");
        String user_email = (String) SessionUtil.getAttribute(request,"email");
        String user_phone_Number = (String) SessionUtil.getAttribute(request,"phoneNumber");
        String user_gender = (String) SessionUtil.getAttribute(request,"gender");
        String user_password = (String) SessionUtil.getAttribute(request,"password");
       
        
        
        Part filePart = request.getPart("profilePhoto");
        byte[] user_img = null;

        if (filePart != null && filePart.getSize() > 0) {
            user_img = filePart.getInputStream().readAllBytes();
        }
        
        SignUpService service = new SignUpService();
        service.adduser(user_first_Name, user_last_Name, user_password, user_email, user_gender, user_img, user_phone_Number);
        
        response.sendRedirect(request.getContextPath() + "/login");
        
        

        SessionUtil.invalidate(request);
	}
}
