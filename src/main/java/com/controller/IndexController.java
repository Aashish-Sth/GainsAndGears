package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import java.util.Map;


import com.model.ProductModel;
import com.services.ProductService;

/**
 * Servlet implementation class IndexController
 */

@WebServlet("/home")
public class IndexController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
        
            Map<String, List<ProductModel>> homeData = productService.getHomePageData();
            
  
            request.setAttribute("mensProducts", homeData.get("mens"));
            request.setAttribute("womensProducts", homeData.get("womens"));
            request.setAttribute("supplementProducts", homeData.get("supplements"));
            request.setAttribute("newCollections", homeData.get("newCollections"));

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }
}