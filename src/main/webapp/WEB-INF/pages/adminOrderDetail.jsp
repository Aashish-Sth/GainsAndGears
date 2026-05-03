<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gains & Gears</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminOrderDetail.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"/>
</head>
<body>
<div class="mainContainer">

    <a href="<%=request.getContextPath()%>/admin/orders" class="backBtn">
        <i class="fa-solid fa-chevron-left"></i>
    </a>

  <div class="wrapper">
  

    <!-- Left Side -->
    <div class="left"> 
      <h1>Order Summary</h1>

      <p class="section-title">General Information</p>

      <div class="row">
        <div class="field">
          <label>Full Name <span>*</span></label>
          <input disabled value="${order.fullName}" type="text" />
        </div>
        <div class="field">
          <label>Email</label>
          <input disabled value="${order.userEmail}" type="email" />
        </div>
      </div>

      <div class="field half">
        <label>Phone Number <span>*</span></label>
        <input disabled value="${order.userPhoneNumber}" type="tel" />
      </div>

      <p class="section-title">Delivery Address</p>

      <div class="field half">
        <label>City/District <span>*</span></label>
        <input disabled value="${order.district}" type="text" />
      </div>

      <div class="row">
        <div class="field">
          <label>Address <span>*</span></label>
          <input disabled value="${order.address}" type="text" />
        </div>
        <div class="field">
          <label>Landmark</label>
          <input disabled value="${order.landmark}" type="text" />
        </div>
      </div>

      <p class="section-title">Payment Methods</p>

      <div class="payment">
        <label class="pay-card ">
          <input type="radio" name="pay" ${order.paymentMethod == 'QR' ? 'checked' : ''} />
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="14" y="14" width="3" height="3"/><rect x="18" y="14" width="3" height="3"/><rect x="14" y="18" width="3" height="3"/><rect x="18" y="18" width="3" height="3"/></svg>
          <p>Qr Payment</p>
        </label>

        <label class="pay-card">
          <input type="radio" name="pay" ${order.paymentMethod == 'Credit/Debit' ? 'checked' : ''} />
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="2" y="6" width="20" height="12" rx="2"/><circle cx="12" cy="12" r="3"/></svg>
          <p>Cash On Delivery</p>
        </label>

        <label class="pay-card">
          <input type="radio" name="pay"  ${order.paymentMethod == 'COD' ? 'checked' : ''} />
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="2" y="5" width="20" height="14" rx="2"/><line x1="2" y1="10" x2="22" y2="10"/><rect x="6" y="14" width="4" height="2"/></svg>
          <p>Credit/Debit Card</p>
        </label>
      </div>
    </div>

    <!-- Right Side -->
    <div class="right">
    <div class="productTop">
      <p class="summary-title">Order Summary</p>
      <c:forEach var="item" items="${order.items}">
      <div class="item">
        <img src="../<%=request.getContextPath()%>/assets/wheyXtrix.png" alt="product" />
        <div class="item-info">
          <p class="item-name">${item.productName}</p>
           <p class="item-size">${item.attribute1} - ${item.attribute2}</p>
          <p class="item-qty">Quantity: ${item.quantity}</p>
        </div>
        <p class="item-price">NRS ${item.price}</p>
      </div>
      </c:forEach>
</div>

      <div class ="product-info">
      <div class="divider"></div>

      <div class="total-row">
        <span>Sub Total</span>
        <span>NRS ${order.totalPrice}</span>
      </div>
      <div class="total-row">
        <span>Shipping</span>
        <span>NRS 00.00</span>
      </div>
      <div class="total-row bold">
        <span>Total</span>
        <span>NRS ${order.totalPrice}</span>
      </div>

    </div>
</div>
  </div>
  
  
   </div>

<script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
</body>
</html>