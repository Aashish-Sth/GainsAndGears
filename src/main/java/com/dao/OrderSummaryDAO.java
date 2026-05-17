package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.utils.DBconfig;

public class OrderSummaryDAO {
	public ResultSet fetchFullOrderSummary(int orderId) throws Exception {
	    Connection con = DBconfig.getConnection();

	    String query = "SELECT "
	            + "    CONCAT(u.user_first_name, ' ', u.user_last_name) AS full_name, "
	            + "    u.user_email, "
	            + "    u.user_phone_number, "
	            + "    o.district, "
	            + "    o.address, "
	            + "    o.landmark, "
	            + "    o.payment_method, "
	            + "    o.total_price, "
	            + "    od.product_name, "
	            + "    od.attribute_1, "
	            + "    od.attribute_2, "
	            + "    od.quantity, "
	            + "    od.price, "
	            + "    od.product_image "
	            + "FROM orders o "
	            + "JOIN users u          ON o.user_id  = u.user_id "
	            + "JOIN order_details od ON o.order_id = od.order_id "
	            + "WHERE o.order_id = ?";

	    PreparedStatement pst = con.prepareStatement(query);
	    pst.setInt(1, orderId);
	    ResultSet rs = pst.executeQuery();
	    return rs;
	}
}
