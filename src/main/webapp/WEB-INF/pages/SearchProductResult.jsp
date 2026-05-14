<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/maleClothing.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
    <jsp:include page="navbar.jsp" />
</head>
<body>


     <div class="card">
        <c:forEach var="p" items="${productList}">
        <a href="<%=request.getContextPath()%>/product/detail?id=${p.product_id}">
        <div class="card-item">
                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(p.product_image)}" alt="${p.product_name}">
                <p>${p.product_name}</p>
                <div class="info"><span class="price">Rs ${p.product_price}</span></div>
            </div>
        </a>
            
        </c:forEach>
    </div>

<jsp:include page="footer.jsp" />
</body>
</html>