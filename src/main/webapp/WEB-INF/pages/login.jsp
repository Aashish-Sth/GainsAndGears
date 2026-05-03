<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gains & Gearss</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
     <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet">
</head>

<body>
	<c:if test="${not empty sessionScope.successMessage}">
	    <div class="sucessMsg" id="sucessMsg">${sessionScope.successMessage}</div>
	    <% session.removeAttribute("successMessage"); %>
	</c:if>
    <div class="mainContainer">
   <!-- Left Panel -->
    <div class="loginFormContainer">
        <div class="logo">
            <img src="<%=request.getContextPath()%>/assets/gngLogo.png" alt="logo">
        </div>

        <div class="welcomeContainer">
            <h1>Welcome back</h1>
            <p>Please enter your details.</p>
        </div>
        <a href="<%=request.getContextPath()%>/home"><i class="fa-solid fa-xmark cross"></i></a>
      
        <form class="login-form" action="${pageContext.request.contextPath}/login" method="post">
             
                    <label class="inputLable" for="email">Email</label>
                    <input class="inputField" type="text" placeholder="Enter your email address" name="email" required>
              
                    <label class="inputLable" for="password">Password</label>
                    <input class="inputField" type="text" placeholder="Enter your Password" name="password" required>
                      <c:if test="${not empty requestScope.errorMessage}">
            	<p class="errorMsg">${requestScope.errorMessage}</p>
        		</c:if>
               <div class="checkboxArea" style="display: flex;">
                <input  class="checkbox" type="checkbox"> <p>Remember me</p>
               </div>
                

                <button class="submitBtn" type="submit">Submit</button>
                <p>Don't have an account? <a href="<%= request.getContextPath() %>/signUp">Register Now </a></p>
            
        </form>

    </div>

    <div class="right-container">
        <img src="<%=request.getContextPath()%>/assets/loginHero.svg" alt="right-image">

    </div>
    </div>
    <script src="https://kit.fontawesome.com/b4de01d1c5.js" crossorigin="anonymous"></script>
    <script >
    const sucessMsg = document.getElementById('sucessMsg');
    if (sucessMsg) {
        setTimeout(() => {
        	sucessMsg.classList.add('hide');
            setTimeout(() => sucessMsg.remove(), 600); // remove after fade
        }, 2000); // shows for 3 seconds
    }
    </script>
</body>
 

</html>