<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/navbar.css">
</head>
<body>

	<div class="left-bar-overlay" id="left-bar-overlay"></div>

    <!-- Left bar -->
    <div class="left-bar" id="left-bar">
        <button class="close-button" id="close">X</button>
        <nav class="left-nav">
            <a href=""><i class="fa-solid fa-bag-shopping"></i>Explore</a>
            <a href=""><i class="fa-solid fa-circle-info"></i>About us</a>
            <a href=""><i class="fa-regular fa-envelope"></i>Contact Us</a>
            <a href=""><i class="fa-regular fa-circle-user"></i>My Profile</a>
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
                <li ><a href=""><i class="fa-solid fa-bars" style="color: #000000;"></i></a></li>
                <li><a href="">Women</a></li>
                <li><a href="">Men</a></li>
                <li><a href="">Supplements</a></li>
                <li><a href="">Explore</a></li>
            </ul>
        </div>

        <!-- Logo -->
        <div class="logo">
            <img src="../../assets/gngLogo.png" alt="Logo">
        </div>

        <!-- Search Bar -->
        <div class="nav-search">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" placeholder="What are you looking for...">
        </div>

        <!-- User Info -->
        <div class="info">
            <span><i class="fa-solid fa-bag-shopping"></i></span>
            <span><i class="fa-regular fa-heart"></i></span>
            <span><i class="fa-regular fa-circle-user"></i></span>
        </div>

    </nav>
<script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>   
</body>

<script>
    var hamburger  = document.getElementById('hamburger');
    var Leftbar        = document.getElementById('left-bar');
    var LeftBarClose   = document.getElementById('close');
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

</html>