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
 * Servlet implementation class CartController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/cart" })
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
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
 			
 			// Store results in Session so they are visible in navbar.jsp on all pages
 			HttpSession session = request.getSession();
 			session.setAttribute("cartItems", cartItems);
 			session.setAttribute("wishlistItems", wishlistItems);
 			session.setAttribute("cartTotal", final_total);
 	        
 		} catch (Exception e) {
 	        e.printStackTrace();
 	    }
		
		request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
 		int user_id = loggedInUser.getUser_id();
 		
        String action = request.getParameter("action");
        

        CartService service = new CartService();
        
        String referer = request.getHeader("Referer");
        HttpSession session = request.getSession();

        try {
        	//increase the product quantity
        	if ("increase".equals(action)) {
        		int variant_id = Integer.parseInt(request.getParameter("variantId"));
                service.increaseQuantity(user_id, variant_id);
               
            } 
        	//decrease the product quantity
        	if ("decrease".equals(action)) {
        		int variant_id = Integer.parseInt(request.getParameter("variantId"));
                service.decreaseQuantity(user_id, variant_id);
               
            } 
        	//Remove the product from the bag
        	if ("remove".equals(action)) {
        		int variant_id = Integer.parseInt(request.getParameter("variantId"));
                service.removeFromCart(user_id, variant_id);
               
            } 
        	//Remove the product from the wishlist
        	if ("removeWishlist".equals(action)) {
        		int product_id = Integer.parseInt(request.getParameter("productId"));
                service.removeFromWishlist(user_id, product_id);
                
            } 
        	
        	
        	
            if ("cart".equals(action)) {
                // User clicked "Add to bag"
            	int product_id = Integer.parseInt(request.getParameter("id"));
                String attribute2 = request.getParameter("attribute2");
                String attribute1 = request.getParameter("attribute1");
                
                if (attribute1 == null || attribute2 == null) {
                    request.getSession().setAttribute("errorMessage", "Please select size and color/flavor.");
                    response.sendRedirect(request.getContextPath() + "/product/detail?id=" + product_id);
                    return;
                }
                
                boolean success = service.addItemToCart(user_id, product_id, attribute1, attribute2);
                if (success) {
                    request.getSession().setAttribute("successMessage", "Item added to bag successfully!");
                } else {
                    request.getSession().setAttribute("successMessage", "Please select all options before adding to bag.");
                }
            }

            if ("wishlist".equals(action)) {
            	int product_id = Integer.parseInt(request.getParameter("id"));
                // User clicked the wishlist 
            	if (service.isInWishlist(user_id, product_id)) {
                    service.removeFromWishlist(user_id, product_id);
                    request.getSession().setAttribute("successMessage", "Removed from wishlist!");
                } else {
                    service.addToWishlist(user_id, product_id);
                    request.getSession().setAttribute("successMessage", "Added to wishlist!");
                }
            }
            
            // User clicked the buy bow button
            if ("buyNow".equals(action)) {
                int product_id = Integer.parseInt(request.getParameter("id"));
                String attribute2 = request.getParameter("attribute2");
                String attribute1 = request.getParameter("attribute1");

                if (attribute1 == null || attribute2 == null) {
                    request.getSession().setAttribute("errorMessage", "Please select size and color/flavor.");
                    response.sendRedirect(request.getContextPath() + "/product/detail?id=" + product_id);
                    return;
                }

                service.addItemToCart(user_id, product_id, attribute1, attribute2);
                session.setAttribute("cartOpen", true);
            }
            
            //refreshing session data
            List<CartItemModel> updatedCart = service.getCartItems(user_id);
            List<CartItemModel> updatedWish = service.getWishlistItems(user_id);
            int new_total = 0;
            for (CartItemModel item : updatedCart) {
                int lineTotal = (int)item.getProduct_price() * (int)item.getQuantity();
                item.setTotal(lineTotal);
                new_total += lineTotal;
            }
            
            
            session.setAttribute("cartItems", updatedCart);
            session.setAttribute("wishlistItems", updatedWish);
            session.setAttribute("cartTotal", new_total);
            
            // Keep cart open after any cart action
            if ("increase".equals(action) || "decrease".equals(action) 
            	    || "remove".equals(action) || "removeWishlist".equals(action)) {
            	    session.setAttribute("cartOpen", true);
            	}
            
            if (referer != null && !referer.isEmpty()) {
                response.sendRedirect(referer);
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }

            
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/home");
        }
	}

}
