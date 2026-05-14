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
    <div class="mainContainer">
      <div class="mainIamgeContainer">
        
        <img class="mainImg" src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(product.product_image)}" alt="${product.product_name}" alt="${product.product_name}" />
      </div>

      <div class="content">
        <label class="favorite">
          <input type="checkbox" hidden />
          <i class="fa-solid fa-heart"></i>
        </label>
        <div class="brandHolder">
          <img class="logoImg" 
          src="${product.product_brand == 'youngLA' ? pageContext.request.contextPath.concat('/assets/youngLA.png') : 
          product.product_brand == 'gymshark' ? pageContext.request.contextPath.concat('/assets/gymshark.png') :
          pageContext.request.contextPath.concat('/assets/fuaark.jpg')}" 
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
        <p class="pickerHead">Color</p>
        <div class="options">
        <c:forEach var="color" items="${attr2}">
        	<label for="${color}"  class="option">${color}</label>
         	<input hidden id="${color}" type="radio" name="color" value="${attr2}">   	
        </c:forEach>
         
          
        </div>
        <p class="pickerHead">Size</p>
        <div class="options">
          <c:forEach var="size" items="${attr1}">
        	<label for="${size}"  class="option">${size}</label>
         	<input hidden id="${size}" type="radio" name="size" value="${attr1}">   	
        </c:forEach>
        </div>
        <div class="btn-container">
          <button class="btn">
            <i
              style="margin-right: 4px"
              class="fa-solid fa-basket-shopping"
            ></i>
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
      </div>
    </div>
    <div class="review-section">
      <div class="display-reviews">
        <div class="review-head">Reviews</div>
        <div class="indi-review">
          <img class="review-img" src="../../assets/suddu.jpg" alt="">
          <div class="review-txt-section">
            <div style="display: flex; gap: 25px;">
              <p class="reviwer-name">Dilip Shrestha</p>
              <p><i class="fa-solid fa-star"></i> 4.8</p>
            </div>
            <p class="review-date">March 22</p>
            <p>Loved the chocolate chaos flavor!!</p>
          </div>
        </div>
        <div class="divider"></div>
        <div class="indi-review">
          <img class="review-img" src="../../assets/suddu.jpg" alt="">
          <div class="review-txt-section">
            <div style="display: flex; gap: 25px;">
              <p class="reviwer-name">Dilip Shrestha</p>
              <p><i class="fa-solid fa-star"></i> 4.8</p>
            </div>
            <p class="review-date">March 22</p>
            <p>Loved the chocolate chaos flavor!!</p>
          </div>
        </div>
        <div class="divider"></div>
        <a href="" class="view-all">View all <i class="fa-solid fa-chevron-down"></i></a>
      </div>
      <div class="add-reviews">
        <p class="leave-review">Leave a review:</p>
        <textarea placeholder="Share your experience with the product.." name="newReview" id="" class="review-txtarea"></textarea>
        <button class="sub-btn">Submit</button>
      </div>
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
  </body>
</html>
