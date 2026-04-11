<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gains and Gears</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Protest+Revolution&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
    <jsp:include page="navbar.jsp" />
</head>

<body>
    <!-- Main Section -->
    <div class="main-container">
        <img src="../assets/homebg.png" alt="Homepage">
        <div class="shop-now">Shop Now</div>
    </div>

    <ul class="pages">
        <li style="text-decoration: underline;"><a href="">FOR HIM</a></li>
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

    </div>

    <div class="all-btn">ALL FOR HIM</div>


    <!-- Supplments Section -->
    <div class="main-container-2">
        <img src="../assets/homebg2.jpg" alt="Homepage">
        <div class="text">
            <p>Unlock Your <br> Body's Potential.</p>
            <div class="shop-now-2">Shop Now</div>
        </div>
    </div>

    <div class="content-1">
        <h2>Recover Faster, Go Harder</h2>
    </div>

    <div class="card">
        <div class="card-item">
            <img src="../assets/protien1.jpg" alt="Product 1">
            <p>Ghost Legend Pre-Workout</p>
            <div class="info">
                <span class="price">Rs 4200.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.7</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../assets/protien2.jpg" alt="Product 2">
            <p>MB WrathX Pre-Workout</p>
            <div class="info">
                <span class="price">Rs 3600.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.4</span>
            </div>
        </div>

        <div class="card-item">
            <div class="product">
                <img src="../assets/protien3.jpg" alt="Product 3">
                <p>Ghost Creatine Monohydrate</p>
            </div>
            <div class="info">
                <span class="price">Rs 2200.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.2</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../assets/protien4.jpg" alt="Product 4">
            <p>Ghost Whey Protein</p>
            <div class="info">
                <span class="price">Rs 4800.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.8</span>
            </div>
        </div>

    </div>

    <div class="all-btn">VIEW SUPPLEMENTS</div>


    <!-- Limited Stock Section -->
    <div class="main-container-2">
        <img src="../assets/homebg3.png" alt="Homepage">
        <div class="text">
            <p>WAIT THERE’S <br>MORE…</p>
            <div class="shop-now-3">Shop Now</div>
        </div>
    </div>

    <div class="content-2">
        <h2>Limited Stocks</h2>
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

    <div class="all-btn">SHOP NOW</div>



    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
</body>

<jsp:include page="footer.jsp" />
</html>