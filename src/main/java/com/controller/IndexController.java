package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.dao.ProductDAO;
import com.model.ProductModel;

/**
 * Servlet implementation class IndexController
 */

@WebServlet("/home")
public class IndexController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        ProductDAO dao = new ProductDAO();
        
        try {
            List<ProductModel> allProducts = dao.getAllProducts();
            
            // 1. Sort into Categories (Simple If/Else)
            List<ProductModel> mens = new ArrayList<>();
            List<ProductModel> womens = new ArrayList<>();
            List<ProductModel> supplements = new ArrayList<>();

            for (ProductModel p : allProducts) {
                String cat = p.getCategory().toLowerCase();
                if (cat.equals("mens")) {
                    mens.add(p);
                } else if (cat.equals("womens")) {
                    womens.add(p);
                } else if (cat.equals("supplement")) {
                    supplements.add(p);
                }
            }

            // 2. Shuffle for Randomness
            Collections.shuffle(mens);
            Collections.shuffle(womens);
            Collections.shuffle(supplements);

            // 3. NEW COLLECTIONS: Get the last 8 items added
            // Instead of complex sorting, we just take the items from the end of the original list
            List<ProductModel> newCollections = new ArrayList<>();
            
            // We start from the very last index and count backwards 8 times
            int count = 0;
            for (int i = allProducts.size() - 1; i >= 0 && count < 8; i--) {
                newCollections.add(allProducts.get(i));
                count++;
            }

            // 4. Send everything to JSP
            request.setAttribute("mensProducts", mens.subList(0, Math.min(mens.size(), 8)));
            request.setAttribute("womensProducts", womens.subList(0, Math.min(womens.size(), 8)));
            request.setAttribute("supplementProducts", supplements.subList(0, Math.min(supplements.size(), 4)));
            request.setAttribute("newCollections", newCollections);

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }
}