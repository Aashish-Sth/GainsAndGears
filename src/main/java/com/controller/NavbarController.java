package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.model.CartItemModel;
import com.model.UserModel;
import com.services.CartService;
import com.utils.SessionUtil;

/**
 * Servlet implementation class navbarController
 */
@WebServlet("/navbar")
public class NavbarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NavbarController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartService service = new CartService();
		UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
 		int user_id = loggedInUser.getUser_id();
		
 		try {
 			List<CartItemModel> cartItems = service.getCartItems(user_id);
 			List<CartItemModel> wishlistItems = service.getWishlistItems(user_id);
 			int final_total = 0;
 			
 			for (CartItemModel item : cartItems) {
 				int price = (int)item.getProduct_price();
 				int quantity = (int)item.getQuantity();
 				
 	            int total = price * quantity;
 	            item.setTotal(total);
 	            final_total += total;
 	        }
 			
 			HttpSession session = request.getSession();
            session.setAttribute("cartItems", cartItems);
            session.setAttribute("wishlistItems", wishlistItems);
            session.setAttribute("cartTotal", final_total);
            session.removeAttribute("cartOpen");
 		} catch (Exception e) {
 	        e.printStackTrace();
 	    }
		request.getRequestDispatcher("/WEB-INF/pages/navbar.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
