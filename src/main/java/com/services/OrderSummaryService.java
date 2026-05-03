package com.services;

import java.sql.ResultSet;

import com.dao.OrderSummaryDAO;
import com.model.OrderItemModel;
import com.model.OrderSummaryModel;

public class OrderSummaryService {
	public OrderSummaryModel retriveOrderSummary(int orderId) {
	OrderSummaryDAO dao = new OrderSummaryDAO();
	OrderSummaryModel generalDetail = null;
	OrderItemModel orderItems = new OrderItemModel();
	
	try {
	ResultSet rs = dao.fetchFullOrderSummary(orderId);
	
	while(rs.next()) {
		if(generalDetail == null) {
			generalDetail = new OrderSummaryModel();
			generalDetail.setFullName(rs.getString("full_name"));
			generalDetail.setUserEmail(rs.getString("user_email"));
			generalDetail.setUserPhoneNumber(rs.getString("user_phone_number"));
			generalDetail.setDistrict(rs.getString("district"));
			generalDetail.setAddress(rs.getString("address"));
			generalDetail.setLandmark(rs.getString("landmark"));
			generalDetail.setPaymentMethod(rs.getString("payment_method"));
			generalDetail.setTotalPrice(rs.getInt("total_price"));
		}
	}
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return null;
	
	}
	
}
