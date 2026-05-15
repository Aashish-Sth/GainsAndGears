package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.model.UserModel;
import com.services.CartService;
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
         
         
         productService.loadProductIntoRequest(product_id, request);
         reviewService.returnOverview(product_id, request);
         reviewService.returnLatestReviews(product_id, request);
         
		request.getRequestDispatcher("/WEB-INF/pages/gearDetail.jsp").forward(request, response);	
		}catch(Exception e) {
			 e.printStackTrace();
			 response.sendRedirect(request.getContextPath() + "/admin/home");
		}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpSer
	 * vletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
        int user_id = loggedInUser.getUser_id();
		String productIdRaw = request.getParameter("product_id");
		String action = request.getParameter("action");
		
		CartService service = new CartService();
		
		try {
			int product_id = Integer.parseInt(productIdRaw);
			
			if ("cart".equals(action)) {
	            // User clicked "Add to bag"
	            String color = request.getParameter("color");
	            String size = request.getParameter("size");
	            service.addItemToCart(user_id, product_id, size, color);
	        }
			
			if ("wishlist".equals(action)) {
	            // User clicked the Heart
				service.addToWishlist(user_id, product_id);
	        }
		} catch(Exception e) {
	        e.printStackTrace();
	        response.sendRedirect(request.getContextPath() + "/home");
	        return;
	    }
		response.sendRedirect(request.getContextPath() + "/product/detail?id=" + productIdRaw);
	}
}


