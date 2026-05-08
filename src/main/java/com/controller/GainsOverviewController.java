package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.dao.ProductDAO;
import com.model.ProductModel;

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        
        try {
            //
            List<ProductModel> allProducts = dao.getAllProducts();
            
           
            List<ProductModel> gainProducts = new ArrayList<>();
            for (ProductModel p : allProducts) {
                String cat = p.getCategory().toLowerCase();
                if (cat.equals("supplement")) {
                	gainProducts.add(p);
                }
            }
            
           
            request.setAttribute("supplementProducts", gainProducts);
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

       
        request.getRequestDispatcher("/WEB-INF/pages/gainsOverview.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
