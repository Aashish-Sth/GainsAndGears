<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gains $ Gears</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/gainDetail.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="mainContainer">
      <div class="mainIamgeContainer">
        <div class="imageSideBar">
          <img class="optImg" src="<%=request.getContextPath()%>/assets/top.png" alt="" />
          <img class="optImg" src="<%=request.getContextPath()%>/assets/mid.png" alt="" />
          <img class="optImg" src="<%=request.getContextPath()%>/assets/bottom.png" alt="" />
        </div>
        <img class="mainImg" src="<%=request.getContextPath()%>/assets/main.png" alt="" />
      </div>

      <div class="content">
        <label class="favorite">
          <input type="checkbox" hidden />
          <i class="fa-solid fa-heart"></i>
        </label>
        <div class="brandHolder">
          <img class="logoImg" src="<%=request.getContextPath()%>/assets/feralSupps.png" alt="" />
          <p class="brandName">Feral Supps</p>
        </div>
        <p class="productName">FERAL ISOLATE - Chocolate Chaos</p>
        <div class="ratingAndReview">
          <div>
            <i class="fa-solid fa-star"></i>
            <p>4.8</p>
          </div>
          <p style="color: grey">50 reviews</p>
        </div>
        <p class="price">Nrs.4400</p>
        <p class="pickerHead">Flavor</p>
        <div class="options">
          <div class="option">Fruity</div>
          <div class="option active">Chocolate</div>
          <div class="option">Cinnamon</div>
          <div class="option">Vanilla</div>
          <div class="option">Banana</div>
        </div>
        <p class="pickerHead">Size</p>
        <div class="options">
          <div class="option">250g</div>
          <div class="option active">500g</div>
          <div class="option">1 Kg</div>
          <div class="option">2.5 Kg</div>
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
    <script
      src="https://kit.fontawesome.com/b4de01d1c5.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
