package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.ProductModel;
import com.services.AdminProductService;

/**
 * Servlet implementation class AdminProductController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/products" })
public class AdminProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

	        request.getRequestDispatcher("/WEB-INF/pages/adminProduct.jsp").forward(request, response);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			AdminProductService service = new AdminProductService();
			
			//calling service method
			List<ProductModel> allproducts = service.getAllProducts();
	        String search = request.getParameter("search");
	        
	        
	        List<ProductModel> list = service.filterProducts(allproducts, search);
			
	        request.setAttribute("productList", list);
	        request.setAttribute("searchedName", search); 
	        
	        
	        int product_id = Integer.parseInt(request.getParameter("product_id"));
	        boolean newStatus = Boolean.parseBoolean(request.getParameter("status"));

	        
	        boolean isUpdated = service.updateStatus(product_id, newStatus);
	        if (isUpdated) {
                response.sendRedirect(request.getContextPath() + "/admin/products?success=true");
                return; 
            }
	        
	        response.sendRedirect(request.getContextPath() + "/admin/products");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}
