<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Base64" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gains and Gears</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Protest+Revolution&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
    
</head>

<body>
<c:if test="${param.msg == 'success'}">
	    <div class="sucessMsg" id="sucessMsg">Welcome back, ${sessionScope.loggedInUser.user_first_name}!</div>
	</c:if>
	<c:if test="${param.msg == 'orderplaced'}">
    <div class="sucessMsg" id="sucessMsg">Your order was successfully placed!</div>
</c:if>
	<jsp:include page="navbar.jsp" />
    <!-- Main Section -->
    <div class="main-container">
        <img src="<%=request.getContextPath()%>/assets/homebg.png" alt="Homepage">
        <div class="shop-now">Shop Now</div>
    </div>
<ul class="pages">
    <li><a href="javascript:void(0)" id="men-link" class="active" onclick="showCategory('men')">FOR HIM</a></li>
    <li><a href="javascript:void(0)" id="women-link" onclick="showCategory('women')">FOR HER</a></li>
</ul>



<div id="men-section" class="card">
        <c:forEach var="p" items="${mensProducts}">
        <a href="<%=request.getContextPath()%>/product/detail?id=${p.product_id}">
        <div class="card-item">
                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(p.product_image)}" alt="${p.product_name}">
                <p>${p.product_name}</p>
                <div class="info"><span class="price">Rs ${p.product_price}</span></div>
            </div>
        </a>
            
        </c:forEach>
    </div>


<div id="women-section" class="card" style="display: none;">
        <c:forEach var="p" items="${womensProducts}">
        <a href="<%=request.getContextPath()%>/product/detail?id=${p.product_id}">
        <div class="card-item">
                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(p.product_image)}" alt="${p.product_name}">
                <p>${p.product_name}</p>
                <div class="info"><span class="price">Rs ${p.product_price}</span></div>
            </div>
        </a>
            
        </c:forEach>
    </div>


    <div class="all-btn">ALL FOR HIM</div>


    <!-- Supplments Section -->
    <div class="main-container-2">
        <img src="<%=request.getContextPath()%>/assets/homebg2.jpg" alt="Homepage">
        <div class="text">
            <p>Unlock Your <br> Body's Potential.</p>
            <div class="shop-now-2">Shop Now</div>
        </div>
    </div>

    <div class="content-1">
        <h2>Recover Faster, Go Harder</h2>
    </div>
    
  <div class="card">
        <c:forEach var="p" items="${supplementProducts}">
        <a href="<%=request.getContextPath()%>/product/detail?id=${p.product_id}">
        <div class="card-item">
                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(p.product_image)}" alt="${p.product_name}">
                <p>${p.product_name}</p>
                <div class="info"><span class="price">Rs ${p.product_price}</span></div>
            </div>
        </a>
            
        </c:forEach>
    </div>




    <div class="all-btn">VIEW SUPPLEMENTS</div>


    <!-- Limited Stock Section -->
    <div class="main-container-2">
        <img src="<%=request.getContextPath()%>/assets/homebg3.svg" alt="Homepage">
        <div class="text">
            <p>WAIT THERE’S <br>MORE…</p>
            <div class="shop-now-3">Shop Now</div>
        </div>
    </div>

    <div class="content-2">
        <h2>New Arrivals</h2>
    </div>

   <div class="card">
    <c:forEach var="p" items="${newCollections}">
       <a href="<%=request.getContextPath()%>/product/detail?id=${p.product_id}">
        <div class="card-item">
            <c:choose>
                <c:when test="${not empty p.product_image}">
                    <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(p.product_image)}" alt="${p.product_name}">
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/assets/default-product.jpg" alt="No Image">
                </c:otherwise>
            </c:choose>
            <p>${p.product_name}</p>
            <div class="info">
                <span class="price">Rs ${p.product_price}</span>
                <span class="rating"><i class="fa-solid fa-star"></i> 4.5</span>
            </div>
        </div>
               </a>
    </c:forEach>
</div>

    <div class="all-btn">SHOP NOW</div>



    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
    <jsp:include page="footer.jsp" />
    <script >
    const sucessMsg = document.getElementById('sucessMsg');
    if (sucessMsg) {
        // Clean URL so refresh won't show it again
        const url = new URL(window.location);
        url.searchParams.delete('msg');
        window.history.replaceState({}, '', url);

        setTimeout(() => {
            sucessMsg.classList.add('hide');
            setTimeout(() => sucessMsg.remove(), 600);
        }, 2000);
    }
    
    </script>
    
    <script>
function showCategory(category) {
    const menSection = document.getElementById('men-section');
    const womenSection = document.getElementById('women-section');
    const menLink = document.getElementById('men-link');
    const womenLink = document.getElementById('women-link');

    if (category === 'men') {
    
        menSection.style.display = 'grid'; 
        womenSection.style.display = 'none';
        
     
        menLink.classList.add('active');
        womenLink.classList.remove('active');
    } else {

        menSection.style.display = 'none';
        womenSection.style.display = 'grid';
        
 
        womenLink.classList.add('active');
        menLink.classList.remove('active');
    }
}
</script>
</body>


</html>