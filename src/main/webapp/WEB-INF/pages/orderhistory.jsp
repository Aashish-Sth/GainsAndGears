<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Order History</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/orderhistory.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

  <div class="page-wrapper">
<!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />
    
     <!-- Main content(Orders) -->
    <main class="main-content">
      <div class="orders-container">

        <h2 class="orders-title">My Orders</h2>

       
        <div class="filter-tabs">
          <button class="tab-btn active">All</button>
          <button class="tab-btn">Shipped</button>
          <button class="tab-btn">To review</button>
        </div>

        
        <div class="search-wrapper">
          <i class="fa-solid fa-magnifying-glass search-icon"></i>
          <input type="text" class="search-input" placeholder="Search by product id, order id etc." />
        </div>

        <div class="order-card">
          <div class="order-header">
            <div class="brand-info">
              <img src="../<%=request.getContextPath()%>/assets/youngla.png" alt="YoungLA logo" class="brand-logo" />
              <span class="brand-name">YoungLA</span>
            </div>
            <span class="order-status">Completed</span>
          </div>
          <div class="order-body">
            <img src="../<%=request.getContextPath()%>/assets/zipup.png" alt="Kove Zip Hoodie" class="product-img" />
            <div class="product-info">
              <p class="product-name">W5215 - Kove Zip Hoodie</p>
              <p class="product-variant">Size - Small</p>
              <p class="product-quantity">Quantity: 1</p>
            </div>
            <p class="product-price">Nrs 2800</p>
          </div>
        </div>

        <div class="order-card">
          <div class="order-header">
            <div class="brand-info">
              <img src="../<%=request.getContextPath()%>/assets/feralsupps.png" alt="Ferral Supps logo" class="brand-logo" />
              <span class="brand-name">Ferral Supps</span>
            </div>
            <span class="order-status">Shipped</span>
          </div>
          <div class="order-body">
            <img src="../<%=request.getContextPath()%>/assets/fruity.png" alt="Feral Isolate" class="product-img" />
            <div class="product-info">
              <p class="product-name">Feral Isolate - Fruity cereal</p>
              <p class="product-variant">Quantity - 250g</p>
              <p class="product-quantity">Quantity: 1</p>
            </div>
            <p class="product-price">Nrs 2800</p>
          </div>
        </div>

        <div class="pagination">
          <button class="page-btn nav-arrow"><i class="fa-solid fa-chevron-left"></i></button>
          <button class="page-btn active">1</button>
          <button class="page-btn">2</button>
          <button class="page-btn">3</button>
          <button class="page-btn nav-arrow"><i class="fa-solid fa-chevron-right"></i></button>
        </div>

      </div>
    </main>

  </div>

</body>
</html>