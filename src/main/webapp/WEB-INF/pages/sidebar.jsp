<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sidebar.css">
</head>
<body>
<aside class="sidebar">
      <nav class="sidebar-nav">
        <a href="<%=request.getContextPath()%>/user" class="nav-item">
          <i class="fa-regular fa-user nav-icon"></i>
          <span>Profile Settings</span>
        </a>
        <a href="<%=request.getContextPath()%>/ChangePassword" class="nav-item">
          <i class="fa-solid fa-lock nav-icon"></i>
          <span>Password</span>
        </a>
        <a href="<%=request.getContextPath()%>/OrderHistory" class="nav-item">
          <i class="fa-solid fa-clock-rotate-left nav-icon"></i>
          <span>Order History</span>
        </a>
      </nav>
    </aside>
</body>
</html>