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
import com.services.OrderService;
import com.utils.SessionUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/Checkout" })
public class CheckoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
        int user_id = loggedInUser.getUser_id();

        // Load fresh cart items
        CartService cartService = new CartService();
        try {
            List<CartItemModel> cartItems = cartService.getCartItems(user_id);
            int subTotal = 0;
            for (CartItemModel item : cartItems) {
                int total = (int) item.getProduct_price() * item.getQuantity();
                item.setTotal(total);
                subTotal += total;
            }
            int shipping = cartItems.isEmpty() ? 0 : 399;
            int grandTotal = subTotal + shipping;

            request.setAttribute("cartItems", cartItems);
            request.setAttribute("subTotal", subTotal);
            request.setAttribute("shipping", shipping);
            request.setAttribute("grandTotal", grandTotal);
            request.setAttribute("user", loggedInUser);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/pages/checkout.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
        int user_id = loggedInUser.getUser_id();

        String district      = request.getParameter("district");
        String address       = request.getParameter("address");
        String landmark      = request.getParameter("landmark");
        String paymentMethod = request.getParameter("paymentMethod");

        // Basic validation
        if (district == null || district.trim().isEmpty() ||
            address  == null || address.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please fill in all required fields.");
            doGet(request, response);
            return;
        }

        CartService cartService = new CartService();
        try {
            List<CartItemModel> cartItems = cartService.getCartItems(user_id);
            if (cartItems.isEmpty()) {
                request.setAttribute("errorMessage", "Your cart is empty.");
                doGet(request, response);
                return;
            }

            int subTotal = 0;
            for (CartItemModel item : cartItems) {
                int total = (int) item.getProduct_price() * item.getQuantity();
                item.setTotal(total);
                subTotal += total;
            }
            int shipping   = 399;
            int grandTotal = subTotal + shipping;

            OrderService orderService = new OrderService();
            int orderId = orderService.placeOrder(user_id, district, address,
                                                   landmark, paymentMethod,
                                                   grandTotal, cartItems);
            if (orderId != -1) {
                SessionUtil.setAttribute(request, "cartItems", null);
                SessionUtil.setAttribute(request, "cartTotal", 0);
                response.sendRedirect(request.getContextPath() + "/home?msg=orderplaced");
            } else {
                request.setAttribute("errorMessage", "Something went wrong. Please try again.");
                doGet(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}