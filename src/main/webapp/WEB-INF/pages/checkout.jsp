<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Checkout</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/checkout.css">
</head>
<body>
<jsp:include page="navbar.jsp" />

  <div class="wrapper">

    <!-- Left Side -->
    <div class="left"> 
      <h1>Checkout</h1>

      <p class="section-title">General Information</p>

      <div class="row">
        <div class="field">
          <label>Full Name <span>*</span></label>
          <input type="text" />
        </div>
        <div class="field">
          <label>Email</label>
          <input type="email" />
        </div>
      </div>

      <div class="field half">
        <label>Phone Number <span>*</span></label>
        <input type="tel" />
      </div>

      <p class="section-title">Delivery Address</p>

      <div class="field half">
        <label>City/District <span>*</span></label>
        <input type="text" />
      </div>

      <div class="row">
        <div class="field">
          <label>Address <span>*</span></label>
          <input type="text" />
        </div>
        <div class="field">
          <label>Landmark</label>
          <input type="text" />
        </div>
      </div>

      <p class="section-title">Payment Methods</p>

      <div class="payment">
        <label class="pay-card ">
          <input type="radio" name="pay" checked />
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="14" y="14" width="3" height="3"/><rect x="18" y="14" width="3" height="3"/><rect x="14" y="18" width="3" height="3"/><rect x="18" y="18" width="3" height="3"/></svg>
          <p>Qr Payment</p>
        </label>

        <label class="pay-card">
          <input type="radio" name="pay" />
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="2" y="6" width="20" height="12" rx="2"/><circle cx="12" cy="12" r="3"/></svg>
          <p>Cash On Delivery</p>
        </label>

        <label class="pay-card">
          <input type="radio" name="pay" />
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="2" y="5" width="20" height="14" rx="2"/><line x1="2" y1="10" x2="22" y2="10"/><rect x="6" y="14" width="4" height="2"/></svg>
          <p>Credit/Debit Card</p>
        </label>
      </div>
    </div>

    <!-- Right Side -->
    <div class="right">
      <p class="summary-title">Order Summary</p>

      <div class="item">
        <img src="../../assets/wheyXtrix.png" alt="product" />
        <div class="item-info">
          <p class="item-name">GHOST WHEY x TRIX</p>
          <p class="item-qty">Quantity: 1</p>
        </div>
        <p class="item-price">NRS 2000.00</p>
      </div>

      <div class="item">
        <img src="../../assets/zipup.png" alt="product" />
        <div class="item-info">
          <p class="item-name">W5215 - Kove Zip Hoodie</p>
          <p class="item-size">Size - Small</p>
          <p class="item-qty">Quantity: 1</p>
        </div>
        <p class="item-price">NRS 2000.00</p>
      </div>

      <div class ="product-info">
      <div class="divider"></div>

      <div class="total-row">
        <span>Sub Total</span>
        <span>NRS 4000.00</span>
      </div>
      <div class="total-row">
        <span>Shipping</span>
        <span>NRS 399.00</span>
      </div>
      <div class="total-row bold">
        <span>Total</span>
        <span>NRS 4399.00</span>
      </div>

      <button class="btn">Place Order</button>
    </div>
</div>
  </div>
  <jsp:include page="footer.jsp" />

</body>
</html>