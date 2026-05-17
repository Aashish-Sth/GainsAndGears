<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Full review</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/allReviews.css"/>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
	<body>
	<jsp:include page="navbar.jsp" />
		<a href="<%= request.getContextPath() %>/product/detail?id=${productId}" class="back-btn">
    		<i class="fa-solid fa-arrow-left"></i>Back
		</a>
		<div class="review-section">
		
	    <div class="display-reviews">
	      <div class="review-head">Reviews</div>
	
	     
	      <div class="filter-tabs">
		  <a href="allReviews?id=${productId}" 
		     class="tab ${activeStar == 'all' ? 'active-tab' : ''}">All</a>
		  <a href="allReviews?id=${productId}&amp;star=5" 
		     class="tab ${activeStar == '5' ? 'active-tab' : ''}">5</a>
		  <a href="allReviews?id=${productId}&amp;star=4" 
		     class="tab ${activeStar == '4' ? 'active-tab' : ''}">4</a>
		  <a href="allReviews?id=${productId}&amp;star=3" 
		     class="tab ${activeStar == '3' ? 'active-tab' : ''}">3</a>
		  <a href="allReviews?id=${productId}&amp;star=2" 
		     class="tab ${activeStar == '2' ? 'active-tab' : ''}">2</a>
		  <a href="allReviews?id=${productId}&amp;star=1" 
		     class="tab ${activeStar == '1' ? 'active-tab' : ''}">1</a>
		</div>
	
	     
	      <div id="review-list">
			    <c:if test="${empty review}">
			        <p class="no-filter-result">
			            <c:if test="${activeStar == 'all'}">No reviews yet.</c:if>
			            <c:if test="${activeStar != 'all'}">No ${activeStar} star reviews found.</c:if>
			        </p>
			    </c:if>
			    <c:if test="${not empty review}">
			        <c:forEach var="rev" items="${review}">
			            <div class="indi-review">
			                <div class="avatar">
			                    <img class="review-img" src="<%=request.getContextPath()%>/uploads/${rev.userImg}" alt="">
			                </div>
			                <div class="review-txt-section">
			                    <div class="review-top">
			                        <p class="reviewer-name">${rev.reviewer_name}</p>
			                        <p class="review-rating"><i class="fa-solid fa-star"></i> ${rev.rating}</p>
			                    </div>
			                    <p class="review-date">${rev.review_timestamp}</p>
			                    <p class="review-text">${rev.review_description}</p>
			                </div>
			            </div>
			            <div class="divider"></div>
			        </c:forEach>
			    </c:if>
			</div>
	
	    </div>
	
	    <div class="rating-summary">
		  <div class="big-rating">
		    <span class="big-number">${overview.avg_rating}</span>
		    <i class="fa-solid fa-star big-star"></i>
		  </div>
		  <p class="total-reviews">${overview.total_reviews} Reviews</p>
		
		  <div class="rating-bars">
		    <div class="bar-row">
		      <span class="bar-label">5</span>
		      <div class="bar-track">
		        <div class="bar-fill" data-width="${overview.ratingPct[5]}" style="width:0%"></div>
		      </div>
		    </div>
		    <div class="bar-row">
		      <span class="bar-label">4</span>
		      <div class="bar-track">
		        <div class="bar-fill" data-width="${overview.ratingPct[4]}" style="width:0%"></div>
		      </div>
		    </div>
		    <div class="bar-row">
		      <span class="bar-label">3</span>
		      <div class="bar-track">
		        <div class="bar-fill" data-width="${overview.ratingPct[3]}" style="width:0%"></div>
		      </div>
		    </div>
		    <div class="bar-row">
		      <span class="bar-label">2</span>
		      <div class="bar-track">
		        <div class="bar-fill" data-width="${overview.ratingPct[2]}" style="width:0%"></div>
		      </div>
		    </div>
		    <div class="bar-row">
		      <span class="bar-label">1</span>
		      <div class="bar-track">
		        <div class="bar-fill" data-width="${overview.ratingPct[1]}" style="width:0%"></div>
		      </div>
		    </div>
		  </div>
	</div>
	
	  </div>
	  <script>
	  window.addEventListener("load", () => {
	    document.querySelectorAll(".bar-fill").forEach(bar => {
	      const target = bar.getAttribute("data-width") + "%";
	      setTimeout(() => {
	        bar.style.transition = "width 0.8s ease";
	        bar.style.width = target;
	      }, 100);
	    });
	  });
</script>
	<jsp:include page="footer.jsp" />
	</body>
	</html>