<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gains & Gears</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminProduct.css">
</head>
<body>
<jsp:include page="adminSideBar.jsp" />
    <div class="page-content">

            <h1 class="title">Products</h1>

            <div class="main-card">
                <div class="card">
                    <span class="label">All Products</span>
                    <span class="number">5</span>
                </div>
                <div class="card">
                    <span class="label">Available Products<span class="green"></span></span>
                    <span class="number">3</span>
                </div>
                <div class="card">
                    <span class="label">Unavailable Products<span class="red"></span></span>
                    <span class="number">2</span>
                </div>
            </div>

            <div class="container">
                <div class="table-top">
                    <div class="choice">
                        <button class="btn">All</button>
                        <button class="btn">Male</button>
                        <button class="btn">Female</button>
                        <button class="btn">Suppliments</button>
                    </div>
                    <div class="search-box">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        <input type="text" placeholder="Search user">
                    </div>
                </div>

                <table class="user-table">
                    <thead>
                        <tr>
                            <th>ProductID</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#123</td>
                            <td>W5215 - Kove Zip..</td>
                            <td>Rs 1000</td>
                            <td><a href="#" class="available"><span class="green"></span> Available <i class="fa-solid fa-caret-down"></i></a></td>
                            <td><a href="updateProduct.html" class="detail"> <i class="fa-solid fa-angle-right"></i> </a></td>
                        </tr>
                        <tr>
                            <td>#123</td>
                            <td>W5215 - Kove Zip..</td>
                            <td>Rs 1000</td>
                            <td><a href="#" class="unavailable"><span class="red"></span> Unavailable <i class="fa-solid fa-caret-down"></i></a></td>
                            <td><a href="updateProduct.html" class="detail"> <i class="fa-solid fa-angle-right"></i> </a></td>
                        </tr>
                        <tr>
                            <td>#123</td>
                            <td>W5215 - Kove Zip..</td>
                            <td>Rs 1000</td>
                            <td><a href="#" class="available"><span class="green"></span> Available <i class="fa-solid fa-caret-down"></i></a></td>
                            <td><a href="updateProduct.html" class="detail"> <i class="fa-solid fa-angle-right"></i> </a></td>
                        </tr>
                        <tr>
                            <td>#123</td>
                            <td>W5215 - Kove Zip..</td>
                            <td>Rs 1000</td>
                            <td><a href="#" class="available"><span class="green"></span> Available <i class="fa-solid fa-caret-down"></i></a></td>
                            <td><a href="updateProduct.html" class="detail"> <i class="fa-solid fa-angle-right"></i> </a></td>
                        </tr>
                        <tr>
                            <td>#123</td>
                            <td>W5215 - Kove Zip..</td>
                            <td>Rs 1000</td>
                            <td><a href="#" class="available"><span class="green"></span> Available <i class="fa-solid fa-caret-down"></i></a></td>
                            <td><a href="updateProduct.html" class="detail"> <i class="fa-solid fa-angle-right"></i> </a></td>
                        </tr>
                    </tbody>
                </table>
                
            </div>
            <a class="add-btn" href="<%=request.getContextPath()%>/admin/products/add">
                <i class="fa-solid fa-plus"></i>
            </a>

        </div>


        <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>

    </body>
</html>