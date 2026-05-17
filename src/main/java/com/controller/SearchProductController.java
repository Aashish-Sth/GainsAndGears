package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.ProductModel;

import com.services.SearchProductService;


@WebServlet("/result")
public class SearchProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SearchProductService searchProductService = new SearchProductService();
        
    
     
        String searchQuery = request.getParameter("search");
        
        List<ProductModel> serachResultList = null;
		try {
			serachResultList = searchProductService.getSearchResults(searchQuery);;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     
        request.setAttribute("productList", serachResultList);
        request.setAttribute("searchedName", searchQuery); 
     
      
        

        request.getRequestDispatcher("/WEB-INF/pages/SearchProductResult.jsp").forward(request, response);
    }
}