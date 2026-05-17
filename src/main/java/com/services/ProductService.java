package com.services;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import com.dao.ProductDAO;
import com.model.ProductModel;


public class ProductService {

    private ProductDAO dao = new ProductDAO();

    public List<ProductModel> getAllProducts() throws ClassNotFoundException {
    	 List<ProductModel> allProducts = dao.getAllProducts();
        return allProducts;
    }

    
    
    public Map<String, List<ProductModel>> getHomePageData() throws ClassNotFoundException {
        List<ProductModel> allProducts = dao.getAllProducts();
        
        List<ProductModel> mens = new ArrayList<>();
        List<ProductModel> womens = new ArrayList<>();
        List<ProductModel> supplements = new ArrayList<>();

     
        for (ProductModel p : allProducts) {
            String cat = (p.getCategory() != null) ? p.getCategory().toLowerCase() : "";
            if (cat.equals("mens")) {
                mens.add(p);
            } else if (cat.equals("womens")) {
                womens.add(p);
            } else if (cat.equals("supplement")) {
                supplements.add(p);
            }
        }

       
        Collections.shuffle(mens);
        Collections.shuffle(womens);
        Collections.shuffle(supplements);

       
        List<ProductModel> newCollections = new ArrayList<>();
        int count = 0;
        for (int i = allProducts.size() - 1; i >= 0 && count < 8; i--) {
            newCollections.add(allProducts.get(i));
            count++;
        }

       
        Map<String, List<ProductModel>> homeData = new HashMap<>();
        homeData.put("mens", mens.subList(0, Math.min(mens.size(), 8)));
        homeData.put("womens", womens.subList(0, Math.min(womens.size(), 8)));
        homeData.put("supplements", supplements.subList(0, Math.min(supplements.size(), 4)));
        homeData.put("newCollections", newCollections);

        return homeData;
    }
    
    public List<ProductModel> getSupplementProducts() throws ClassNotFoundException {
        List<ProductModel> allProducts = dao.getAllProducts();
        List<ProductModel> supplementList = new ArrayList<>();

        if (allProducts != null) {
            for (ProductModel p : allProducts) {
       
                if (p.getCategory() != null && p.getCategory().equalsIgnoreCase("supplement")) {
                    supplementList.add(p);
                }
            }
        }
        return supplementList;
    }
    
    
    public List<ProductModel> getGearProducts() throws ClassNotFoundException {
        List<ProductModel> allProducts = dao.getAllProducts();
        List<ProductModel> gearProducts = new ArrayList<>();

        if (allProducts != null) {
            for (ProductModel p : allProducts) {
                String cat = (p.getCategory() != null) ? p.getCategory().toLowerCase() : "";
                if (cat.equals("mens") || cat.equals("womens")) {
                    gearProducts.add(p);
                }
            }
      
            Collections.shuffle(gearProducts);
        }
        return gearProducts;
    }
    
    public List<ProductModel> getFemaleClothing() throws ClassNotFoundException {
        List<ProductModel> allProducts = dao.getAllProducts();
        List<ProductModel> femaleProducts = new ArrayList<>();

        if (allProducts != null) {
            for (ProductModel p : allProducts) {
                if (p.getCategory() != null && p.getCategory().equalsIgnoreCase("womens")) {
                    femaleProducts.add(p);
                }
            }
        }
        return femaleProducts;
    }
    
    public List<ProductModel> getMaleClothing() throws ClassNotFoundException {
        List<ProductModel> allProducts = dao.getAllProducts();
        List<ProductModel> maleProducts = new ArrayList<>();

        if (allProducts != null) {
            for (ProductModel p : allProducts) {
                if (p.getCategory() != null && p.getCategory().equalsIgnoreCase("mens")) {
                    maleProducts.add(p);
                }
            }
        }
        return maleProducts;
    }
    
    public List<ProductModel> getRecommendedProducts(String category, int currentProductId) throws ClassNotFoundException {
        List<ProductModel> allProducts = dao.getAllProducts();
        List<ProductModel> recommendations = new ArrayList<>();

        if (allProducts != null && category != null) {
            for (ProductModel p : allProducts) {
               
                if (p.getCategory() != null 
                        && p.getCategory().equalsIgnoreCase(category) 
                        && p.getProduct_id() != currentProductId) {
                    recommendations.add(p);
                }
            }
           
            Collections.shuffle(recommendations);
        }
 // Return a maximum of 4 items safely
        return recommendations.subList(0, Math.min(recommendations.size(), 4));
    }
}