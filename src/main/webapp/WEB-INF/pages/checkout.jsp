<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Checkout</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/checkout.css">
</head>
<body>
<jsp:include page="navbar.jsp" />

<c:if test="${param.msg == 'order_placed'}">
  <div class="sucessMsg" id="sucessMsg">Your order was successfully placed!</div>
</c:if>

<c:if test="${not empty requestScope.errorMessage}">
  <div class="errorMsg">${requestScope.errorMessage}</div>
</c:if>

<form action="${pageContext.request.contextPath}/Checkout" method="post">
  <div class="wrapper">

    <!-- Left Side -->
    <div class="left">
      <h1>Checkout</h1>

      <p class="section-title">General Information</p>
      <div class="row">
        <div class="field">
          <label>Full Name <span>*</span></label>
          <input disabled type="text" value="${user.user_first_name} ${user.user_last_name}" />
        </div>
        <div class="field">
          <label>Email</label>
          <input disabled type="email" value="${user.user_email}" />
        </div>
      </div>
      <div class="field half">
        <label>Phone Number <span>*</span></label>
        <input disabled type="tel" value="${user.user_phone_number}" />
      </div>

      <p class="section-title">Delivery Address</p>
      <div class="field half">
        <label>City/District <span>*</span></label>
        <input type="text" name="district" placeholder="Enter your city/district" required />
      </div>
      <div class="row">
        <div class="field">
          <label>Address <span>*</span></label>
          <input type="text" name="address" placeholder="Enter your address" required />
        </div>
        <div class="field">
          <label>Landmark</label>
          <input type="text" name="landmark" placeholder="Optional landmark" />
        </div>
      </div>

      <p class="section-title">Payment Methods</p>
      <div class="payment">
        <label class="pay-card">
          <input type="radio" name="paymentMethod" value="QR" checked />
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="14" y="14" width="3" height="3"/><rect x="18" y="14" width="3" height="3"/><rect x="14" y="18" width="3" height="3"/><rect x="18" y="18" width="3" height="3"/></svg>
          <p>Qr Payment</p>
        </label>
        <label class="pay-card">
          <input type="radio" name="paymentMethod" value="COD" />
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="2" y="6" width="20" height="12" rx="2"/><circle cx="12" cy="12" r="3"/></svg>
          <p>Cash On Delivery</p>
        </label>
        <label class="pay-card">
          <input type="radio" name="paymentMethod" value="Credit/Debit" />
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="2" y="5" width="20" height="14" rx="2"/><line x1="2" y1="10" x2="22" y2="10"/><rect x="6" y="14" width="4" height="2"/></svg>
          <p>Credit/Debit Card</p>
        </label>
      </div>
    </div>

    <!-- Right Side -->
    <div class="right">
      <p class="summary-title">Order Summary</p>

      <div class="productTop">
        <c:forEach var="item" items="${cartItems}">
          <div class="item">
            <c:choose>
              <c:when test="${not empty item.product_image}">
                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(item.product_image)}" alt="product" />
              </c:when>
              <c:otherwise>
                <img src="<%=request.getContextPath()%>/assets/default-product.jpg" alt="product" />
              </c:otherwise>
            </c:choose>
            <div class="item-info">
              <p class="item-name">${item.product_name}</p>
              <p class="item-size">${item.attribute_1} - ${item.attribute_2}</p>
              <p class="item-qty">Quantity: ${item.quantity}</p>
            </div>
            <p class="item-price">NRS ${item.total}</p>
          </div>
        </c:forEach>
      </div>

      <div class="product-info">
        <div class="divider"></div>
        <div class="total-row">
          <span>Sub Total</span>
          <span>NRS ${subTotal}</span>
        </div>
        <div class="total-row">
          <span>Shipping</span>
          <span>NRS ${shipping}</span>
        </div>
        <div class="total-row bold">
          <span>Total</span>
          <span>NRS ${grandTotal}</span>
        </div>
        <button type="submit" class="btn">Place Order</button>
      </div>
    </div>

  </div>
</form>

<jsp:include page="footer.jsp" />

<script>
  const sucessMsg = document.getElementById('sucessMsg');
  if (sucessMsg) {
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