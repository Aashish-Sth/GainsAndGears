package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.services.ReviewService;

/**
 * Servlet implementation class AllReviews
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/allReviews" })
public class AllReviews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllReviews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService service = new ReviewService();
		 int product_id = Integer.parseInt(request.getParameter("id"));
		 request.setAttribute("productId", product_id);
		 String starValue = request.getParameter("star"); 
		 if (starValue != null && !starValue.isEmpty()) {
		        int star = Integer.parseInt(starValue);
		        service.filterReviews(product_id, star, request);
		        request.setAttribute("activeStar", starValue);
		    } else {
		        service.returnAllReviews(product_id, request);
		        request.setAttribute("activeStar", "all");
		    }
		 
		 service.returnOverview(product_id, request);
		 request.getRequestDispatcher("/WEB-INF/pages/allReviews.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
