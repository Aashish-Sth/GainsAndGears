package com.services;

import java.util.List;
import com.dao.ProductDAO;
import com.model.ProductModel;

public class SearchProductService {
    
    private ProductDAO dao = new ProductDAO();

    public List<ProductModel> getSearchResults(String query) throws ClassNotFoundException {
      
        if (query == null || query.trim().isEmpty()) {
            return dao.getAllProducts();
        }

       
        return dao.searchProducts(query.trim());
    }
}