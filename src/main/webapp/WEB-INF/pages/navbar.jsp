<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <c:if test="${empty sessionScope.loggedInUser}">
            <a href="<%=request.getContextPath()%>/login"><i class="fa-regular fa-circle-user"></i>My Profile</a>
            </c:if>
            <c:if test="${not empty sessionScope.loggedInUser}">
            <a href="<%=request.getContextPath()%>/user"><i class="fa-regular fa-circle-user"></i>My Profile</a>
            </c:if>
        </nav>
        <c:if test="${not empty sessionScope.loggedInUser}">
        <a href="${pageContext.request.contextPath}/login?action=logout" class="logout"><i class="fa-solid fa-arrow-right-from-bracket"></i>Log out</a>
        </c:if>
        <c:if test="${empty sessionScope.loggedInUser}">
        <a href="${pageContext.request.contextPath}/signUp" class="logout"><i class="fa-solid fa-user-plus"></i>Sign Up</a>
        </c:if>
        
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
            <c:if test="${empty sessionScope.loggedInUser}">
            <a href="<%=request.getContextPath()%>/login" class="profile-icon"><i class="fa-regular fa-circle-user"></i></a>
            </c:if>
            <c:if test="${not empty sessionScope.loggedInUser}">
            <a href="<%=request.getContextPath()%>/user" class="profile-icon"><i class="fa-regular fa-circle-user"></i></a>
            </c:if>
        </div>

    </nav>
    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
    <script>
    var hamburger = document.getElementById('hamburger');
    var Leftbar = document.getElementById('left-bar');
    var LeftBarClose = document.getElementById('close');
    var LeftBarOverlay = document.getElementById('left-bar-overlay');

    function openBar() {
        Leftbar.classList.add('open');
        LeftBarOverlay.classList.add('active');
    }

    function closeBar() {
        Leftbar.classList.remove('open');
        LeftBarOverlay.classList.remove('active');
    }

    hamburger.addEventListener('click', openBar);
    LeftBarClose.addEventListener('click', closeBar);
    LeftBarOverlay.addEventListener('click', closeBar);
</script>
</body>




</html>