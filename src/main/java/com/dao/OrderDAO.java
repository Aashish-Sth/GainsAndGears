package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import com.model.CartItemModel;
import com.utils.DBconfig;

public class OrderDAO {
    public int placeOrder(int userId, String district, String address, 
                          String landmark, String paymentMethod, int totalPrice) throws Exception {
        Connection con = DBconfig.getConnection();
        String query = "INSERT INTO orders (user_id, district, address, landmark, " +
                       "payment_method, total_price, order_date, order_status, payment_status) " +
                       "VALUES (?, ?, ?, ?, ?, ?, CURDATE(), 'Confirmed', ?)";
        PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
        pst.setInt(1, userId);
        pst.setString(2, district);
        pst.setString(3, address);
        pst.setString(4, landmark);
        pst.setString(5, paymentMethod);
        pst.setInt(6, totalPrice);
        pst.setString(7, paymentMethod.equals("COD") ? "Pending" : "Success");
        pst.executeUpdate();

        ResultSet rs = pst.getGeneratedKeys();
        int orderId = -1;
        if (rs.next()) orderId = rs.getInt(1);

        pst.close();
        con.close();
        return orderId;
    }

    public void insertOrderDetails(int orderId, List<CartItemModel> items) throws Exception {
        Connection con = DBconfig.getConnection();
        String query = "INSERT INTO order_details (order_id, variant_id, quantity, price) VALUES (?, ?, ?, ?)";
        PreparedStatement pst = con.prepareStatement(query);
        for (CartItemModel item : items) {
            pst.setInt(1, orderId);
            pst.setInt(2, item.getVariant_Id());
            pst.setInt(3, item.getQuantity());
            pst.setInt(4, (int)(item.getProduct_price() * item.getQuantity()));
            pst.addBatch();
        }
        pst.executeBatch();
        pst.close();
        con.close();
    }

    public void clearCart(int userId) throws Exception {
        Connection con = DBconfig.getConnection();
        String query = "DELETE FROM cart WHERE user_id = ?";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setInt(1, userId);
        pst.executeUpdate();
        pst.close();
        con.close();
    }
}