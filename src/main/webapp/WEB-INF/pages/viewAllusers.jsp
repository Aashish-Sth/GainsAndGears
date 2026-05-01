<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gains & Gears</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/viewAllUsers.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
</head>

<body>
<jsp:include page="adminSideBar.jsp" />
    <div class="page-content">
        <div class="top-bar">
            <p>Admin</p>
            <i class="fa-regular fa-user"></i>
        </div>

        <h1 class="page-title">Users</h1>

        <%-- STATS CARDS --%>
       <%-- STATS CARDS --%>
<div class="main-card">
    <div class="card">
        <span class="label">All Users</span>
        <%-- Displays the total number of users in the database --%>
        <span class="number">${totalCount}</span>
    </div>
    <div class="card">
        <span class="label">Active Users <span class="dot green"></span></span>
        <%-- Displays the count of users where status is 1 --%>
        <span class="number">${activeCount}</span>
    </div>
    <div class="card">
        <span class="label">Inactive Users <span class="dot red"></span></span>
        <%-- Displays the count of users where status is 0 --%>
        <span class="number">${inactiveCount}</span>
    </div>
</div>

        <div class="table-container">
            <div class="table-top">
              
              <form action="users" method="POST" class="search-box">
        <i class="fa-solid fa-magnifying-glass"></i>
        <%-- The name "search" is how the Servlet will find the data --%>
        <input type="text" name="search" placeholder="Search by name..." value="${searchedName}">
        <button type="submit" style="display:none"></button>
    </form>
            </div>

            <table class="user-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>User Name</th>
                        <th>Mobile</th>
                        <th>Email</th>
                        <th>Status</th> <!-- Changed header to Role since that's in your model -->
                    </tr>
                </thead>
                <tbody>
                    <%-- 2. DYNAMIC LOOP START --%>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td>${user.user_id}</td>
                            <td>${user.user_first_name} ${user.user_last_name}</td>
                            <td>${user.user_phone_number}</td>
                            <td>${user.user_email}</td>
                         <td>
    <span class="badge ${user.user_status == 1 ? 'active-badge' : 'inactive-badge'}">
        ${user.user_status == 1 ? 'Active' : 'Inactive'}
        <i class="fa-solid fa-caret-down"></i>
    </span>
</td>
                        </tr>
                    </c:forEach>
                    
                    <%-- 3. MESSAGE IF DATABASE IS EMPTY --%>
                    <c:if test="${empty userList}">
                        <tr>
                            <td colspan="5" style="text-align: center; padding: 20px;">No users found in database.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
</body>
</html>