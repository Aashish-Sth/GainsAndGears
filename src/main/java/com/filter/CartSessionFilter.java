package com.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.model.CartItemModel;
import com.model.UserModel;
import com.services.CartService;

/**
 * Servlet Filter implementation class CartSessionFilter
 */
@WebFilter("/*")
public class CartSessionFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public CartSessionFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession(false);

        if (session != null) {
            UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");

            // If user is logged in but cart isn't loaded yet
            if (loggedInUser != null && session.getAttribute("cartItems") == null) {
                try {
                    CartService cartService = new CartService();
                    int user_id = loggedInUser.getUser_id();

                    List<CartItemModel> cartItems = cartService.getCartItems(user_id);
                    List<CartItemModel> wishlistItems = cartService.getWishlistItems(user_id);
                    int final_total = 0;
         			
         			for (CartItemModel item : cartItems) {
         				int price = (int)item.getProduct_price();
         				int quantity = (int)item.getQuantity();
         				
         	            int total = price * quantity;
         	            item.setTotal(total);
         	            final_total += total;
         	        }

                    session.setAttribute("cartItems", cartItems);
                    session.setAttribute("wishlistItems", wishlistItems);
                    session.setAttribute("cartTotal", final_total);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        chain.doFilter(request, response);
    }

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
