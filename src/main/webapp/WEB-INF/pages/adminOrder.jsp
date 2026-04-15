<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gains & Gears</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminOrder.css">
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

        <h1 class="page-title">Orders</h1>

        <div class="main-card">
            <div class="card">
                <span class="label">Total Orders</span>
                <span class="number">5</span>
            </div>
            <div class="card">
                <span class="label">Completed<span class="dot green"></span></span>
                <span class="number">3</span>
            </div>
            <div class="card">
                <span class="label">Shipped<span class="dot purple"></span></span>
                <span class="number">2</span>
            </div>
            <div class="card">
                <span class="label">Confirmed<span class="dot orange"></span></span>
                <span class="number">1</span>
            </div>
        </div>

        <div class="table-container">
            <div class="table-top">
                <div class="choice">
                    <button class="btn">All</button>
                    <button class="btn">Completed</button>
                    <button class="btn">Shipped</button>
                    <button class="btn">Confirmed</button>
                </div>
                <div class="search-box">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" placeholder="Search user">
                </div>
            </div>

            <table class="user-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Payment</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Details</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td>#1000</td>
                    <td>Aarshnav KC</td>
                    <td><span class="badge success-badge">Success</span></td>
                    <td>12/12/2024</td>
                    <td><span class="badge completed-badge">Completed</span></td>
                    <td><i class="fa-solid fa-chevron-right"></i></td>
                </tr>
                <tr>
                    <td>#1023</td>
                    <td>Dilip Shrestha</td>
                    <td><span class="badge cod-badge">COD</span></td>
                    <td>12/12/2024</td>
                    <td><span class="badge shipped-badge">Shipped</span></td>
                    <td><i class="fa-solid fa-chevron-right"></i></td>
                </tr>
                <tr>
                    <td>#1273</td>
                    <td>Asheesh Shrestha</td>
                    <td><span class="badge success-badge">Success</span></td>
                    <td>12/12/2024</td>
                    <td><span class="badge confirmed-badge">Confirmed</span></td>
                    <td><i class="fa-solid fa-chevron-right"></i></td>
                </tr>
                <tr>
                    <td>#1243</td>
                    <td>Upakar Shrestha</td>
                    <td><span class="badge success-badge">Success</span></td>
                    <td>12/12/2024</td>
                    <td><span class="badge shipped-badge">Shipped</span></td>
                    <td><i class="fa-solid fa-chevron-right"></i></td>
                </tr>
                <tr>
                    <td>#6546</td>
                    <td>Krish Shrestha</td>
                    <td><span class="badge success-badge">Success</span></td>
                    <td>12/12/2024</td>
                    <td><span class="badge completed-badge">Completed</span></td>
                    <td><i class="fa-solid fa-chevron-right"></i></td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>


    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>

</html>