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

    /**
     * Business Logic: Get all products and filter for supplements
     */
    
    
    
    public Map<String, List<ProductModel>> getHomePageData() throws ClassNotFoundException {
        List<ProductModel> allProducts = dao.getAllProducts();
        
        List<ProductModel> mens = new ArrayList<>();
        List<ProductModel> womens = new ArrayList<>();
        List<ProductModel> supplements = new ArrayList<>();

        // 1. Sort into Categories
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

        // 2. Shuffle for Randomness
        Collections.shuffle(mens);
        Collections.shuffle(womens);
        Collections.shuffle(supplements);

        // 3. Get New Collections (last 8 added)
        List<ProductModel> newCollections = new ArrayList<>();
        int count = 0;
        for (int i = allProducts.size() - 1; i >= 0 && count < 8; i--) {
            newCollections.add(allProducts.get(i));
            count++;
        }

        // 4. Wrap everything in a Map to return multiple lists at once
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
    public List<ProductModel> getGymsharkProducts() throws ClassNotFoundException {
        List<ProductModel> allProducts = dao.getAllProducts();
        List<ProductModel> gymsharkProducts = new ArrayList<>();

        if (allProducts != null) {
            for (ProductModel p : allProducts) {

                if (p.getProduct_brand() != null &&
                    p.getProduct_brand().equalsIgnoreCase("gymshark")) {

                    gymsharkProducts.add(p);
                }
            }

            Collections.shuffle(gymsharkProducts);
        }

        return gymsharkProducts.subList(0, Math.min(gymsharkProducts.size(), 8));
    }
    public List<ProductModel> getYounglaProducts() throws ClassNotFoundException {
        List<ProductModel> allProducts = dao.getAllProducts();
        List<ProductModel> younglaProducts = new ArrayList<>();

        if (allProducts != null) {
            for (ProductModel p : allProducts) {

                if (p.getProduct_brand() != null &&
                    p.getProduct_brand().equalsIgnoreCase("youngla")) {

                    younglaProducts.add(p);
                }
            }

            Collections.shuffle(younglaProducts);
        }

        return younglaProducts.subList(0, Math.min(younglaProducts.size(), 8));
    }
}