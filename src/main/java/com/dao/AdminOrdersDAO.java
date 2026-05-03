package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.utils.DBconfig;

public class AdminOrdersDAO {
	public ResultSet fetchAllOrders () throws Exception{
		Connection con = DBconfig.getConnection();
		
		String query = "SELECT "
		        + "o.order_id, "
		        + "CONCAT(u.user_first_name, ' ', u.user_last_name) AS customer_name, "
		        + "o.payment_status, "
		        + "o.order_date, "
		        + "o.order_status "   
		        + "FROM orders o "
		        + "JOIN users u ON o.user_id = u.user_id";
		
		
		PreparedStatement pst = con.prepareStatement(query);
		ResultSet rs = pst.executeQuery();
		return rs;
	}
}
