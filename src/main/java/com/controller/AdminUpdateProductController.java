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

        String productName     = request.getParameter("product_name");
        String productCategory = request.getParameter("product_category");
        String productBrand    = resolveBrand(request, productCategory);

        int productPrice = 0;
        try {
            productPrice = Integer.parseInt(request.getParameter("product_price").trim());
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        List<String> attr1;
        List<String> attr2;

        if ("supplement".equals(productCategory)) {
            attr1 = toList(request.getParameterValues("flavor"));
            attr2 = toList(request.getParameterValues("quantity"));
        } else {
            attr1 = toList(request.getParameterValues("size"));
            attr2 = toList(request.getParameterValues("color"));
        }

        byte[] imageBytes = null;
        Part filePart = request.getPart("product_image");
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream is = filePart.getInputStream()) {
                imageBytes = is.readAllBytes();
            }
        }

        UpdateProductService service = new UpdateProductService();

        boolean productUpdated  = service.updateProduct(
                productId, productName, productPrice,
                productCategory, productBrand, imageBytes);

        boolean variantsUpdated = true;
        if (!attr1.isEmpty() && !attr2.isEmpty()) {
            variantsUpdated = service.replaceVariants(productId, attr1, attr2);
        }
        
        if (productUpdated && variantsUpdated) {
            response.sendRedirect(
                    request.getContextPath() + "/admin/products");
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

	private String resolveBrand(HttpServletRequest request, String category) {
        if ("supplement".equals(category)) {
            String b = request.getParameter("product_supplement_brand");
            return (b != null && !b.isEmpty()) ? b : "";
        } else {
            String b = request.getParameter("product_cloth_brand");
            return (b != null && !b.isEmpty()) ? b : "";
        }
    }

    private List<String> toList(String[] values) {
        if (values == null || values.length == 0) return Collections.emptyList();
        return Arrays.stream(values).collect(Collectors.toList());
    }

}
