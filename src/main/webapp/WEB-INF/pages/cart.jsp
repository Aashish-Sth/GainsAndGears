<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<title>Cart</title>
</head>
<body>

    <div class="cartPanel">

        <!-- Top bar -->
        <div class="cartNavBar">
            <p class="cartTitle" id="cartTitle">YOUR BAG</p>

            <div class="togglePill">
                <button class="toggleBtn active" id="bagBtn" onclick="switchTab('bag')">
                    <i class="fa-solid fa-bag-shopping"></i>
                </button>
                <button class="toggleBtn" id="wishBtn" onclick="switchTab('wish')">
                    <i class="fa-solid fa-heart"></i>
                </button>
            </div>

            <button class="closeBtn">&#10005;</button>
        </div>

        <!-- YOUR BAG -->
        <div class="tabSection" id="bagSection">

            <div class="itemCard">
               <img class="itemImg" src="${pageContext.request.contextPath}/assets/Ghost1.svg" alt="GHOST WHEY x TRIX">
              
                <div class="itemDetails">
                    <p class="itemName">GHOST WHEY x TRIX</p>
                    <p class="itemQty">Quantity: 1</p>
                </div>
                <div class="itemRight">
                    <p class="itemPrice">Rs. 4,500</p>
                    <button class="removeBtn" onclick="removeItem(this)">
                        <i class="fa-solid fa-trash"></i>
                    </button>
                </div>
            </div>

            <div class="itemCard">
               <img class="itemImg" src="${pageContext.request.contextPath}/assets/product2.jpg" alt="W5215 - Kove Zip Hoodie">
                     
                <div class="itemDetails">
                    <p class="itemName">W5215 - Kove Zip Hoodie</p>
                    <p class="itemMeta">Size - Small</p>
                    <p class="itemQty">Quantity: 1</p>
                </div>
                <div class="itemRight">
                    <p class="itemPrice">Rs. 7,500</p>
                    <button class="removeBtn" onclick="removeItem(this)">
                        <i class="fa-solid fa-trash"></i>
                    </button>
                </div>
            </div>

            <!-- Footer -->
            <div class="cartFooter">
                <div class="footerRow">
                    <p class="footerLabel">Total</p>
                    <p class="footerTotal">Rs. 12,000</p>
                </div>
                <div class="footerRow">
                    <p class="footerLabel">Shipping</p>
                    <p class="footerShipping">Cost will appear on check out</p>
                </div>
                <button class="checkoutBtn">CHECKOUT</button>
            </div>

        </div>

        <!-- YOUR WISHLIST -->
        <div class="tabSection" id="wishSection" style="display: none;">

            <div class="itemCard">
                <img class="itemImg" src="${pageContext.request.contextPath}/assets/Ghost2.svg" alt="Pre-Workout MuscleBlaze">
                     
                <div class="itemDetails">
                    <p class="itemName">Pre-Workout MuscleBlaze</p>
                    <p class="itemPrice">$20.99</p>
                    <a class="viewLink" href="productGains.html">View Product</a>
                </div>
                <button class="removeBtn" onclick="removeItem(this)">
                    <i class="fa-solid fa-circle-xmark"></i>
                </button>
            </div>

        </div>

    </div>

    <script>
    function switchTab(tab) 
    {
      var bagSection = document.getElementById("bagSection");
      var wishSection = document.getElementById("wishSection");
      var bagBtn = document.getElementById("bagBtn");
      var wishBtn = document.getElementById("wishBtn");
      var title = document.getElementById("cartTitle");

      if (tab === "bag") {
          bagSection.style.display  = "flex";
          wishSection.style.display = "none";
          bagBtn.classList.add("active");
          wishBtn.classList.remove("active");
          title.textContent = "YOUR BAG";
      }

      if (tab === "wish") {
          wishSection.style.display = "flex";
          bagSection.style.display  = "none";
          wishBtn.classList.add("active");
          bagBtn.classList.remove("active");
          title.textContent = "YOUR WISHLIST";
      }
    } 

    function removeItem(btn) {
        btn.closest(".itemCard").remove();
    }
    </script>
</body>
</html>