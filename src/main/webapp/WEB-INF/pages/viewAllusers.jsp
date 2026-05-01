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
        <div class="main-card">
            <div class="card">
                <span class="label">All Users</span>
                <%-- We can get the size of the list directly --%>
                <span class="number">${userList.size()}</span>
            </div>
            <div class="card">
                <span class="label">Active Users <span class="dot green"></span></span>
                <span class="number">3</span> <!-- We will make this dynamic later -->
            </div>
            <div class="card">
                <span class="label">Inactive Users <span class="dot red"></span></span>
                <span class="number">2</span> <!-- We will make this dynamic later -->
            </div>
        </div>

        <div class="table-container">
            <div class="table-top">
                <div class="choice">
                    <button class="btn">All Users</button>
                    <button class="btn">Active Users</button>
                    <button class="btn">Inactive Users</button>
                </div>
                <div class="search-box">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" placeholder="Search user">
                </div>
            </div>

            <table class="user-table">
                <thead>
                    <tr>
                        <th>Photo</th>
                        <th>User Name</th>
                        <th>Mobile</th>
                        <th>Email</th>
                        <th>Role</th> <!-- Changed header to Role since that's in your model -->
                    </tr>
                </thead>
                <tbody>
                    <%-- 2. DYNAMIC LOOP START --%>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td>
                                <%-- Using a placeholder for the Blob image for now --%>
                                <img src="<%=request.getContextPath()%>/assets/default-user.png" class="user-photo">
                            </td>
                            <td>${user.user_first_name} ${user.user_last_name}</td>
                            <td>${user.user_phone_number}</td>
                            <td>${user.user_email}</td>
                            <td>
                                <%-- Dynamic badge based on role --%>
                                <span class="badge ${user.user_role == 'Admin' ? 'active-badge' : 'inactive-badge'}">
                                    ${user.user_role}
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