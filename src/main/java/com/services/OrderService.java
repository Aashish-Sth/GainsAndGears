package com.services;
import java.util.List;
import com.dao.OrderDAO;
import com.model.CartItemModel;

public class OrderService {
    public int placeOrder(int userId, String district, String address,
                          String landmark, String paymentMethod, 
                          int totalPrice, List<CartItemModel> items) {
        OrderDAO dao = new OrderDAO();
        try {
            int orderId = dao.placeOrder(userId, district, address, 
                                         landmark, paymentMethod, totalPrice);
            dao.insertOrderDetails(orderId, items);
            dao.clearCart(userId);
            return orderId;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}