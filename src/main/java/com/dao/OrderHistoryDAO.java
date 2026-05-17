package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.utils.DBconfig;

public class OrderHistoryDAO {
    public ResultSet fetchUserOrders(int userId) throws Exception {
        Connection con = DBconfig.getConnection();
        String query = "SELECT o.order_id, o.order_status, o.order_date, "
                + "od.product_name, od.attribute_1, od.attribute_2, "
                + "od.quantity, od.price, od.product_image, od.product_brand "
                + "FROM orders o "
                + "JOIN order_details od ON o.order_id = od.order_id "
                + "WHERE o.user_id = ? "
                + "ORDER BY o.order_date DESC";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setInt(1, userId);
        return pst.executeQuery();
    }

    public ResultSet fetchUserOrdersByStatus(int userId, String status) throws Exception {
        Connection con = DBconfig.getConnection();
        String query = "SELECT o.order_id, o.order_status, o.order_date, "
                + "od.product_name, od.attribute_1, od.attribute_2, "
                + "od.quantity, od.price, od.product_image, od.product_brand "
                + "FROM orders o "
                + "JOIN order_details od ON o.order_id = od.order_id "
                + "WHERE o.user_id = ? AND o.order_status = ? "
                + "ORDER BY o.order_date DESC";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setInt(1, userId);
        pst.setString(2, status);
        return pst.executeQuery();
    }
}