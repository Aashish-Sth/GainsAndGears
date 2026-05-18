<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/four0four.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
</head>
<body>

    <div class="pageWrapper">
        <div class="card">

            <!-- Left -->
            <div class="cardLeft">
                <p class="notFoundText">404 Not Found</p>
                <h1 class="heading">Oops! We couldn't<br>find that page.</h1>
                <p class="explain">
                    We can't find the page that you're looking for.<br>
                    Probably the link is invalid.
                </p>
                <a href="<%=request.getContextPath()%>/home" class="btn nav-item">
                    <span class="btnText">BACK TO HOME</span>
                    <span class="btnCircle"><i class="fa-solid fa-arrow-right"></i></span>
                </a>
            </div>

            <!-- Right -->
            <div class="cardRight">
                <span class="errorCode">404</span>
            </div>

        </div>
    </div>

</body>
</html>
