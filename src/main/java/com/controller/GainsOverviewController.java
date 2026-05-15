package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;


import com.model.ProductModel;
import com.services.ProductService;

/**
 * Servlet implementation class GainsOverviewController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/gains" })
public class GainsOverviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GainsOverviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
   
            List<ProductModel> supplementProducts = productService.getSupplementProducts();
            
     
            request.setAttribute("supplementProducts", supplementProducts);
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
       
        }


        request.getRequestDispatcher("/WEB-INF/pages/gainsOverview.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO 
		doGet(request, response);
	}

}
