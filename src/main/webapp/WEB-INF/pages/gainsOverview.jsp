<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Base64" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gains</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/gainsOverview.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
    <jsp:include page="navbar.jsp" />
</head>
<body>

    <div class="brandHeader">
        <a href="<%=request.getContextPath()%>/gains" class="brandName active">GAINS</a>
    	<a href="<%=request.getContextPath()%>/gears" class="brandName ">GEARS</a>
    </div>
    <!-- Brand header -->
 <div class="card">
    <c:forEach var="p" items="${supplementProducts}">
        <div class="card-item">
            <c:choose>
                <c:when test="${not empty p.product_image}">
                    <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(p.product_image)}" alt="${p.product_name}">
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/assets/default-product.jpg" alt="No Image">
                </c:otherwise>
            </c:choose>
            <p>${p.product_name}</p>
            <div class="info">
                <span class="price">Rs ${p.product_price}</span>
                <span class="rating"><i class="fa-solid fa-star"></i> 4.5</span>
            </div>
        </div>
    </c:forEach>
</div>


</body>
<jsp:include page="footer.jsp" />
</html>