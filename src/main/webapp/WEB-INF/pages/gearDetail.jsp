<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="imageSideBar">
          <img class="optImg" src="<%=request.getContextPath()%>/assets/productPic1.png" alt="" />
          <img class="optImg" src="<%=request.getContextPath()%>/assets/productPic2.webp" alt="" />
          <img class="optImg" src="<%=request.getContextPath()%>/assets/productPic3.png" alt="" />
          <img class="optImg" src="<%=request.getContextPath()%>/assets/productPic4.webp" alt="" />
        </div>
        <img class="mainImg" src="<%=request.getContextPath()%>/assets/productmain.png" alt="" />
      </div>

      <div class="content">
        <label class="favorite">
          <input type="checkbox" hidden />
          <i class="fa-solid fa-heart"></i>
        </label>
        <div class="brandHolder">
          <img class="logoImg" src="<%=request.getContextPath()%>/assets/youngLA.png" alt="" />
          <p class="brandName">YoungLA</p>
        </div>
        <p class="productName">W4187 - Golds Iron Legacy Tank</p>
        <div class="ratingAndReview">
          <div>
            <i class="fa-solid fa-star"></i>
            <p>4.8</p>
          </div>
          <p style="color: grey">50 reviews</p>
        </div>
        <p class="price">Nrs.4400</p>
        <p class="pickerHead">Color</p>
        <div class="options">
          <div class="option">Red</div>
          <div class="option active">Green</div>
          <div class="option">White</div>
          <div class="option">Pink</div>
          <div class="option">Black</div>
        </div>
        <p class="pickerHead">Size</p>
        <div class="options">
          <div class="option">XSmall</div>
          <div class="option active">Small</div>
          <div class="option">Medium</div>
          <div class="option">Large</div>
          <div class="option">XLarge</div>
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
    <div class="card">
        <div class="card-item">
            <img src="../assets/product1.jpg" alt="Product 1">
            <p>Gymshark - Element Sleeve</p>
            <div class="info">
                <span class="price">Rs 3500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../assets/product2.jpg" alt="Product 2">
            <p>Gymshark - Compression T-Shirt</p>
            <div class="info">
                <span class="price">Rs 3000.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <div class="product">
                <img src="../assets/product3.jpg" alt="Product 3">
                <p>Gymshark - Graphic T-Shirt</p>
            </div>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.2</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../assets/product4.jpg" alt="Product 4">
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
