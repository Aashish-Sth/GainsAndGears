<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Base64" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gains $ Gears</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/gearDetail.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
  <jsp:include page="navbar.jsp" />
  
	  <c:if test="${param.msg == 'review_added'}">
	    <div class="sucessMsg" id="sucessMsg">Your review was successfully submitted</div>
	</c:if>
	<c:if test="${param.msg == 'review_updated'}">
	    <div class="sucessMsg" id="sucessMsg">Your review was successfully updated</div>
	</c:if>
	<!-- Hidden data field to carry data over -->
	 <input type="hidden" name="id" value="${param.id}" />
	 <input type="hidden" name="isActive" value="${ reviewDone}">
    <div class="mainContainer">
      <div class="mainIamgeContainer">
        
        <img class="mainImg" src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(product.product_image)}" alt="${product.product_name}" alt="${product.product_name}" />
      </div>
	
      <div class="content">
         <form action="${pageContext.request.contextPath}/product/detail" method="post"  >                                                                 
         <button type="submit" name="action" class="favorite" value="wishlist">
		    	<i class="fa-solid fa-heart"></i>
		  	</button>
       
        <div class="brandHolder">
          <img class="logoImg" 
          src="${product.product_brand == 'YoungLA' ? pageContext.request.contextPath.concat('/assets/youngLA.png') : 
          product.product_brand == 'Gymshark' ? pageContext.request.contextPath.concat('/assets/gymshark.png') :
          product.product_brand == 'Fuaark' ? pageContext.request.contextPath.concat('/assets/fuaark.jpg') :
          product.product_brand == 'Ghost' ? pageContext.request.contextPath.concat('/assets/ghost.png') :
          product.product_brand == 'Feral' ? pageContext.request.contextPath.concat('/assets/feral.png') :
          pageContext.request.contextPath.concat('/assets/muscleBlaze.png')
          }" 
          alt="" />
          <p class="brandName">${product.product_brand}</p>
        </div>
        <p class="productName">${product.product_name}</p>
        <div class="ratingAndReview">
          <div>
            <i class="fa-solid fa-star"></i>
            <p>${overview.avg_rating}</p>
          </div>
          <p style="color: grey">${overview.total_reviews } reviews</p>
        </div>
        <p class="price">Nrs.${product.product_price}</p>
        <p class="pickerHead">${ product.category == 'supplement' ? 'Flavor' : 'Color' }</p>
        <div class="options">
        <c:forEach var="attribute2" items="${attr2}">
        	<label for="${attribute2}"  class="option">${attribute2}</label>
         	<input hidden id="${attribute2}" type="radio" name="attribute2" value="${attribute2}">   	
        </c:forEach>
         
          
        </div>
        <p class="pickerHead">${ product.category == 'supplement' ? 'Quantity' : 'Size' }</p>
        <div class="options">
          <c:forEach var="attribute1" items="${attr1}">
        	<label for="${attribute1}"  class="option">${attribute1}</label>
         	<input hidden id="${attribute1}" type="radio" name="attribute1" value="${attribute1}">   	
        </c:forEach>
        </div>
        <div class="btn-container">
          <button type="submit" name="action" class="btn" value="cart">
			      <i style="margin-right: 4px" class="fa-solid fa-basket-shopping"></i>
			      Add to bag
			    </button>
			  
	          <button class="btnInverted">
	            <i
	              style="margin-right: 4px"
	              class="fa-solid fa-cart-arrow-down"
	            ></i>
	            Buy Now
	          </button>
        </div>
      </form>
      </div>
    </div>
    <div id="review-section" class="review-section">
      <div class="display-reviews">
        <div class="review-head">Reviews</div>

        <c:if test="${empty review}">
          <div class="no-reviews">
            <img class="no-review-img" src="<%=request.getContextPath()%>/assets/noReviews.png" alt="No reviews yet">
            <p class="no-review-title">Whoops!</p>
            <p class="no-review-text">There seem to be no reviews yet.</p>
            <p class="no-review-text">Try leaving a review!</p>
          </div>
        </c:if>
        
        <c:forEach var="rev" items="${review}">
         <div class="indi-review">
          <img class="review-img" src="<%=request.getContextPath()%>/uploads/${rev.userImg}" alt="">
          <div class="review-txt-section">
            <div style="display: flex; gap: 25px;">
              <p class="reviwer-name">${rev.reviewer_name }</p>
              <p><i class="fa-solid fa-star"></i> ${rev.rating }</p>
            </div>
            <p class="review-date">${rev.review_timestamp}</p>
            <p>${rev.review_description}</p>
          </div>
        </div>
        <div class="divider"></div>
        </c:forEach>
        
        <c:if test="${not empty review}">
        <a href="<%= request.getContextPath() %>/allReviews?id=${param.id}" class="view-all">View all <i class="fa-solid fa-chevron-down"></i></a>
        </c:if>
      </div>
    
      <form action="${pageContext.request.contextPath}/product/detail?id=${param.id}" method="post" class="add-reviews">
      
      <input type="hidden" name="action" value="${param.mode == 'edit' ? 'editReview' : 'addReview'}">
      
       <p class="leave-review">${not empty userReview.review_description ? 'Your Review' : 'Leave a review'}</p>
        <div class="review-rating">
          <div class="review-stars">
            <button 
            type="button" 
            class="review-star" data-rating="1" 
            ${!reviewDone || param.mode == 'edit' ? '' : 'disabled'}>
            <i class="fa-solid fa-star"></i>
            </button>
            <button 
            type="button" 
            class="review-star" 
            data-rating="2" 
            ${!reviewDone || param.mode == 'edit' ? '' : 'disabled'}>
            <i class="fa-solid fa-star"></i>
            </button>
            <button 
            type="button" 
            class="review-star" 
            data-rating="3" 
            ${!reviewDone || param.mode == 'edit' ? '' : 'disabled'}>
            <i class="fa-solid fa-star"></i>
            </button>
            <button 
            type="button" 
            class="review-star" 
            data-rating="4" 
            ${!reviewDone || param.mode == 'edit' ? '' : 'disabled'}>
            <i class="fa-solid fa-star"></i>
            </button>
            <button 
            type="button" 
            class="review-star" 
            data-rating="5" 
            ${!reviewDone || param.mode == 'edit' ? '' : 'disabled'}>
            <i class="fa-solid fa-star"></i>
            </button>
          </div>
          <p class="rating-text">0/5 stars</p>
          <input type="hidden" name="rating" class="rating-input" value="${not empty persistedRating ? persistedRating : not empty userReview.rating ? userReview.rating : 0}">
        </div>
        <textarea 
        ${!reviewDone || param.mode == 'edit' ? '' : 'disabled'}
        placeholder="Share your experience with the product.." 
        name="newReview" id="" 
        class="review-txtarea">${not empty persistedReview ? persistedReview : userReview.review_description}</textarea>
        
        <c:if test="${not empty requestScope.errorMessage}">
            	<p class="errorMsg">${requestScope.errorMessage}</p>
        </c:if>
        <c:if test="${!reviewDone}">
        <button class="sub-btn">Submit</button>
        </c:if>
        <c:if test="${reviewDone}">
        <c:if test="${param.mode != 'edit'}">
        <a href="?id=${param.id }&mode=edit#review-section" class="btn-edit">
            <i class="fa-solid fa-pen"></i>
            Edit Review
        </a>
    	</c:if>
    	<c:if test="${param.mode == 'edit'}">
        <div class="buttonGroup">
        <button type="submit" class="btn-edit">
            <i class="fa-solid fa-save"></i>
            Update Review
        </button>
        <a class="btn-cancel" href="?id=${param.id }#review-section" class="btn-cancel">
           <i class="fa-solid fa-xmark"></i> Cancel
        </a>
        </div>
    	</c:if>
        </c:if>
        
      </form>
       
        
      </div>



    <div class="card">
        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/product1.jpg" alt="Product 1">
            <p>Gymshark - Element Sleeve</p>
            <div class="info">
                <span class="price">Rs 3500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/product2.jpg" alt="Product 2">
            <p>Gymshark - Compression T-Shirt</p>
            <div class="info">
                <span class="price">Rs 3000.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <div class="product">
                <img src="<%=request.getContextPath()%>/assets/product3.jpg" alt="Product 3">
                <p>Gymshark - Graphic T-Shirt</p>
            </div>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.2</span>
            </div>
        </div>

        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/product4.jpg" alt="Product 4">
            <p>Gymshark - Oversized T-Shirt</p>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.1</span>
            </div>
        </div>

    </div>

 
    <jsp:include page="footer.jsp" />
    <script
      src="https://kit.fontawesome.com/b4de01d1c5.js"
      crossorigin="anonymous"
    ></script>
     <script>
      const reviewStars = document.querySelectorAll(".review-star");
      const ratingText = document.querySelector(".rating-text");
      const ratingInput = document.querySelector(".rating-input");
      
     
      reviewStars.forEach((star) => {
        star.addEventListener("click", () => {
          const rating = Number(star.dataset.rating);

          reviewStars.forEach((item) => {
            item.classList.toggle("active", Number(item.dataset.rating) <= rating);
          });

          ratingText.textContent = rating + "/5 stars";
          ratingInput.value = rating;
        });
      });
      const existingRating = Number(ratingInput.value);
      if (existingRating > 0) {
          reviewStars.forEach((item) => {
              item.classList.toggle("active", Number(item.dataset.rating) <= existingRating);
          });
          ratingText.textContent = existingRating + "/5 stars";
      }
      const errorMsg = document.querySelector(".errorMsg");
      if (errorMsg) {
          document.getElementById("review-section").scrollIntoView({ behavior: "smooth" });
      }
    </script>
    <script >
    const sucessMsg = document.getElementById('sucessMsg');
    if (sucessMsg) {
        // Clean URL so refresh won't show it again
        const url = new URL(window.location);
        url.searchParams.delete('msg');
        window.history.replaceState({}, '', url);

        setTimeout(() => {
            sucessMsg.classList.add('hide');
            setTimeout(() => sucessMsg.remove(), 600);
        }, 2000);
    }
    
    </script>
  </body>
</html>
