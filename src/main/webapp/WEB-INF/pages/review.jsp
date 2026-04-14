<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reviews</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/review.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
</head>
<body>

    <!-- Review Section -->
    <div class="reviewSection">

        <!-- Header row -->
        <div class="reviewHeader">
            <h2 class="reviewHeading">Reviews</h2>
            <a href="#" class="moreReviews">More Reviews <i class="fa fa-chevron-right"></i></a>
        </div>

        <!-- Sort dropdown -->
        <select class="sortDropdown">
            <option>Newest</option>
            <option>Oldest</option>
            <option>Highest Rated</option>
            <option>Lowest Rated</option>
        </select>

        <!-- Review cards -->
        <div class="reviewList">

            <div class="reviewComment">
                <div class="reviewTop">
                    <div class="reviewAvatar">
                        <i class="fa-solid fa-user"></i>
                    </div>
                    <div class="reviewMeta">
                        <div class="reviewNameRow">
                            <p class="reviewerName">Dilip Shrestha</p>
                            <span class="reviewRating"><i class="fa-solid fa-star"></i>4.8</span>
                        </div>
                        <p class="reviewDate">March 22</p>
                    </div>
                </div>
                <p class="reviewText">Loved the chocolate chaos flavor!!</p>
            </div>

            <div class="reviewComment">
                <div class="reviewTop">
                    <div class="reviewAvatar">
                        <i class="fa-solid fa-user"></i>
                    </div>
                    <div class="reviewMeta">
                        <div class="reviewNameRow">
                            <p class="reviewerName">Upakar Shrestha</p>
                            <span class="reviewRating"><i class="fa-solid fa-star"></i>4.8</span>
                        </div>
                        <p class="reviewDate">March 22</p>
                    </div>
                </div>
                <p class="reviewText">Loved the cinnamon roll flavor!</p>
            </div>

        </div>

    </div>
</body>
</html>