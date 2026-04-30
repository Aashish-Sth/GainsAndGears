<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gears - All</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/gearsOverview.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
    <jsp:include page="navbar.jsp" />
</head>
<body>

    <!-- Brand header -->
    <div class="brandHeader">
        <a href="<%=request.getContextPath()%>/gains" class="brandName">GAINS</a>
    	<a href="<%=request.getContextPath()%>/gears" class="brandName active">GEARS</a>
    </div>

    <!-- Filter tabs -->
    <div class="filterTabs">
        <a href="<%=request.getContextPath()%>/gearsOverview" class="filterBtn active">All</a>
        <a href="<%=request.getContextPath()%>/productGearsHer" class="filterBtn">For Her</a>
        <a href="<%=request.getContextPath()%>/productGearsHim" class="filterBtn">For Him</a>
    </div>

    <!-- Product grid -->
    <div class="card">

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product1.jpg" alt="Gymshark - Element Sleeve">
            <p>Gymshark - Element Sleeve</p>
            <div class="info">
                <span class="price">Rs 3500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product2.jpg" alt="Gymshark - Compression T-Shirt">
            <p>Gymshark - Compression T-Shirt</p>
            <div class="info">
                <span class="price">Rs 3000.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product3.jpg" alt="Gymshark - Graphic T-Shirt">
            <p>Gymshark - Graphic T-Shirt</p>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.2</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product4.jpg" alt="Gymshark - Oversized T-Shirt">
            <p>Gymshark - Oversized T-Shirt</p>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.1</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product1.jpg" alt="Gymshark - Element Sleeve">
            <p>Gymshark - Element Sleeve</p>
            <div class="info">
                <span class="price">Rs 3500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product2.jpg" alt="Gymshark - Compression T-Shirt">
            <p>Gymshark - Compression T-Shirt</p>
            <div class="info">
                <span class="price">Rs 3000.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product3.jpg" alt="Gymshark - Graphic T-Shirt">
            <p>Gymshark - Graphic T-Shirt</p>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.2</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product4.jpg" alt="Gymshark - Oversized T-Shirt">
            <p>Gymshark - Oversized T-Shirt</p>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.1</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product1.jpg" alt="Gymshark - Element Sleeve">
            <p>Gymshark - Element Sleeve</p>
            <div class="info">
                <span class="price">Rs 3500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product2.jpg" alt="Gymshark - Compression T-Shirt">
            <p>Gymshark - Compression T-Shirt</p>
            <div class="info">
                <span class="price">Rs 3000.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product3.jpg" alt="Gymshark - Graphic T-Shirt">
            <p>Gymshark - Graphic T-Shirt</p>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.2</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/product4.jpg" alt="Gymshark - Oversized T-Shirt">
            <p>Gymshark - Oversized T-Shirt</p>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.1</span>
            </div>
        </div>

        

    </div>

</body>
<jsp:include page="footer.jsp" />
</html>