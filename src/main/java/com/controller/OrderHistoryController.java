package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.model.UserModel;
import com.services.OrderHistoryService;
import com.utils.SessionUtil;


/**
 * Servlet implementation class OrderHistoryController
 */
@WebServlet("/OrderHistory")
public class OrderHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
        int user_id = loggedInUser.getUser_id();

        OrderHistoryService service = new OrderHistoryService();
        String filter = request.getParameter("filter");

        if (filter != null && !filter.equals("all")) {
            service.fetchUserOrdersByStatus(user_id, filter, request);
        } else {
            service.fetchUserOrders(user_id, request);
        }

        String activeFilter = (filter != null && !filter.isEmpty()) ? filter : "all";
        request.setAttribute("activeFilter", activeFilter);
        request.setAttribute("pageKey", "orders");
        request.getRequestDispatcher("/WEB-INF/pages/orderhistory.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
