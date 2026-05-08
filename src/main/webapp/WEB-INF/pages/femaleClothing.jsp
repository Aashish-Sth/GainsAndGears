<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gears --Female</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/femaleClothing.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
    <jsp:include page="navbar.jsp" />
</head>
<body>

    <div class="brandHeader">
        <a href="<%=request.getContextPath()%>/gains" class="brandName">GAINS</a>
    	<a href="<%=request.getContextPath()%>/gears" class="brandName active">GEARS</a>
    </div>

    <div class="filterTabs">
        <a href="<%=request.getContextPath()%>/gears" id="btn-all" class="filterBtn">All</a>
        <a href="<%=request.getContextPath()%>/female" id="btn-her" class="filterBtn active" >For Her</a>
        <a href="<%=request.getContextPath()%>/male" id="btn-him" class="filterBtn">For Him</a>
    </div>

    <div class="card">
        <c:forEach var="p" items="${products}">
            <div class="card-item">
                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(p.product_image)}" alt="${p.product_name}">
                <p>${p.product_name}</p>
                <div class="info"><span class="price">Rs ${p.product_price}</span></div>
            </div>
        </c:forEach>
    </div>


<jsp:include page="footer.jsp" />
</body>
</html>