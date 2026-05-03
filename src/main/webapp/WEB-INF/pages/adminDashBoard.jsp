<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Gains & Gears</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminDashBoard.css" />
  </head>
  <body>
  <c:if test="${not empty sessionScope.successMessage}">
	    <div class="sucessMsg" id="sucessMsg">${sessionScope.successMessage}</div>
	    <% session.removeAttribute("successMessage"); %>
	</c:if>
  <jsp:include page="adminSideBar.jsp" />
    <div class="content">
      <div class="header">
        <div>
          <h1>Welcome, Admin</h1>
          <p>Here's whats happening in your store</p>
        </div>
</div>
      <div class="section">
        <h2>Sales</h2>
        <div class="row">
          <div class="card big-card">
            <p class="label">Total Sales</p>
            <p class="price">Rs 24,90,000</p>
          </div>
          <div class="card big-card">
            <p class="label">Total Sold Products</p>
            <p class="price">86000</p>
          </div>
        </div>
      </div>

      <div class="section">
        <h2>Orders</h2>
        <div class="row">
          <div class="card small-card">
            <p class="label">Total orders</p>
            <p class="number">${totalOrder}</p>
          </div>
          <div class="card small-card">
            <p class="label">Completed <span class="dot green"></span></p>
            <p class="number">${completedOrders}</p>
          </div>
          <div class="card small-card">
            <p class="label">Shipped <span class="dot purple"></span></p>
            <p class="number">${shippedOrders}</p>
          </div>
          <div class="card small-card">
            <p class="label">Confirmed <span class="dot orange"></span></p>
            <p class="number">${confirmedOrders}</p>
          </div>
        </div>
      </div>

      <div class="section">
        <h2>Users</h2>
        <div class="row">
          <div class="card small-card">
            <p class="label">All Users</p>
            <p class="number">${totalCount}</p>
          </div>
          <div class="card small-card">
            <p class="label">Active Users <span class="dot green"></span></p>
            <p class="number">${activeCount}</p>
          </div>
          <div class="card small-card">
            <p class="label">Inactive Users <span class="dot red"></span></p>
            <p class="number">${inactiveCount}</p>
          </div>
        </div>
      </div>
       <div class="section">
        <h2>Products</h2>
        <div class="row">
          <div class="card small-card">
            <p class="label">All Products</p>
            <p class="number">${totalProducts}</p>
          </div>
          <div class="card small-card">
            <p class="label">Available Products <span class="dot green"></span></p>
            <p class="number">${availableProducts}</p>
          </div>
          <div class="card small-card">
            <p class="label">Unavailable Products <span class="dot red"></span></p>
            <p class="number">${unavailableProducts}</p>
          </div>
        </div>
      </div>
    </div>
    <script >
    const sucessMsg = document.getElementById('sucessMsg');
    if (sucessMsg) {
        setTimeout(() => {
        	sucessMsg.classList.add('hide');
            setTimeout(() => sucessMsg.remove(), 600); // remove after fade
        }, 2000); // shows for 3 seconds
    }
    </script>
  </body>
</html>
