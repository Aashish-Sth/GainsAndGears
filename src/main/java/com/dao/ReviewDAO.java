package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.ReviewModel;
import com.utils.DBconfig;

public class ReviewDAO {
	public ArrayList<ReviewModel> retriveProductReview(int product_id,int user_id) throws Exception{
		Connection con = DBconfig.getConnection();
		String query = "SELECT "
				+ "    r.review_id, "
				+ "    r.rating, "
				+ "    r.review_description, "
				+ "    r.review_timestamp, "
				+ "    CONCAT(u.user_first_name, ' ', u.user_last_name) AS reviewer_name, "
				+ "    u.user_img "
				+ "FROM reviews r "
				+ "JOIN users u ON r.user_id = u.user_id "
				+ "WHERE r.product_id = ? "
				+ "AND r.user_id <> ? "
				+ "ORDER BY r.review_timestamp DESC";
		
		PreparedStatement pst = con.prepareStatement(query);
		pst.setInt(1, product_id);
		pst.setInt(2, user_id);
		ResultSet rs = pst.executeQuery();
		ArrayList<ReviewModel> ratings = new ArrayList<>();
		ReviewModel review = null;
		while(rs.next())
		{
			review = new ReviewModel();
			review.setReview_id(rs.getInt("review_id"));
			review.setRating(rs.getDouble("rating"));
			review.setReview_description(rs.getString("review_description"));
			review.setReview_timestamp(rs.getDate("review_timestamp"));
			review.setReviewer_name(rs.getString("reviewer_name"));
			review.setUserImg(rs.getString("user_img"));
			ratings.add(review);
		}
		return ratings;
	}
	
	public ReviewModel getRatingOverview(int productId) throws Exception{
		Connection con = DBconfig.getConnection();
		String query = "SELECT AVG(rating) as avg_rating, "
				+ "COUNT(*) as total_reviews "
				+ "FROM reviews "
				+ "WHERE product_id = ?";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setInt(1, productId);
		ResultSet rs = pst.executeQuery();
		ReviewModel overview = new ReviewModel();
		if(rs.next()) {
			overview.setAvg_rating(rs.getDouble("avg_rating"));
		    overview.setTotal_reviews(rs.getInt("total_reviews"));
		}
		return overview;
	}
	
	public void addReview(int user_id, int product_id, String review_description, double rating) throws Exception {
	    Connection con = DBconfig.getConnection();
	    String query = "INSERT INTO reviews (user_id, product_id, review_description, review_timestamp, rating) "
	                 + "VALUES (?, ?, ?, CURDATE(), ?)";
	    PreparedStatement pst = con.prepareStatement(query);
	    pst.setInt(1, user_id);
	    pst.setInt(2, product_id);
	    pst.setString(3, review_description);
	    pst.setDouble(4, rating);
	    pst.executeUpdate();
	    pst.close();
	    con.close();
}
	
	public ReviewModel retriveUserReview(int product_id,int user_id) throws Exception{
		Connection con = DBconfig.getConnection();
		String query = "SELECT "
				+ "    r.review_id, "
				+ "    r.rating, "
				+ "    r.review_description, "
				+ "    r.review_timestamp, "
				+ "    CONCAT(u.user_first_name, ' ', u.user_last_name) AS reviewer_name, "
				+ "    u.user_img "
				+ "FROM reviews r "
				+ "JOIN users u ON r.user_id = u.user_id "
				+ "WHERE r.product_id = ? "
				+ "AND r.user_id = ? "
				+ "ORDER BY r.review_timestamp DESC";
		
		PreparedStatement pst = con.prepareStatement(query);
		pst.setInt(1, product_id);
		pst.setInt(2, user_id);
		ResultSet rs = pst.executeQuery();
		ReviewModel review = null;
		if(rs.next())
		{
			review = new ReviewModel();
			review.setReview_id(rs.getInt("review_id"));
			review.setRating(rs.getDouble("rating"));
			review.setReview_description(rs.getString("review_description"));
			review.setReview_timestamp(rs.getDate("review_timestamp"));
			review.setReviewer_name(rs.getString("reviewer_name"));
			review.setUserImg(rs.getString("user_img"));
		}
		return review;
	}
	
	public boolean updateReview(int user_id, int product_id, String review_description, double rating) throws Exception {
	    Connection con = DBconfig.getConnection();

	    String query = "UPDATE reviews "
	                 + "SET review_description = ?, rating = ?, review_timestamp = CURDATE() "
	                 + "WHERE user_id = ? AND product_id = ?";

	    PreparedStatement pst = con.prepareStatement(query);

	    pst.setString(1, review_description);
	    pst.setDouble(2, rating);
	    pst.setInt(3, user_id);
	    pst.setInt(4, product_id);

	    int rowsUpdated = pst.executeUpdate();

	    pst.close();
	    con.close();

	    return rowsUpdated > 0;
	}
	
}
