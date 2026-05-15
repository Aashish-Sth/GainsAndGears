package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.model.ProductModel;
import com.model.UserModel;
import com.services.CartService;
import com.services.ProductService;
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
         
         ProductService generalProductService = new ProductService();
         productService.loadProductIntoRequest(product_id, request);
         
         ProductModel currentProduct = (ProductModel) request.getAttribute("product");
         
         if (currentProduct != null) {
             
             List<ProductModel> recommendedList = generalProductService.getRecommendedProducts(
                 currentProduct.getCategory(), 
                 product_id
             );
           
             request.setAttribute("products", recommendedList);
         }
         
 		int user_id = loggedInUser.getUser_id();
         
    
         reviewService.returnOverview(product_id, request);
         reviewService.returnLatestReviews(product_id, user_id, request);
         Boolean reviewDone =reviewService.retriveUserReview(product_id, user_id, request);
         request.setAttribute("reviewDone", reviewDone);
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
		double rating = Double.parseDouble(request.getParameter("rating"));
		String action = request.getParameter("action");
		
		if (review_description == null || review_description.trim().isEmpty()) {
		    request.setAttribute("errorMessage", "Review cannot be empty.");
		    request.setAttribute("persistedReview", review_description);
		    request.setAttribute("persistedRating", rating);
		    doGet(request, response);
		    return;
		}
		if (rating == 0) {
		    request.setAttribute("errorMessage", "Please select a star rating.");
		    request.setAttribute("persistedReview", review_description);
		    request.setAttribute("persistedRating", rating);
		    doGet(request, response);
		    return;
		}
		
		
		ReviewService service = new ReviewService();
			
		if ("addReview".equals(action)) {
		Boolean success=service.addReview(user_id, productId, review_description, rating);
		if(success) {
			  request.getSession().setAttribute("successMessage","Your review was sucessfully submitted");
			  response.sendRedirect(request.getContextPath() + "/product/detail?id=" + productId);	
		}
		}else if("editReview".equals(action)) {
			service.updateReview(user_id, productId, review_description, rating);
			 request.getSession().setAttribute("successMessage","Your review was sucessfully updated");
			  response.sendRedirect(request.getContextPath() + "/product/detail?id=" + productId);	
		}
		
	}
}


