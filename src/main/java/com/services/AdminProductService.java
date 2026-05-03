package com.services;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.AdminProductDAO;
import com.model.ProductModel;

public class AdminProductService {
	
	AdminProductDAO dao = new AdminProductDAO();

    public List<ProductModel> getAllProducts() throws Exception {
    	ResultSet rs = dao.getAllProducts();
        List<ProductModel> productList = new ArrayList<>();

    	

        while (rs.next()) {
            ProductModel product = new ProductModel();
            
            product.setProduct_id(rs.getInt("product_id"));
            product.setProduct_name(rs.getString("product_name"));
            product.setProduct_price(rs.getInt("product_price"));
            product.setCategory(rs.getString("category"));
            product.setHas_been_deleted(rs.getBoolean("has_been_deleted"));
            productList.add(product);
        }
        return productList;
    }
    
    
    //function to filter from the search bar
    public List<ProductModel> filterProducts(List<ProductModel> allProducts, String search) {
        
        //if the search bar is empty, display every products
        if (search == null || search.trim().isEmpty()) {
            return allProducts;
        }

        //to make the searched string to lower case
        String lowerSearch = search.toLowerCase().trim();

        
        List<ProductModel> filteredList = new ArrayList<>();
        
        for (ProductModel product : allProducts) {
            
            String product_name = product.getProduct_name().toLowerCase();

            //checking if the search string matches 
            if (product_name.contains(lowerSearch)) {
                filteredList.add(product);
            }
        }

        return filteredList;
    }
    
    //function to count all the products
    public int countAllProducts(List<ProductModel> productList) {
        return productList.size();
    }

    //function to count all the available products
    public int countAvailableProducts(List<ProductModel> productList) {
        int count = 0;
        for (ProductModel product : productList) {
            if (!product.getHas_been_deleted()) {
                count++;
            }
        }
        return count;
    }

    //function to count all the unavailable products
    public int countUnavailableProducts(List<ProductModel> productList) {
        int count = 0;
        for (ProductModel product : productList) {
            if (product.getHas_been_deleted()) {
                count++;
            }
        }
        return count;
    }

    public boolean updateStatus(int product_id, boolean has_been_deleted) throws Exception {
        return dao.updateStatus(product_id, has_been_deleted);
    }
}