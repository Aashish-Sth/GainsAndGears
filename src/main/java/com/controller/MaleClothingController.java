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
 * Servlet implementation class GearsOverviewController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/male" })
public class MaleClothingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MaleClothingController() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        
        try {
   
            List<ProductModel> allProducts = dao.getAllProducts();
            
       
            List<ProductModel> gearProducts = new ArrayList<>();
            for (ProductModel p : allProducts) {
                String cat = p.getCategory().toLowerCase();
                if (cat.equals("mens")) {
                    gearProducts.add(p);
                }
            }
            
            request.setAttribute("products", gearProducts);
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        // Forward to your JSP
        request.getRequestDispatcher("/WEB-INF/pages/maleClothing.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
