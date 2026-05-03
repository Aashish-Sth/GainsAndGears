package com.services;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.dao.AdminOrdersDAO;

import com.model.OrderModel;

public class AdminOrderService {
	public List<OrderModel> fetchOrders() throws Exception
	{
		AdminOrdersDAO dao = new AdminOrdersDAO();
		
		ResultSet rs = dao.fetchAllOrders();
		
		List <OrderModel> orderList = new  ArrayList<OrderModel>();
		
		
			while(rs.next())
			{
				OrderModel order = new OrderModel(); 
		        order.setOrderId(rs.getInt("order_id"));
		        order.setFullName(rs.getString("customer_name"));
		        order.setPaymentStatus(rs.getString("payment_status"));
		        order.setOrderDate(rs.getDate("order_date"));  
		        order.setOrderStatus(rs.getString("order_status"));

		        orderList.add(order); 
			}
			return orderList;
	}
	public int totalNoOfOrders(List<OrderModel> orderList) {
		return orderList.size();
	}
	
	public int noOfCompletedOrders(List<OrderModel> orderList) {
		int count = 0;
		for(OrderModel order : orderList) {
			if(order.getOrderStatus().equals("Completed")) {
				count ++;
			}
		}
		return count;
	}
	
	public int noOfShippedOrders(List<OrderModel> orderList) {
		int count = 0;
		for(OrderModel order : orderList) {
			if(order.getOrderStatus().equals("Shipped")) {
				count ++;
			}
		}
		return count;
	}
	
	public int noOfConfirmedOrders(List<OrderModel> orderList) {
		int count = 0;
		for(OrderModel order : orderList) {
			if(order.getOrderStatus().equals("Confirmed")) {
				count ++;
			}
		}
		return count;
	}
	
	
	public List<OrderModel> filterOrders(List<OrderModel> orderList, String status){
		List<OrderModel> filteredOrders = new ArrayList<OrderModel>();
		for (OrderModel order : orderList) {
			if(order.getOrderStatus().equals(status)) {
				filteredOrders.add(order);
			}
		}
		return filteredOrders;
	}
}