package com.services;


import java.util.List;

import com.dao.UpdateProductDAO;
import com.model.ProductModel;

import jakarta.servlet.http.HttpServletRequest;

public class UpdateProductService {
	public void loadProductIntoRequest(int product_id, HttpServletRequest request) throws Exception {
        UpdateProductDAO dao = new UpdateProductDAO();
        ProductModel product = dao.getProductById(product_id);
        List<String> attr1   = dao.getAttr1Values(product_id);
        List<String> attr2   = dao.getAttr2Values(product_id);
        request.setAttribute("product", product);
        request.setAttribute("attr1", attr1);
        request.setAttribute("attr2", attr2);
    }

    public boolean updateProduct(int product_id, String product_name, int product_price,
            String category, String product_brand, byte[] product_image) {
        UpdateProductDAO dao = new UpdateProductDAO();
        try {
            dao.updateProduct(product_id, product_name, product_price, category, product_brand, product_image);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean replaceVariants(int product_id, List<String> attr1, List<String> attr2) {
        UpdateProductDAO dao = new UpdateProductDAO();
        try {
            dao.replaceVariants(product_id, attr1, attr2);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
}
