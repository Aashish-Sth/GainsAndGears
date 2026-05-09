package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.model.UserModel;
import com.utils.ImageUtil;
import com.utils.SessionUtil;
import com.services.UpdateProfileService;

/**
 * Servlet implementation class UserprofileController
 */
@WebServlet("/user")
@MultipartConfig
public class UserprofileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserprofileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/userprofile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//retriving the current session object and downcasting it
		UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
		
		
		
		String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        
        //retriving current image path from session
        String user_img = loggedInUser.getUser_img();
        
        
        //checking and acting acordingly if new image exist
        Part filePart = request.getPart("updateProfilePhoto");
        if (filePart != null && filePart.getSize() > 0) {
            ImageUtil imageUtil = new ImageUtil();
            String rootPath = request.getServletContext().getRealPath("/uploads/");
            String fileName = imageUtil.getImageNameFromPart(filePart);
            boolean uploaded = imageUtil.uploadImage(filePart, rootPath, fileName);
            if (uploaded) {
                user_img = fileName; 
            }
        }
        String actual_mail = loggedInUser.getUser_email();
        
        UpdateProfileService service = new UpdateProfileService();
        
        boolean success = service.updateUserDetails(firstName, lastName, email,
                phone, gender, user_img, actual_mail);
        if (success) {
        
            loggedInUser.setUser_first_name(firstName);
            loggedInUser.setUser_last_name(lastName);
            loggedInUser.setUser_email(email);
            loggedInUser.setUser_phone_number(phone);
            loggedInUser.setUser_gender(gender);
            loggedInUser.setUser_img(user_img);

            // updating the session with the bewky updated values
            SessionUtil.setAttribute(request, "loggedInUser", loggedInUser);
            SessionUtil.setAttribute(request, "user_email", email); 

            response.sendRedirect(request.getContextPath() + "/user");
        } else {
            request.setAttribute("errorMessage", "Failed to update profile.");
            request.getRequestDispatcher("/WEB-INF/pages/userprofile.jsp").forward(request, response);
        }
	
	}
}