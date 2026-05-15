package com.model;

import java.sql.Date;

public class ReviewModel {
	private int review_id;
	private double rating;
	private String review_description;
	private Date review_timestamp;
	private String reviewer_name;
	private double avg_rating;
	private int total_reviews;
	private String userImg;
	private int[] ratingDist;
	private double[] ratingPct;
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getReview_description() {
		return review_description;
	}
	public void setReview_description(String review_description) {
		this.review_description = review_description;
	}
	public Date getReview_timestamp() {
		return review_timestamp;
	}
	public void setReview_timestamp(Date review_timestamp) {
		this.review_timestamp = review_timestamp;
	}
	public String getReviewer_name() {
		return reviewer_name;
	}
	public void setReviewer_name(String reviewer_name) {
		this.reviewer_name = reviewer_name;
	}
	public double getAvg_rating() {
		return avg_rating;
	}
	public void setAvg_rating(double avg_rating) {
		this.avg_rating = avg_rating;
	}
	public int getTotal_reviews() {
		return total_reviews;
	}
	public void setTotal_reviews(int total_reviews) {
		this.total_reviews = total_reviews;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public int[] getRatingDist() {
		return ratingDist;
	}
	public void setRatingDist(int[] ratingDist) {
		this.ratingDist = ratingDist;
	}
	public double[] getRatingPct() {
		return ratingPct;
	}
	public void setRatingPct(double[] ratingPct) {
		this.ratingPct = ratingPct;
	}
	
	
	}
	

