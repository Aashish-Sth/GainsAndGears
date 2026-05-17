<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Change Password</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/changepassword.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>
<jsp:include page="navbar.jsp"/>
  <div class="page-wrapper">
	<!-- SIde bar -->
    <jsp:include page="sidebar.jsp" />
    <!-- Main content(Change Password) -->
     <div class="main-content">
    <div class="password-container">
      <h2 class="password-title">Change Password</h2>
      <hr class="title-divider" />
      
      <c:if test="${not empty error}">
        <p class="msg error-msg">${error}</p>
      </c:if>
      <c:if test="${not empty success}">
        <p class="msg success-msg">${success}</p>
      </c:if>

 	<form action="${pageContext.request.contextPath}/ChangePassword" method="post">
      <div class="password-form">

        <div class="field">
          <label>Current Password<span class="required">*</span></label>
          <div class="input-wrapper">
            <input type="password" id="currentPassword"  name="currentPassword" placeholder="••••••••••" />
            <i class="fa-regular fa-eye toggle-eye" onclick="togglePassword('currentPassword',this)"></i>
          </div>
        </div>

        <div class="field">
          <label>New Password<span class="required">*</span></label>
          <div class="input-wrapper">
            <input type="password" id="newPassword" name="newPassword" placeholder="••••••••••" />
            <i class="fa-regular fa-eye toggle-eye" onclick="togglePassword('newPassword',this)"></i>
          </div>
        </div>

        <div class="field">
          <label>Confirm New Password<span class="required">*</span></label>
          <div class="input-wrapper">
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="••••••••••" />
            <i class="fa-regular fa-eye toggle-eye" onclick="togglePassword('confirmPassword',this)"></i>
          </div>
        </div>

         <div class="form-actions">
          <button type="button" class="btn-discard" onclick="window.history.back()">Discard</button>
          <button type="submit" class="btn-apply">Update Password</button>
        </div>

      </div>
      </form>
    </div>
  </div>
<script>
  function togglePassword(id, icon) {
    const input = document.getElementById(id);
    if (input.type === 'password') {
      input.type = 'text';
      icon.classList.replace('fa-eye', 'fa-eye-slash');
    } else {
      input.type = 'password';
      icon.classList.replace('fa-eye-slash', 'fa-eye');
    }
  }
</script>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>