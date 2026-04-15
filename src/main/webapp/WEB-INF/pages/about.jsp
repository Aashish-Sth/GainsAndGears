<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | GNG</title>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/about.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <c:import url="/WEB-INF/pages/navbar.jsp" />

    <section class="about-intro">
        <div class="container flex-row">
            <div class="intro-left">
                <p>Look Better.<br>Lift Heavier.</p>
            </div>
            <div class="intro-right">
                <h2>ABOUT US</h2>
                <p>Founded on the sweat of the weight room floor, GNG represents the intersection of science and style. From our lab-tested formulas to our precision-fit activewear, every product we launch is a tool designed to help you break plateaus and look exceptional while doing it.</p>
            </div>
        </div>
    </section>

    <section class="banner">
        <div class="banner-content">
            <blockquote>
                “ Built for the Grind. <br> Fueled for the Gain. ”
            </blockquote>
        </div>
    </section>

    <section class="team-section">
        <div class="container">
            <h2>THE TEAM</h2>
            <p class="subtitle">Meet the brilliant minds behind GNG.</p>
            
            <div class="carousel-container">
                <div class="team-grid">
                    
                    <div class="team-card">
                        <div class="member-img">
                             <img src="T1.jpg" alt="Dilip Shrestha">
                        </div>
                         <div class="member-info">
                            <h3>Dilip Shrestha</h3>
                            <p>Director of Operations & Logistics</p>
                            <div class="social-icons">
                                <i class="fab fa-instagram"></i>
                                <i class="fab fa-facebook"></i>
                                <i class="fab fa-linkedin"></i>
                            </div>
                        </div>
                    </div>

                    <div class="team-card">
                        <div class="member-img">
                             <img src="T2.jpg" alt="Asheesh Shrestha">
                        </div>
                         <div class="member-info">
                            <h3>Asheesh Shrestha</h3>
                            <p>Chief Technology Officer</p>
                            <div class="social-icons">
                                <i class="fab fa-instagram"></i>
                                <i class="fab fa-facebook"></i>
                                <i class="fab fa-linkedin"></i>
                            </div>
                        </div>
                    </div>

                    <div class="team-card active">
                        <div class="member-img">
                             <img src="T3.jpg" alt="Upakar Shrestha">
                        </div>
                        <div class="member-info">
                            <h3>Upakar Shrestha</h3>
                            <p>Brand & Marketing Strategist</p>
                            <div class="social-icons">
                                <i class="fab fa-instagram"></i>
                                <i class="fab fa-facebook"></i>
                                <i class="fab fa-linkedin"></i>
                            </div>
                        </div>
                    </div>

                    <div class="team-card">
                        <div class="member-img">
                            <img src="T4.jpg" alt="Arshnav KC">
                        </div>
                         <div class="member-info">
                            <h3>Arshnav KC</h3>
                            <p>Head of Design & Production</p>
                            <div class="social-icons">
                                <i class="fab fa-instagram"></i>
                                <i class="fab fa-facebook"></i>
                                <i class="fab fa-linkedin"></i>
                            </div>
                        </div>
                    </div>
                     <div class="team-card">
                        <div class="member-img">
                             <img src="T5.jpg" alt="Krish Shrestha">
                        </div>
                         <div class="member-info">
                            <h3>Krish Shrestha</h3>
                            <p>Creative Director</p>
                            <div class="social-icons">
                                <i class="fab fa-instagram"></i>
                                <i class="fab fa-facebook"></i>
                                <i class="fab fa-linkedin"></i>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
       <c:import url="/WEB-INF/pages/footer.jsp" />

</body>
</html>