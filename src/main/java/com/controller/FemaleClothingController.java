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


@WebServlet(asyncSupported = true, urlPatterns = { "/female" })
public class FemaleClothingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            
            List<ProductModel> femaleProducts = productService.getFemaleClothing();
            
        
            request.setAttribute("products", femaleProducts);
            
        } catch (ClassNotFoundException e) {
        	
            e.printStackTrace();
        }


        request.getRequestDispatcher("/WEB-INF/pages/femaleClothing.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}