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
    <style>
 
.no-reviews {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 40px 20px;
    margin: 20px auto;
    max-width: 400px;
}

.matching {
    text-align: center;     
    font-size: 28px;         
    font-weight: 600;        
    color: #222222;          
    margin: 40px auto 20px; 
    font-family: 'Poppins', sans-serif;
}

.no-review-img {
    width: 100%;
    max-width: 200px; 
    margin-bottom: 20px;
}


.no-review-title {
    font-size: 24px;
    font-weight: bold;
    color: #333333;
    margin: 0 0 10px 0;
}


.no-review-text {
    font-size: 16px;
    color: #666666;
    margin: 0;
    line-height: 1.5;
}
</style>
</head>
<body>

<c:if test="${empty productList}">
          <div class="no-reviews">
            <img class="no-review-img" src="<%=request.getContextPath()%>/assets/noReviews.png" alt="No reviews yet">
            <p class="no-review-title">Whoops!</p>
            <p class="no-review-text">There seem to be no matching products</p>
          </div>
        </c:if>
        
<c:if test="${not empty productList}">

            <p class="matching">Here's what we found for you</p>
         
    
        </c:if>
        
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