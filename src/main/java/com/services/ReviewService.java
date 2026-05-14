package com.services;

import java.util.List;

import com.dao.ReviewDAO;
import com.model.ReviewModel;
import jakarta.servlet.http.HttpServletRequest;

public class ReviewService {
	public void returnOverview(int product_id, HttpServletRequest request) {
		ReviewDAO dao = new ReviewDAO();
		try {
		ReviewModel overview = dao.getRatingOverview(product_id);
		request.setAttribute("overview", overview);
		}
		catch(Exception e) {
			e.printStackTrace();
		}	
}
	
	public void returnAllReviews(int product_id, HttpServletRequest request) {
		ReviewDAO dao = new ReviewDAO();
		try {
			List<ReviewModel> review = dao.retriveProductReview(product_id);
			request.setAttribute("review", review);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void returnLatestReviews(int product_id, HttpServletRequest request) {
	    ReviewDAO dao = new ReviewDAO();
	    try {
	        List<ReviewModel> review = dao.retriveProductReview(product_id);
	        List<ReviewModel> firstThree = review.subList(0, Math.min(3, review.size()));
	        request.setAttribute("review", firstThree);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	}
