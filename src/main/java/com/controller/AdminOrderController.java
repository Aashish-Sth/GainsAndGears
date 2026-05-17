package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.OrderModel;
import com.services.AdminOrderService;
import com.utils.SessionUtil;

/**
 * Servlet implementation class AdminOrderController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/orders" })
public class AdminOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminOrderService service = new AdminOrderService();
        try {
            List<OrderModel> orderList = service.fetchOrders();
            
            request.setAttribute("activeFilter", "all");
            request.setAttribute("orderList", orderList);
            request.setAttribute("totalOrder", service.totalNoOfOrders(orderList));
            request.setAttribute("completedOrders", service.noOfCompletedOrders(orderList));
            request.setAttribute("shippedOrders", service.noOfShippedOrders(orderList));
            request.setAttribute("confirmedOrders", service.noOfConfirmedOrders(orderList));

            request.getRequestDispatcher("/WEB-INF/pages/adminOrder.jsp").forward(request, response);

        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminOrderService service = new AdminOrderService();
        try {
            String updateOrderId = request.getParameter("updateOrderId");
            if (updateOrderId != null && !updateOrderId.isEmpty()) {
                int orderId = Integer.parseInt(updateOrderId);
                String newStatus = request.getParameter("newStatus");
                service.updateOrderStatus(orderId, newStatus);
                request.getSession().setAttribute("successMessage", "Order status updated successfully!");
                response.sendRedirect(request.getContextPath() + "/admin/orders");
                return;
            }

            String filter = request.getParameter("filter");
            if (filter == null || filter.isEmpty()) filter = "all";

            List<OrderModel> allOrders = service.fetchOrders();
            List<OrderModel> filteredList = filter.equals("all") ? allOrders : service.filterOrders(allOrders, filter);

            request.setAttribute("activeFilter", filter);
            request.setAttribute("orderList", filteredList);
            request.setAttribute("totalOrder", service.totalNoOfOrders(allOrders));
            request.setAttribute("completedOrders", service.noOfCompletedOrders(allOrders));
            request.setAttribute("shippedOrders", service.noOfShippedOrders(allOrders));
            request.setAttribute("confirmedOrders", service.noOfConfirmedOrders(allOrders));

            request.getRequestDispatcher("/WEB-INF/pages/adminOrder.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}