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
		List <OrderModel> orderList = service.fetchOrders();
		if(orderList == null) {
			response.sendRedirect(request.getContextPath() + "/admin/orders?state=empty");
		}
		else
		{
		int totalOrders = service.totalNoOfOrders(orderList);
		int completedOrders = service.noOfCompletedOrders(orderList);
		int shippedOrders = service.noOfShippedOrders(orderList);
		int confirmedOrders = service.noOfConfirmedOrders(orderList);
		
		request.setAttribute("activeFilter", "all");
		request.setAttribute("orderList", orderList);
		request.setAttribute("totalOrder", totalOrders);
		request.setAttribute("completedOrders", completedOrders);
		request.setAttribute("shippedOrders", shippedOrders);
		request.setAttribute("confirmedOrders", confirmedOrders);
		
		
		
		request.getRequestDispatcher("/WEB-INF/pages/adminOrder.jsp").forward(request, response);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminOrderService service = new AdminOrderService();
		
		try {
			String filter = request.getParameter("filter");
			if(filter == null || filter.isEmpty()) {
				filter = "all";
			}
			List <OrderModel> OrderList = service.fetchOrders();
			
			if(OrderList == null || OrderList.isEmpty()) {
				response.sendRedirect(request.getContextPath() + "/admin/orders?state=empty");
				return;
			}
			
			List <OrderModel> filteredList;
			
			if(filter.equals("all")) {
				filteredList = OrderList;
			}
			else {
				filteredList = service.filterOrders(OrderList, filter);
			}
			
			 request.setAttribute("activeFilter", filter);
	         request.setAttribute("orderList", filteredList);
	         request.setAttribute("totalOrder", service.totalNoOfOrders(OrderList));
	         request.setAttribute("completedOrders", service.noOfCompletedOrders(OrderList));
	         request.setAttribute("shippedOrders", service.noOfShippedOrders(OrderList));
	         request.setAttribute("confirmedOrders", service.noOfConfirmedOrders(OrderList));
	         
	         request.getRequestDispatcher("/WEB-INF/pages/adminOrder.jsp").forward(request, response);

		} catch (Exception e) {
            e.printStackTrace();
        }
	}

}
