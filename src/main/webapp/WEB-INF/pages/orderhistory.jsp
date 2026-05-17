<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Base64" %>
    
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
<jsp:include page="navbar.jsp"/>
  <div class="page-wrapper">
    <jsp:include page="sidebar.jsp" />

    <div class="main-content">
      <div class="orders-container">

        <h2 class="orders-title">My Orders</h2>

        <%-- Filter tabs --%>
        <div class="filter-tabs">
          <a href="<%=request.getContextPath()%>/OrderHistory?filter=all"
             class="tab-btn ${activeFilter == 'all' ? 'active' : ''}">All</a>
          <a href="<%=request.getContextPath()%>/OrderHistory?filter=Completed"
             class="tab-btn ${activeFilter == 'Completed' ? 'active' : ''}">Completed</a>
          <a href="<%=request.getContextPath()%>/OrderHistory?filter=Shipped"
             class="tab-btn ${activeFilter == 'Shipped' ? 'active' : ''}">Shipped</a>
          <a href="<%=request.getContextPath()%>/OrderHistory?filter=Confirmed"
             class="tab-btn ${activeFilter == 'Confirmed' ? 'active' : ''}">Confirmed</a>
        </div>

        <%-- Empty state --%>
        <c:if test="${empty orders}">
          <div class="empty-orders">
            <i class="fa-solid fa-box-open"></i>
            <p>No ${activeFilter == 'all' ? '' : activeFilter} orders found.</p>
          </div>
        </c:if>

        <%-- Order cards --%>
        <c:if test="${not empty orders}">
          <c:forEach var="order" items="${orders}">
            <div class="order-card">
              <div class="order-header">
                <div class="brand-info">
                  <img src="<%=request.getContextPath()%>/${
                      order.productBrand == 'YoungLA' ? 'assets/youngLA.png' :
                      order.productBrand == 'Gymshark' ? 'assets/gymshark.png' :
                      order.productBrand == 'Fuaark' ? 'assets/fuaark.jpg' :
                      order.productBrand == 'Ghost' ? 'assets/ghost.png' :
                      order.productBrand == 'Feral' ? 'assets/feral.png' :
                      'assets/muscleBlaze.png'
                  }" alt="${order.productBrand}" class="brand-logo" />
                  <span class="brand-name">${order.productBrand}</span>
                </div>
                <span class="order-status ${
                    order.orderStatus == 'Completed' ? 'completed' :
                    order.orderStatus == 'Shipped' ? 'shipped' : 'confirmed'
                }">${order.orderStatus}</span>
              </div>

              <div class="order-body">
                <c:choose>
                  <c:when test="${not empty order.productImage}">
                    <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(order.productImage)}"
                         alt="${order.productName}" class="product-img" />
                  </c:when>
                  <c:otherwise>
                    <img src="<%=request.getContextPath()%>/assets/default-product.jpg"
                         alt="product" class="product-img" />
                  </c:otherwise>
                </c:choose>

                <div class="product-info">
                  <p class="product-name">${order.productName}</p>
                  <p class="product-variant">${order.attribute1} - ${order.attribute2}</p>
                  <p class="product-quantity">Quantity: ${order.quantity}</p>
                </div>
                <p class="product-price">NRS ${order.price}</p>
              </div>
            </div>
          </c:forEach>
        </c:if>

      </div>
    </div>
  </div>
<jsp:include page="footer.jsp"/>
</body>
</html>