<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>

<body>
<c:if test="${not empty sessionScope.successMessage}">
    <div class="sucessMsg" id="sucessMsg">${sessionScope.successMessage}</div>
    <% session.removeAttribute("successMessage"); %>
</c:if>
<jsp:include page="navbar.jsp" />

    <!-- Main Section -->
    <div class="main-container">
        <video autoplay loop muted playsinline preload="metadata">
            <source src="<%=request.getContextPath()%>/assets/IndexVideo.mp4" type="video/mp4">
        </video>
        <div class="shop-now">Shop Now</div>
    </div>
    <div class="scroll-arrow-wrap">
        <div class="scroll-arrow" id="scrollArrow">
            <i class="fa-solid fa-chevron-down"></i>
        </div>
    </div>

    <!-- Brand Logos scroll -->
    <div class="brand-logos">
        <div class="brand-track">
            <!-- First set -->
            <a href="https://www.gymshark.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/GymSharkHome.png" alt="Gymshark"></a>
            <a href="https://youngla.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/YoungLAHome.png" alt="YoungLA"></a>
            <a href="https://ghostlifestyle.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/GhostHome.png" alt="Ghost"></a>
            <a href="https://feralsupps.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/FERALHome.png" alt="Feral Supps"></a>
            <a href="https://www.muscleblaze.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/MuscleBlazeHome.png" alt="MuscleBlaze"></a>
            <!-- Duplicate set for infinite loop -->
            <a href="https://www.gymshark.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/GymSharkHome.png" alt="Gymshark"></a>
            <a href="https://youngla.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/YoungLAHome.png" alt="YoungLA"></a>
            <a href="https://ghostlifestyle.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/GhostHome.png" alt="Ghost"></a>
            <a href="https://feralsupps.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/FERALHome.png" alt="Feral Supps"></a>
            <a href="https://www.muscleblaze.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/MuscleBlazeHome.png" alt="MuscleBlaze"></a>
            <!-- Duplicate set for infinite loop -->
            <a href="https://www.gymshark.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/GymSharkHome.png" alt="Gymshark"></a>
            <a href="https://youngla.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/YoungLAHome.png" alt="YoungLA"></a>
            <a href="https://ghostlifestyle.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/GhostHome.png" alt="Ghost"></a>
            <a href="https://feralsupps.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/FERALHome.png" alt="Feral Supps"></a>
            <a href="https://www.muscleblaze.com" target="_blank"><img src="<%=request.getContextPath()%>/assets/MuscleBlazeHome.png" alt="MuscleBlaze"></a>
        </div>
    </div>

    <ul class="pages">
        <li><a href="" class="active">FOR HIM</a></li>
        <li><a href="">FOR HER</a></li>
    </ul>

    <div class="card">
        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/product1.jpg" alt="Product 1">
            <p>Gymshark - Element Sleeve</p>
            <div class="info">
                <span class="price">Rs 3500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/product2.jpg" alt="Product 2">
            <p>Gymshark - Compression T-Shirt</p>
            <div class="info">
                <span class="price">Rs 3000.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <div class="product">
                <img src="<%=request.getContextPath()%>/assets/product3.jpg" alt="Product 3">
                <p>Gymshark - Graphic T-Shirt</p>
            </div>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.2</span>
            </div>
        </div>

        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/product4.jpg" alt="Product 4">
            <p>Gymshark - Oversized T-Shirt</p>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.1</span>
            </div>
        </div>
    </div>

    <div class="all-btn">ALL FOR HIM</div>


    <!-- Supplements Section -->
    <div class="main-container-2">
        <img src="<%=request.getContextPath()%>/assets/homebg2.jpg" alt="Homepage">
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
            <img src="<%=request.getContextPath()%>/assets/protien1.jpg" alt="Product 1">
            <p>Ghost Legend Pre-Workout</p>
            <div class="info">
                <span class="price">Rs 4200.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.7</span>
            </div>
        </div>

        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/protien2.jpg" alt="Product 2">
            <p>MB WrathX Pre-Workout</p>
            <div class="info">
                <span class="price">Rs 3600.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.4</span>
            </div>
        </div>

        <div class="card-item">
            <div class="product">
                <img src="<%=request.getContextPath()%>/assets/protien3.jpg" alt="Product 3">
                <p>Ghost Creatine Monohydrate</p>
            </div>
            <div class="info">
                <span class="price">Rs 2200.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.2</span>
            </div>
        </div>

        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/protien4.jpg" alt="Product 4">
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
        <img src="<%=request.getContextPath()%>/assets/homebg3.png" alt="Homepage">
        <div class="text">
            <p>WAIT THERE'S <br>MORE…</p>
            <div class="shop-now-3">Shop Now</div>
        </div>
    </div>

    <div class="content-2">
        <h2>Limited Stocks</h2>
    </div>

    <div class="card">
        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/product1.jpg" alt="Product 1">
            <p>Gymshark - Element Sleeve</p>
            <div class="info">
                <span class="price">Rs 3500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/product2.jpg" alt="Product 2">
            <p>Gymshark - Compression T-Shirt</p>
            <div class="info">
                <span class="price">Rs 3000.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.5</span>
            </div>
        </div>

        <div class="card-item">
            <div class="product">
                <img src="<%=request.getContextPath()%>/assets/product3.jpg" alt="Product 3">
                <p>Gymshark - Graphic T-Shirt</p>
            </div>
            <div class="info">
                <span class="price">Rs 1500.00</span>
                <span class="rating"><i class="fa-solid fa-star"></i>4.2</span>
            </div>
        </div>

        <div class="card-item">
            <img src="<%=request.getContextPath()%>/assets/product4.jpg" alt="Product 4">
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
    
    <script>
    const sucessMsg = document.getElementById('sucessMsg');
    if (sucessMsg) {
        setTimeout(() => {
            sucessMsg.classList.add('hide');
            setTimeout(() => sucessMsg.remove(), 600);
        }, 2000);
    }

    const scrollArrow = document.getElementById('scrollArrow');
    if (scrollArrow) {
        scrollArrow.addEventListener('click', function () {
            const card = document.querySelector('.card');
            if (card) {
                const yOffset = -90;
                const y = card.getBoundingClientRect().top + window.pageYOffset + yOffset;
                window.scrollTo({ top: y, behavior: 'smooth' });
            }
        });
    }
    </script>
</body>
</html>