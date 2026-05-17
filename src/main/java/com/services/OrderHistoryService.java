package com.services;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.dao.OrderHistoryDAO;
import com.model.OrderHistoryModel;
import jakarta.servlet.http.HttpServletRequest;

public class OrderHistoryService {
	public void fetchUserOrders(int userId, HttpServletRequest request) {
	    OrderHistoryDAO dao = new OrderHistoryDAO();
	    List<OrderHistoryModel> orders = new ArrayList<>();
	    try {
	        ResultSet rs = dao.fetchUserOrders(userId);
	        while (rs.next()) {
	            OrderHistoryModel orderItem = new OrderHistoryModel();
	            orderItem.setOrderId(rs.getInt("order_id"));
	            orderItem.setOrderStatus(rs.getString("order_status"));
	            orderItem.setOrderDate(rs.getDate("order_date"));
	            orderItem.setProductName(rs.getString("product_name"));
	            orderItem.setAttribute1(rs.getString("attribute_1"));
	            orderItem.setAttribute2(rs.getString("attribute_2"));
	            orderItem.setQuantity(rs.getInt("quantity"));
	            orderItem.setPrice(rs.getInt("price"));
	            orderItem.setProductImage(rs.getBytes("product_image"));
	            orderItem.setProductBrand(rs.getString("product_brand"));
	            orders.add(orderItem);
	        }
	        request.setAttribute("orders", orders);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	public void fetchUserOrdersByStatus(int userId, String status, HttpServletRequest request) {
	    OrderHistoryDAO dao = new OrderHistoryDAO();
	    List<OrderHistoryModel> orders = new ArrayList<>();
	    try {
	        ResultSet rs = dao.fetchUserOrdersByStatus(userId, status);
	        while (rs.next()) {
	            OrderHistoryModel orderItem = new OrderHistoryModel();
	            orderItem.setOrderId(rs.getInt("order_id"));
	            orderItem.setOrderStatus(rs.getString("order_status"));
	            orderItem.setOrderDate(rs.getDate("order_date"));
	            orderItem.setProductName(rs.getString("product_name"));
	            orderItem.setAttribute1(rs.getString("attribute_1"));
	            orderItem.setAttribute2(rs.getString("attribute_2"));
	            orderItem.setQuantity(rs.getInt("quantity"));
	            orderItem.setPrice(rs.getInt("price"));
	            orderItem.setProductImage(rs.getBytes("product_image"));
	            orderItem.setProductBrand(rs.getString("product_brand"));
	            orders.add(orderItem);
	        }
	        request.setAttribute("orders", orders);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}