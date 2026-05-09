package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import com.services.UpdateProductService;

/**
 * Servlet implementation class AdminUpdateProductController
 */
@MultipartConfig
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/products/update" })
public class AdminUpdateProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {			
            int product_id = Integer.parseInt(request.getParameter("id"));
            UpdateProductService service = new UpdateProductService();
            
            service.loadProductIntoRequest(product_id, request);
            request.getRequestDispatcher("/WEB-INF/pages/updateProduct.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/products");
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productId = Integer.parseInt(request.getParameter("product_id"));
        String productName = request.getParameter("product_name");
        String productCategory = request.getParameter("product_category");
        String productBrand;
        
        if (productCategory.equals("supplement")) {
            String brand = request.getParameter("product_supplement_brand");
            productBrand = (brand != null) ? brand : "";
        } else {
            String brand = request.getParameter("product_cloth_brand");
            productBrand = (brand != null) ? brand : "";
        }
        
        int productPrice = 0;
        //
        try {
            productPrice = Integer.parseInt(request.getParameter("product_price").trim());
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        List<String> attr1 = new ArrayList<>();
        List<String> attr2 = new ArrayList<>();

        if (productCategory.equals("supplement")) {
        	String[] flavors = request.getParameterValues("flavor");
            String[] quantities = request.getParameterValues("quantity");
            if (flavors != null) {
            	for (String value : flavors) {
            		attr1.add(value);
            	}
            }
            if (quantities != null) {
            	for (String value : quantities) {
            		attr2.add(value);
            	}
            }
            
        } 
        else {
        	String[] sizes = request.getParameterValues("size");
            String[] colors = request.getParameterValues("color");
            if (sizes  != null) {
            	for (String value : sizes) {
            		attr1.add(value);
            	}
            }
            if (colors != null) {
            	for (String value : colors) {
            		attr2.add(value);
            	}
            }
        }
        

        byte[] imageBytes = null;
        Part filePart = request.getPart("product_image");
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream is = filePart.getInputStream()) {
                imageBytes = is.readAllBytes();
            }
        }

        UpdateProductService service = new UpdateProductService();

        boolean productUpdated = service.updateProduct(productId, productName, productPrice, productCategory, productBrand, imageBytes);

        boolean variantsUpdated = true;
        
        if (!attr1.isEmpty() && !attr2.isEmpty()) {
            variantsUpdated = service.replaceVariants(productId, attr1, attr2);
        }
        
        if (productUpdated && variantsUpdated) {
            response.sendRedirect(request.getContextPath() + "/admin/products");
        } else {
            try {
                service.loadProductIntoRequest(productId, request);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("error", "Failed to update product. Please try again.");
            request.setAttribute("editMode", true);
            request.getRequestDispatcher("/WEB-INF/pages/updateProduct.jsp").forward(request, response);
        }
    }

}
