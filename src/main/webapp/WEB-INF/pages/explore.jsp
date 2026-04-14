<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <video src="../assets/explorevideo.mp4" loop autoplay muted></video>
        <div class="main-content">
            <p>NEW IN <br> GYMSHARK ONYX V5</p>
            <div class="shop-now">Check it out</div>
        </div>
    </div>

    <div class="content-1">
        <h2>ONYX</h2>
        <p>Forged in the dark. Built for the light.</p>
    </div>

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

    </div>
    <div class="all-btn">CHCEK IT OUT</div>

    <!-- Limited Stock Section -->
    <div class="main-container-2">
        <img src="../assets/homebg4.png" alt="Homepage">
        <div class="text">
            <p>SHORTS AS VERSATILE <br>AS YOUR TRAINING</p>
            <div class="check-2">CHECK IT OUT</div>
        </div>
    </div>
    <br><br>

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

    </div>

    <div class="all-btn">SHOP NOW</div>

    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
    <jsp:include page="footer.jsp" />
</body>
</html>