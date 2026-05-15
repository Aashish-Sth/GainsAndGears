<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gains & Gears</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/contactUs.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap"
      rel="stylesheet"
    />

    <!-- Font Awesome for social icons -->
    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
	
  </head>
  <body>
	<jsp:include page="navbar.jsp" />
    <!-- Upper main container -->
    <div class="mainContainer">

      <!-- Left info -->
      <div class="contactInfo">
        <h1 class="heading">Get in Touch</h1>

        <div class="infoBlock">
          <p class="infoLabel">Email:</p>
          <p class="infoValue">gng@gmail.com</p>
        </div>

        <div class="infoBlock">
          <p class="infoLabel">Phone:</p>
          <p class="infoValue">9869750231</p>
        </div>

        <div class="infoBlock">
          <p class="infoLabel">Address:</p>
          <p class="infoValue">Kamal Pokhari, Kathmandu</p>
        </div>

        <!-- Social icons -->
        <div class="socialBlock">
          <p class="infoLabel">Follow Us:</p>
          <div class="socialIcons">
            <a href="#" class="socialIcon"><i class="fa-brands fa-instagram" ></i></a>
            <a href="#" class="socialIcon"><i class="fa-brands fa-facebook" ></i></a>
            <a href="#" class="socialIcon"><i class="fa-brands fa-linkedin"></i></a>
            <a href="#" class="socialIcon"><i class="fa-brands fa-x-twitter"></i></a>
          </div>
        </div>
      </div>

      <!-- Right Form -->

<form action="mailto:gng@gmail.com?subject=Gains %26 Gears - Contact Inquiry" method="post" enctype="text/plain" class="contactForm">
    <div class="formRow">
    <div class="formGroup">
      <label class="inputLabel">Your Name</label>
     
      <input class="inputField" type="text" name="Visitor Name" placeholder="Your full name" required />
    </div>
    <div class="formGroup">
      <label class="inputLabel">Email Address</label>
      <input class="inputField" type="email" name="Reply-To Email" placeholder="Your email address" required />
    </div>
  </div>

  <div class="formGroup fullWidth">
    <label class="inputLabel">Message</label>
  
    <textarea class="textArea" name="Message Details" placeholder="Write something..." required></textarea>
  </div>

  <button type="submit" class="btn">Send Message</button>

</form>
</div>

<div class="shopNowSection">
    <img src="<%=request.getContextPath()%>/assets/homebg3.svg" alt="Gym Banner" class="shopNowImage">
    <div class="shopNowContent">
        <h2 class="shopNowText">DON'T MISS<br />THIS</h2>
       
        <a href="<%=request.getContextPath()%>/products.jsp" class="shopNowBtn">Shop Now</a>
    </div>
</div>
    <jsp:include page="footer.jsp" />
  </body>
</html>