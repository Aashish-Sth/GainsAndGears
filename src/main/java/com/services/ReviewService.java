package com.services;

import java.net.Authenticator.RequestorType;
import java.util.ArrayList;
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
			List<ReviewModel> review = dao.retriveAllReviews(product_id);
			request.setAttribute("review", review);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void returnLatestReviews(int product_id,int user_id, HttpServletRequest request) {
	    ReviewDAO dao = new ReviewDAO();
	    try {
	        List<ReviewModel> review = dao.retriveProductReview(product_id, user_id);
	        List<ReviewModel> firstThree = review.subList(0, Math.min(3, review.size()));
	        request.setAttribute("review", firstThree);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public boolean addReview(int user_id,int product_id,String review_description,double rating){
		ReviewDAO dao = new ReviewDAO();
		try {
		dao.addReview(user_id, product_id, review_description, rating);
		return true;
		}catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public Boolean retriveUserReview(int product_id, int user_id, HttpServletRequest request) {
		ReviewDAO dao = new ReviewDAO();
		try {
			ReviewModel userReview = dao.retriveUserReview(product_id, user_id);
			request.setAttribute("userReview", userReview);
			return userReview != null;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public void updateReview(int user_id, int product_id, String review_description, double rating) {
		ReviewDAO dao = new ReviewDAO();
		try {
			dao.updateReview(user_id, product_id, review_description, rating); 
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void filterReviews(int product_id, int star, HttpServletRequest request) {
	    ReviewDAO dao = new ReviewDAO();
	    try {
	        List<ReviewModel> allReviews = dao.retriveAllReviews(product_id);
	        List<ReviewModel> filtered = new ArrayList<>();
	        for (ReviewModel r : allReviews) {
	            if (r.getRating() == star) {
	                filtered.add(r);
	            }
	        }
	        request.setAttribute("review", filtered);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
}
