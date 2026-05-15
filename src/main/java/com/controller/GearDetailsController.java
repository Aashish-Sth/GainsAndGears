package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.UserModel;
import com.services.ReviewService;
import com.services.UpdateProductService;
import com.utils.SessionUtil;

/**
 * Servlet implementation class GearDetails
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/product/detail" })
public class GearDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GearDetailsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		 int product_id = Integer.parseInt(request.getParameter("id"));
         UpdateProductService productService = new UpdateProductService();
         ReviewService reviewService = new ReviewService();
         UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
 		int user_id = loggedInUser.getUser_id();
         
         productService.loadProductIntoRequest(product_id, request);
         reviewService.returnOverview(product_id, request);
         reviewService.returnLatestReviews(product_id, user_id, request);
         reviewService.retriveUserReview(product_id, user_id, request);
		request.getRequestDispatcher("/WEB-INF/pages/gearDetail.jsp").forward(request, response);	
		}catch(Exception e) {
			 e.printStackTrace();
			}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpSer
	 * vletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
		int user_id = loggedInUser.getUser_id();
		int productId = Integer.parseInt(request.getParameter("id"));
		String review_description = request.getParameter("newReview");
		int rating = Integer.parseInt(request.getParameter("rating"));
		
		ReviewService service = new ReviewService();
		Boolean success=service.addReview(user_id, productId, review_description, rating);
		if(success) {
			  request.getSession().setAttribute("successMessage","Your review was sucessfully submitted");
		}
		response.sendRedirect(request.getContextPath() + "/product/detail?id=" + productId);
		
	}

}
