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
 * Servlet implementation class ExploreController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/explore" })
public class ExploreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExploreController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
           
            List<ProductModel> younglaProducts = productService.getYounglaProducts();
            List<ProductModel> gymsharkProducts = productService.getGymsharkProducts();
            
            request.setAttribute("younglaProducts", younglaProducts);
            request.setAttribute("gymsharkProducts", gymsharkProducts);
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/pages/explore.jsp").forward(request, response);
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
