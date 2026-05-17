<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"	
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
	    <a href="<%=request.getContextPath()%>/user" 
	       class="nav-item ${pageKey == 'profile' ? 'active' : ''}">
	      <i class="fa-regular fa-user nav-icon"></i>
	      <span>Profile Settings</span>
	    </a>
	    <a href="<%=request.getContextPath()%>/ChangePassword" 
	       class="nav-item ${pageKey == 'password' ? 'active' : ''}">
	      <i class="fa-solid fa-lock nav-icon"></i>
	      <span>Password</span>
	    </a>
	    <a href="<%=request.getContextPath()%>/OrderHistory" 
	       class="nav-item ${pageKey == 'orders' ? 'active' : ''}">
	      <i class="fa-solid fa-clock-rotate-left nav-icon"></i>
	      <span>Order History</span>
	    </a>
	  </nav>
	</aside>
</body>
</html>