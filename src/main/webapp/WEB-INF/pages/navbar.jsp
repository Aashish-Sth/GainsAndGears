<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gains and Gears</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/navbar.css">
</head>
<body>

    <div class="left-bar-overlay" id="left-bar-overlay"></div>

    <!-- Left bar -->
    <div class="left-bar" id="left-bar">
        <button class="close-button" id="close">X</button>
        <nav class="left-nav">
            <a href="<%=request.getContextPath()%>/gears" class="desktop-hidden"><i class="fa-solid fa-mars"></i>Men</a>
            <a href="<%=request.getContextPath()%>/gears" class="desktop-hidden"><i class="fa-solid fa-venus"></i>Women</a>
            <a href="<%=request.getContextPath()%>/gains" class="desktop-hidden"><i class="fa-solid fa-dumbbell"></i>Supplements</a>
            <a href="<%=request.getContextPath()%>/explore" class="desktop-hidden"><i class="fa-solid fa-bag-shopping"></i>Explore</a>
            <a href="<%=request.getContextPath()%>/about"><i class="fa-solid fa-circle-info"></i>About us</a>
            <a href="<%=request.getContextPath()%>/contact"><i class="fa-regular fa-envelope"></i>Contact Us</a>
            <a href="<%=request.getContextPath()%>/signUp"><i class="fa-regular fa-circle-user"></i>My Profile</a>
        </nav>
        <button class="logout"><i class="fa-solid fa-arrow-right-from-bracket"></i>Log out</button>
    </div>

    <!-- Navigation Bar -->
    <nav class="nav-bar">

        <!-- Navigation List -->
        <div class="nav-list">
            <ul style="list-style: none;">
                <li class="hamburger-item">
                    <button class="hamburger" id="hamburger">
                        <i class="fa-solid fa-bars"></i>
                    </button>
                </li>
                <li class="nav-link"><a href="<%=request.getContextPath()%>/gears">Women</a></li>
                <li class="nav-link"><a href="<%=request.getContextPath()%>/gears">Men</a></li>
                <li class="nav-link"><a href="<%=request.getContextPath()%>/gains">Supplements</a></li>
                <li class="nav-link"><a href="<%=request.getContextPath()%>/explore">Explore</a></li>
            </ul>
        </div>

        <!-- Logo -->
        <div class="logo">

            <img src="<%=request.getContextPath()%>/assets/gngLogo.png" alt="Logo">

        </div>

        <!-- Search Bar (desktop) -->
        <div class="nav-search">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" placeholder="What are you looking for...">
        </div>

        <!-- User Info -->
        <div class="info">
            <a href="" class="search-icon-mobile"><i class="fa-solid fa-magnifying-glass"></i></a>
            <a ><i class="fa-solid fa-bag-shopping"></i></a>
            <a><i class="fa-regular fa-heart"></i></a>
            <a href="<%=request.getContextPath()%>/signUp" class="profile-icon"><i class="fa-regular fa-circle-user"></i></a>
        </div>

    </nav>
    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
</body>




</html>