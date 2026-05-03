package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.OrderModel;
import com.model.ProductModel;
import com.model.UserModel;
import com.services.AdminOrderService;
import com.services.AdminProductService;
import com.services.UserService;

/**
 * Servlet implementation class AdminDashBoardController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/DashBoard" })
public class AdminDashBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    public AdminDashBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    UserService userService = new UserService();
    AdminProductService productService = new AdminProductService();
    AdminOrderService orderService = new AdminOrderService();

    try {
        // 1. Fetch User Stats
        List<UserModel> allUsers = userService.getAllUsers();
        request.setAttribute("totalCount", allUsers.size());
        request.setAttribute("activeCount", userService.countActive(allUsers));
        request.setAttribute("inactiveCount", userService.countInactive(allUsers));

        // 2. Fetch Product Stats
        List<ProductModel> productList = productService.getAllProducts();
        request.setAttribute("totalProducts", productService.countAllProducts(productList));
        request.setAttribute("availableProducts", productService.countAvailableProducts(productList));
        request.setAttribute("unavailableProducts", productService.countUnavailableProducts(productList));

        // 3. Fetch Order Stats
        List<OrderModel> orderList = orderService.fetchOrders();
        
        // If it's a dashboard, we just want the numbers, not necessarily a redirect
        if (orderList != null) {
            request.setAttribute("totalOrder", orderService.totalNoOfOrders(orderList));
            request.setAttribute("completedOrders", orderService.noOfCompletedOrders(orderList));
            request.setAttribute("shippedOrders", orderService.noOfShippedOrders(orderList));
            request.setAttribute("confirmedOrders", orderService.noOfConfirmedOrders(orderList));
            request.setAttribute("orderList", orderList);
        } else {
            request.setAttribute("totalOrder", 0);
        }

        // 4. SINGLE FORWARD at the very end
        request.getRequestDispatcher("/WEB-INF/pages/adminDashBoard.jsp").forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
        // Forward to an error page or handle gracefully
        if (!response.isCommitted()) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Dashboard Data Error");
        }
    }
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 }

}
