package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.model.OrderSummaryModel;
import com.services.OrderSummaryService;

/**
 * Servlet implementation class AdminOrderDetail
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/orders/detail" })
public class AdminOrderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 String orderIdParam = request.getParameter("orderId");
		 if (orderIdParam == null || orderIdParam.isEmpty()) {
		        response.sendRedirect(request.getContextPath() + "/admin/orders");
		        return;
		 }
		 
		    int orderId = Integer.parseInt(request.getParameter("orderId"));
		    OrderSummaryService service = new OrderSummaryService();
		    OrderSummaryModel order = service.retriveOrderSummary(orderId);
		    
		    request.setAttribute("order", order);
		    request.getRequestDispatcher("/WEB-INF/pages/adminOrderDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
