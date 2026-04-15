<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gains & Gears</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/viewAllUsers.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
</head>

<body>
<jsp:include page="adminSideBar.jsp" />
    <div class="page-content">
        <div class="top-bar">
            <p>Admin</p>
            <i class="fa-regular fa-user"></i>
        </div>

        <h1 class="page-title">Users</h1>

        <div class="main-card">
            <div class="card">
                <span class="label">All Users</span>
                <span class="number">5</span>
            </div>
            <div class="card">
                <span class="label">Active Users <span class="dot green"></span></span>
                <span class="number">3</span>
            </div>
            <div class="card">
                <span class="label">Inactive Users <span class="dot red"></span></span>
                <span class="number">2</span>
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
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><img src="../assets/user1.jpg" class="user-photo"></td>
                        <td>Aarshnav KC</td>
                        <td>9869750231</td>
                        <td>aarshnav@gmail.com</td>
                        <td><span class="badge active-badge">Active</span></td>
                    </tr>
                    <tr>
                        <td><img src="../assets/user2.jpg" class="user-photo"></td>
                        <td>Dilip Shrestha</td>
                        <td>9876754546</td>
                        <td>dilipstha@gmail.com</td>
                        <td><span class="badge inactive-badge">Inactive</span></td>
                    </tr>
                    <tr>
                        <td><img src="../assets/user3.jpg" class="user-photo"></td>
                        <td>Asheesh Shrestha</td>
                        <td>9869750231</td>
                        <td>ashishstha@gmail.com</td>
                        <td><span class="badge active-badge">Active</span></td>
                    </tr>
                    <tr>
                        <td><img src="../assets/user4.jpg" class="user-photo"></td>
                        <td>Upakar Shrestha</td>
                        <td>9869750231</td>
                        <td>upakarsth@gmail.com</td>
                        <td><span class="badge active-badge">Active</span></td>
                    </tr>
                    <tr>
                        <td><img src="../assets/user5.jpg" class="user-photo"></td>
                        <td>Krish Shrestha</td>
                        <td>9869750231</td>
                        <td>sthakriz098@gmail.com</td>
                        <td><span class="badge inactive-badge">Inactive</span></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>


    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>

</html>