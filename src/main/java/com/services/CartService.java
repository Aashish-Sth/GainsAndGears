package com.services;

import java.util.List;

import com.dao.CartDAO;
import com.model.CartItemModel;

public class CartService {
	CartDAO dao = new CartDAO();
	
	// Adds item to cart via DAO
	public boolean addItemToCart(int userId, int productId, String attr1, String attr2) {
        return dao.addToCart(userId, productId, attr1, attr2);
    }
	
	// Adds item to wishlist via DAO
	public boolean addToWishlist(int userId, int productId) {
        return dao.addToWishlist(userId, productId);
    }
	
	public boolean isInWishlist(int userId, int productId) {
	    return dao.isInWishlist(userId, productId);
	}
	
    // Gets list of cart items
	public List<CartItemModel> getCartItems(int userId) throws Exception {
        return dao.getCartItem(userId);
    }

	// Gets list of wishlist items
    public List<CartItemModel> getWishlistItems(int userId) throws Exception {
        return dao.getWishlistItem(userId);
    }
    
    public boolean increaseQuantity(int userId, int variantId) {
        return dao.increaseQuantity(userId, variantId);
    }

    public boolean decreaseQuantity(int userId, int variantId) {
        return dao.decreaseQuantity(userId, variantId);
    }

    public boolean removeFromCart(int userId, int variantId) {
        return dao.removeFromCart(userId, variantId);
    }

    public boolean removeFromWishlist(int userId, int productId) {
        return dao.removeFromWishlist(userId, productId);
    }
	
}
