<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gains and Gears</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/explore.css">
</head>
<body>
	<jsp:include page="navbar.jsp" />
    <div class="main-container">
        <video src="<%=request.getContextPath()%>/assets/gymsharkexplore.mp4" loop autoplay muted></video>
        <div class="main-content">
            <p>NEW IN <br> GYMSHARK ONYX V5</p>
        </div>
    </div>
<!--  
	<div class="content-1">
        <img src=<%=request.getContextPath()%>/assets/gymshark.png"></img>
        <p>Forged in the dark. Built for the light.</p>
    </div> -->

   <div class="card">
        <c:forEach var="p" items="${gymsharkProducts}">
        <a href="<%=request.getContextPath()%>/product/detail?id=${p.product_id}">
        <div class="card-item">
                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(p.product_image)}" alt="${p.product_name}">
                <p>${p.product_name}</p>
                <div class="info"><span class="price">Rs ${p.product_price}</span></div>
            </div>
        </a>
            
        </c:forEach>
    </div>
    

    <!-- Limited Stock Section -->
    <div class="main-container-2">
        <video src="<%=request.getContextPath()%>/assets/younglaexplore.mp4" loop autoplay muted></video>
        <div class="text">
            <p>SHORTS AS VERSATILE <br>AS YOUR TRAINING</p>
        </div>
    </div>
    <br><br>

     <div class="card">
        <c:forEach var="p" items="${younglaProducts}">
        <a href="<%=request.getContextPath()%>/product/detail?id=${p.product_id}">
        <div class="card-item">
                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(p.product_image)}" alt="${p.product_name}">
                <p>${p.product_name}</p>
                <div class="info"><span class="price">Rs ${p.product_price}</span></div>
            </div>
        </a>
            
        </c:forEach>
    </div>

    

    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
    <jsp:include page="footer.jsp" />
</body>
</html>