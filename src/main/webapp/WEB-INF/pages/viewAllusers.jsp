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


        <c:if test="${param.success == 'true'}">
            <div class="success-alert" style="color: green; background: #e6ffed; padding: 15px; border: 1px solid green; border-radius: 8px; margin-bottom: 20px; font-weight: 500;">
                <i class="fa-solid fa-check-circle"></i> Successfully changed the user's status!
            </div>
        </c:if>

        <div class="main-card">
            <div class="card">
                <span class="label">All Users</span>
                <span class="number">${totalCount}</span>
            </div>
            <div class="card">
                <span class="label">Active Users <span class="dot green"></span></span>
                <span class="number">${activeCount}</span>
            </div>
            <div class="card">
                <span class="label">Inactive Users <span class="dot red"></span></span>
                <span class="number">${inactiveCount}</span>
            </div>
        </div>

        <div class="table-container">
            <div class="table-top">
                <form action="users" method="POST" class="search-box">
                    <i class="fa-solid fa-magnifying-glass"></i>
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
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td>${user.user_id}</td>
                            <td>${user.user_first_name} ${user.user_last_name}</td>
                            <td>${user.user_phone_number}</td>
                            <td>${user.user_email}</td>
                            <td>
                             
                                <form id="statusForm-${user.user_id}" action="updateStatus" method="POST">
                                    <input type="hidden" name="userEmail" value="${user.user_email}">
                                    <input type="hidden" name="newStatus" value="${user.user_status == 1 ? 0 : 1}">

                                    <span class="badge ${user.user_status == 1 ? 'active-badge' : 'inactive-badge'}" 
                                          style="cursor: pointer;"
                                          onclick="confirmAndSubmit(${user.user_id}, ${user.user_status})">
                                        ${user.user_status == 1 ? 'Active' : 'Inactive'}
                                        <i class="fa-solid fa-caret-down"></i>
                                    </span>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    
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
    <script>
    function confirmAndSubmit(userId, currentStatus) {
        const nextText = (currentStatus === 1) ? "Inactive" : "Active";
        
        if (confirm("Are you sure you want to set this user to " + nextText + "?")) {
            // This triggers the standard HTML form submission
            document.getElementById('statusForm-' + userId).submit();
        }
    }
    </script>
</body>
</html>