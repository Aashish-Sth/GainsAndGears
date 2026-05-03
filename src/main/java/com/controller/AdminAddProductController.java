package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import com.model.UserModel;
import com.services.AddProductService;
import com.utils.SessionUtil;

/**
 * Servlet implementation class AdminAddProduct
 */
@WebServlet("/admin/products/add")
@MultipartConfig
public class AdminAddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/pages/addProduct.jsp").forward(request, response);
	}
	
	private void setFormData(HttpServletRequest request, String product_name, 
            String category, String product_price_str, String product_brand, String[] attr1, String[] attr2) {
        
        request.setAttribute("product_name", product_name);
        request.setAttribute("category", category);
        request.setAttribute("product_price_str", product_price_str);
        request.setAttribute("product_brand", product_brand);
        request.setAttribute("attr1", attr1 != null ? Arrays.asList(attr1) : new ArrayList<>());
        request.setAttribute("attr2", attr2 != null ? Arrays.asList(attr2) : new ArrayList<>());
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//getting user_id from session
			UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");
			int user_id = loggedInUser.getUser_id();
			
			// getting details from the form
			String product_name = request.getParameter("product_name").trim();
			String category = request.getParameter("product_category");
            String product_price_str = request.getParameter("product_price").trim();
            String product_brand;
            //storing either supplement brand or cloth brand
            if (category.equals("supplement")) {
                product_brand = request.getParameter("product_supplement_brand");
            } else {
                product_brand = request.getParameter("product_cloth_brand");
            }
            Part image = request.getPart("product_image");
            
            //storing attribute_1 and attribute_2
            String[] attr1; 
            String[] attr2;
            
            if (category.equals("supplement")) {
            	attr1 = request.getParameterValues("flavor");
            	attr2 = request.getParameterValues("quantity");
            } else {
            	attr1 = request.getParameterValues("size");
            	attr2 = request.getParameterValues("color");
            }
            
            
            
            //validation
            if (product_name.isBlank() || product_price_str.isBlank() || product_brand == null || product_brand.equals("Select Brand") || image.getSize()==0) {
            	request.setAttribute("error", "All fields are required.");
            	setFormData(request, product_name, category, product_price_str, product_brand, attr1, attr2);
            	request.getRequestDispatcher("/WEB-INF/pages/addProduct.jsp").forward(request, response);
                return;
            }
            
            byte[] product_image = image.getInputStream().readAllBytes();
            
            if (product_name.matches("\\d+")) {
            	request.setAttribute("error", "Product Name must not contain any number.");
            	setFormData(request, product_name, category, product_price_str, product_brand, attr1, attr2);
            	request.getRequestDispatcher("/WEB-INF/pages/addProduct.jsp").forward(request, response);
                return;
            }
            if (!product_price_str.matches("\\d+")) {
            	request.setAttribute("error", "Product price must be a valid number.");
            	setFormData(request, product_name, category, product_price_str, product_brand, attr1, attr2);
            	request.getRequestDispatcher("/WEB-INF/pages/addProduct.jsp").forward(request, response);
                return;
            }
            int product_price = Integer.parseInt(product_price_str);
            
            if (product_price <= 0) {
                request.setAttribute("error", "Product price must be greater than 0.");
                setFormData(request, product_name, category, product_price_str, product_brand, attr1, attr2);
                request.getRequestDispatcher("/WEB-INF/pages/addProduct.jsp").forward(request, response);
                return;
            }
            
            
			
            ArrayList<String> attribute_1 = new ArrayList<>();
            ArrayList<String> attribute_2 = new ArrayList<>();
			
            if (attr1 != null) {
                for (String value : attr1) {
                    attribute_1.add(value);
                }
            }
            if (attr2!= null) {
                for (String value : attr2) {
                    attribute_2.add(value);
                }
            }
            
            // calling addProduct service
            AddProductService service = new AddProductService();
            service.addProduct(user_id, product_name, category, product_price, 
                    product_brand, product_image, attribute_1, attribute_2);        
            
            response.sendRedirect(request.getContextPath() + "/admin/products");
            
		}
		catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/products/add");
	}
}
}
