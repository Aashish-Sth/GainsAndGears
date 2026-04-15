<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <jsp:include page="adminSideBar.jsp" />
    <div class="content">
      <div class="header">
        <div>
          <h1>Welcome, Admin</h1>
          <p>Here's whats happening in your store</p>
        </div>
        <div class="admin-name">Admin 👤</div>
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
            <p class="number">5</p>
          </div>
          <div class="card small-card">
            <p class="label">Completed <span class="dot green"></span></p>
            <p class="number">3</p>
          </div>
          <div class="card small-card">
            <p class="label">Shipped <span class="dot purple"></span></p>
            <p class="number">2</p>
          </div>
          <div class="card small-card">
            <p class="label">Confirmed <span class="dot orange"></span></p>
            <p class="number">1</p>
          </div>
        </div>
      </div>

      <div class="section">
        <h2>Users</h2>
        <div class="row">
          <div class="card small-card">
            <p class="label">All Users</p>
            <p class="number">5</p>
          </div>
          <div class="card small-card">
            <p class="label">Active Users <span class="dot green"></span></p>
            <p class="number">3</p>
          </div>
          <div class="card small-card">
            <p class="label">Inactive Users <span class="dot red"></span></p>
            <p class="number">2</p>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
