package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.ProductModel;
import com.model.UserModel;
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
		// TODO Auto-generated method stub

	 UserService userService = new UserService();
     List<UserModel> allUsers = userService.getAllUsers();
     
     request.setAttribute("totalCount", allUsers.size());
     request.setAttribute("activeCount", userService.countActive(allUsers));
     request.setAttribute("inactiveCount", userService.countInactive(allUsers));
     
     try {
			
			AdminProductService service = new AdminProductService();
			
	        List<ProductModel> productList = service.getAllProducts(); 

	        int totalProducts = service.countAllProducts(productList);
	        int availableProducts = service.countAvailableProducts(productList);
	        int unavailableProducts  = service.countUnavailableProducts(productList);

	        request.setAttribute("productList", productList);
	        request.setAttribute("totalProducts", totalProducts);
	        request.setAttribute("availableProducts", availableProducts);
	        request.setAttribute("unavailableProducts", unavailableProducts);

	      
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
	

     request.getRequestDispatcher("/WEB-INF/pages/adminDashBoard.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 }

}
