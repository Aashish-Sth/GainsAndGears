<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gains & Gears</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminOrder.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
</head>

<body>
<jsp:include page="adminSideBar.jsp" />
    <div class="page-content">
        <h1 class="page-title">Orders</h1>
		<c:if test="${not empty orderList}">
        <div class="main-card">
            <div class="card">
                <span class="label">Total Orders</span>
                <span class="number">${totalOrder}</span>
            </div>
            <div class="card">
                <span class="label">Completed<span class="dot green"></span></span>
                <span class="number">${completedOrders}</span>
            </div>
            <div class="card">
                <span class="label">Shipped<span class="dot purple"></span></span>
                <span class="number">${shippedOrders}</span>
            </div>
            <div class="card">
                <span class="label">Confirmed<span class="dot orange"></span></span>
                <span class="number">${confirmedOrders}</span>
            </div>
        </div>

        <div class="table-container">
            <div class="table-top">
                
                <div class="search-box">
                    <form action="${pageContext.request.contextPath}/admin/orders" method="post" class="choice">
                    <button 
                    type="submit" 
                    name="filter"
                    value="all"
                    class="btn ${requestScope.activeFilter == 'all' ? 'activeBtn' : ''}">All</button>
                    
                    <button 
                    type="submit"
                    name="filter"
                    value="Completed" 
                    class="btn ${requestScope.activeFilter == 'Completed' ? 'activeBtn' : ''}">Completed</button>
                   
                    <button 
                    type="submit" 
                    name="filter"
                    value="Shipped"
                    class="btn ${requestScope.activeFilter == 'Shipped' ? 'activeBtn' : ''}">Shipped</button>
                    
                    <button 
                    type="submit" 
                    name="filter"
                    value="Confirmed"
                    class="btn ${requestScope.activeFilter == 'Confirmed' ? 'activeBtn' : ''}">Confirmed</button>
                </form>
                </div>
            </div>

            <table class="user-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Payment</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Details</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orderList}">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.fullName}</td>
                    <td><span class="badge ${order.paymentStatus == 'Success' ? 'success-badge' : 'cod-badge'}">${order.paymentStatus}</span></td>
                    <td>${order.orderDate}</td>
                    <td><span 
                    class="badge ${order.orderStatus == 'Completed' ? 'completed-badge' :
                     order.orderStatus == 'Shipped' ? 'shipped-badge' : 'confirmed-badge'
                     } "
                    >${order.orderStatus}</span></td>
                    <td><i class="fa-solid fa-chevron-right"></i></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        </c:if>
		<c:if test="${empty orderList}">
		<div class="emptyOrders">
    <div class="bagSearch">
      <img src="<%=request.getContextPath()%>/assets/noOrders.svg" alt="No orders yet" />
    </div>
 
    <div class="emptyOrderText">
      <p class="main">Orders from customers will appear here.</p>
      <p>There are no orders yet</p>
    </div>
  </div>

		</c:if>
    </div>


    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
</body>
</html>