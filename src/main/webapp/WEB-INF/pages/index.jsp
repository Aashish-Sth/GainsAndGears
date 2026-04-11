<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
</head>
<jsp:include page="navbar.jsp" />
<body>
	<div class="main-container">
        <img src="../assets/homebg.png" alt="Homepage">
        <div class="shop-now">Shop Now</div>
    </div>

    <ul class="pages">
        <li><a href="">FOR HIM</a></li>
        <li><a href="">FOR HER</a></li>
    </ul>

    <div class="card">
        <div class="card-item">
            <img src="../assets/product1.jpg" alt="Product 1">
            <p>Gymshark - Element Sleeve</p>
            <div class="info">
                <span class="price">Rs 3500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../assets/product2.jpg" alt="Product 2">
            <p>Gymshark - Compression T-Shirt</p>
            <div class="info">
                <span class="price">Rs 3000.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <div class="product">
                <img src="../assets/product3.jpg" alt="Product 3">
                <p>Gymshark - Graphic T-Shirt</p>
            </div>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.2</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../assets/product4.jpg" alt="Product 4">
            <p>Gymshark - Oversized T-Shirt</p>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.1</span>
            </div>
        </div>
        <div class="extra">

        </div>

    </div>
    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
</body>
<jsp:include page="footer.jsp" />
</html>