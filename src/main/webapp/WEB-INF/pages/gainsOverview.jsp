<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <!-- Brand header -->
    <div class="brandHeader">
        <a href="<%=request.getContextPath()%>/gains" class="brandName active">GAINS</a>
    	<a href="<%=request.getContextPath()%>/gears" class="brandName">GEARS</a>
    </div>

    <!-- All gains products -->
    <div class="card">

        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/Ghost1.svg" alt="GHOST WHEY x TRIX">
            <p>GHOST WHEY x TRIX</p>
            <div class="info">
                <span class="price">Rs 4500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.9</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/Ghost2.svg" alt="Pre-Workout MuscleBlaze">
            <p>Pre-Workout MuscleBlaze</p>
            <div class="info">
                <span class="price">Rs 3200.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.7</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/Ghost3.svg" alt="Creatine Monohydrate">
            <p>Creatine Monohydrate</p>
            <div class="info">
                <span class="price">Rs 2800.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.8</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/Ghost4.svg" alt="Mass Gainer XT">
            <p>Mass Gainer XT</p>
            <div class="info">
                <span class="price">Rs 5500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.6</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/Ghost1.svg" alt="Resistance Band Set">
            <p>Resistance Band Set</p>
            <div class="info">
                <span class="price">Rs 1800.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/Ghost2.svg" alt="Adjustable Dumbbell 20kg">
            <p>Adjustable Dumbbell 20kg</p>
            <div class="info">
                <span class="price">Rs 7500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.8</span>
            </div>
        </div>

        <div class="card-item">
            <img src="../<%=request.getContextPath()%>/assets/Ghost3.svg" alt="Lifting Straps Pro">
            <p>Lifting Straps Pro</p>
            <div class="info">
                <span class="price">Rs 950.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.4</span>
            </div>
        </div>

        <div class="card-item">
            <img src="${pageContext.request.contextPath}/Ghost1.svg" alt="Shaker Bottle 700ml">
            <p>Shaker Bottle 700ml</p>
            <div class="info">
                <span class="price">Rs 650.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.3</span>
            </div>
        </div>

    </div>


</body>
<jsp:include page="footer.jsp" />
</html>