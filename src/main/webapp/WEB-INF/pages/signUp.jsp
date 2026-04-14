<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gains & Gears</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/signUp.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="mainContainer">
      <div class="heroImgContainer">
        <img class="heroImg" src="<%=request.getContextPath()%>/assets/signupHero.svg" alt="" />
      </div>

      <div class="signUpForm">
        <img class="logo" src="<%=request.getContextPath()%>/assets/gngLogo.png" alt="" />
        <p class="head">Please enter your details.</p>
        <p><i class="fa-solid fa-xmark cross"></i></p>
        
        <c:choose>
        <c:when test="${ empty param.step or param.step == 'first'}">
          <form class="inputForm" action="${pageContext.request.contextPath}/signUpController" method="post">
          <input type="hidden" name="step" value="first">
            <label class="inputLable">First Name</label>
            <input
              placeholder="First name"
              class="inputField"
              type="text"
              name="firstName"
              value="${not empty requestScope.firstName ? requestScope.firstName : sessionScope.firstName}"
            />

            <label class="inputLable">Last Name</label>
            <input
              placeholder="Last name"
              class="inputField"
              type="text"
              name="lastName"
              value="${not empty requestScope.lastName ? requestScope.lastName : sessionScope.lastName}"
            />

            <label class="inputLable">Email</label>
            <input
              placeholder="Email"
              class="inputField"
              type="text"
              name="email"
              value="${not empty requestScope.email ? requestScope.email : sessionScope.email}"
            />

            <label class="inputLable">Phone Number</label>
            <input
              placeholder="Phone Number"
              class="inputField"
              type="text"
              name="phoneNumber"
              value="${not empty requestScope.phoneNumber ? requestScope.phoneNumber : sessionScope.phoneNumber}"
            />
            <label class="inputLable">Gender</label>
			<div class="genderContainer">

		    <label class="genderOption">
		        <input type="radio" name="gender" value="male" 
		               ${requestScope.gender == 'male' or sessionScope.gender == 'male' ? 'checked' : ''} />
		        Male
		    </label>
		
		    <label class="genderOption">
		        <input type="radio" name="gender" value="female"
		               ${requestScope.gender == 'female' or sessionScope.gender == 'female' ? 'checked' : ''} />
		        Female
		    </label>
		
		    <label class="genderOption">
		        <input type="radio" name="gender" value="other"
		               ${requestScope.gender == 'other' or sessionScope.gender == 'other' ? 'checked' : ''} />
		        Other
		    </label>
		    </div>
             <c:if test="${not empty requestScope.errorMessage}">
            <p class="errorMsg">${requestScope.errorMessage}</p>
        </c:if>
            <button id="continueBtn" class="btn">Continue</button>
          
          </form>
        </c:when>
        
        
        
        <c:when test="${param.step == 'second'}">
         <form class="inputForm" action="${pageContext.request.contextPath}/signUpController" method="post">
         	<input type="hidden" name="step" value="second" />
            <label class="inputLable">Password</label>
            <input
              placeholder="Password"
              class="inputField"
              type="password"
              name="password"
              id=""
            />

            <label class="inputLable">Confirm Password</label>
            <input
              placeholder="Confirm password"
              class="inputField"
              type="password"
              name="confirmPassword"
              id=""
            />
             <c:if test="${not empty requestScope.errorMessage}">
            <p class="errorMsg">${requestScope.errorMessage}</p>
        </c:if>
            <button id="confirmBtn" class="btn">Submit</button>
          

          
        </form>
     
        </c:when>
        </c:choose>
        <p class="loginRedirectText">
            Already have an account?
            <a href="<%= request.getContextPath() %>/loginController" style="color: black">Login Now</a>
          </p>
      </div>
    </div>
    
    
    
    
    <script
      src="https://kit.fontawesome.com/b4de01d1c5.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
