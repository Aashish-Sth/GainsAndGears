<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Base64" %>

<div class="cartOverlay" id="cartOverlay"></div>

<div class="cartPanel" id="cartPanel">
    <div class="cartNavBar">
        <p class="cartTitle" id="cartTitle">YOUR BAG</p>
        <div class="togglePill">
            <button class="toggleBtn active" id="bagBtn" onclick="switchTab('bag')">
                <i class="fa-solid fa-bag-shopping"></i>
            </button>
            <button class="toggleBtn" id="wishBtn" onclick="switchTab('wish')">
                <i class="fa-solid fa-heart"></i>
            </button>
        </div>
        <button class="closeBtn" onclick="closeCart()">&#10005;</button>
    </div>
    
    
	<!-- Bag Section -->
    <div class="tabSection" id="bagSection">
        <c:choose>
        
        	<c:when test="${empty sessionScope.loggedInUser}">
	            <div class="emptyMsg">
	                <i class="fa-regular fa-circle-user" style="font-size: 40px; margin-bottom: 12px; color: #ccc;"></i>
	                <p>Please log in to view your bag</p>
	                <a href="${pageContext.request.contextPath}/login" class="login">LOG IN</a>
	            </div>
	        </c:when>
        
            <c:when test="${empty cartItems}">
                <p class="emptyMsg">Your bag is empty.</p>
            </c:when>
            
            <c:otherwise>
                <c:forEach var="item" items="${cartItems}">
                    <div class="itemCard">
                        <c:choose>
                            <c:when test="${not empty item.product_image}">
                                <img class="itemImg"
                                     src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(item.product_image)}"
                                     alt="${item.product_name}">
                            </c:when>
                            <c:otherwise>
                                <img class="itemImg"
                                     src="<%=request.getContextPath()%>/assets/default-product.jpg"
                                     alt="${item.product_name}">
                            </c:otherwise>
                        </c:choose>

                        <div class="itemDetails">
                            <p class="itemName">${item.product_name}</p>
                            <p class="itemMeta">${item.attribute_1} / ${item.attribute_2}</p>

                            
                            <div class="qtyControl">
                            
                                <form method="post" action="${pageContext.request.contextPath}/cart">
                                    <input type="hidden" name="action"    value="decrease">
                                    <input type="hidden" name="variantId" value="${item.variant_Id}">
                                    <button class="qtyBtn" type="submit"> - </button>
                                </form>

                                <span class="qtyValue">${item.quantity}</span>
	
							
                                <form method="post" action="${pageContext.request.contextPath}/cart">
                                    <input type="hidden" name="action"    value="increase">
                                    <input type="hidden" name="variantId" value="${item.variant_Id}">
                                    <button class="qtyBtn" type="submit"> + </button>
                                </form>
                            </div>
                        </div>

                        <div class="itemRight">
                            <p class="itemPrice">Rs. ${item.total}</p>

                            <form method="post" action="${pageContext.request.contextPath}/cart">
                                <input type="hidden" name="action"    value="remove">
                                <input type="hidden" name="variantId" value="${item.variant_Id}">
                                <button class="removeBtn" type="submit">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        
		<c:if test="${not empty sessionScope.loggedInUser}">
        <div class="cartFooter">
            <div class="footerRow">
                <p class="footerLabel">Total</p>
                <p class="footerTotal">Rs. ${cartTotal}</p>
            </div>
            <div class="footerRow">
                <p class="footerLabel">Shipping</p>
                <p class="footerShipping">Cost will appear on check out</p>
            </div>
            <form action="${pageContext.request.contextPath}/Checkout" method="get">
            <button class="checkoutBtn">CHECKOUT</button>
            </form>
            
        </div>
        </c:if>
    </div>


	<!-- Wishlist Section -->
    <div class="tabSection" id="wishSection" style="display: none;">
        <c:choose>
        	<c:when test="${empty sessionScope.loggedInUser}">
	            <div class="emptyMsg">
	                <i class="fa-regular fa-heart" style="font-size: 40px; margin-bottom: 12px; color: #ccc;"></i>
	                <p>Please log in to view your wishlist</p>
	                <a href="${pageContext.request.contextPath}/login" class="login">LOG IN</a>
	            </div>
	        </c:when>
            <c:when test="${empty wishlistItems}">
                <p class="emptyMsg">Your wishlist is empty.</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="item" items="${wishlistItems}">
                    <div class="itemCard">
                        <c:choose>
                            <c:when test="${not empty item.product_image}">
                                <img class="itemImg"
                                     src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(item.product_image)}"
                                     alt="${item.product_name}">
                            </c:when>
                            <c:otherwise>
                                <img class="itemImg"
                                     src="<%=request.getContextPath()%>/assets/default-product.jpg"
                                     alt="${item.product_name}">
                            </c:otherwise>
                        </c:choose>
                        <div class="itemDetails">
                            <p class="itemName">${item.product_name}</p>
                            <p class="itemPrice">Rs. ${item.product_price}</p>
                            <a class="viewLink"
                               href="${pageContext.request.contextPath}/product/detail?id=${item.product_Id}">
                                View Product
                            </a>
                        </div>
                        <form method="post" action="${pageContext.request.contextPath}/cart">
                            <input type="hidden" name="action"    value="removeWishlist">
                            <input type="hidden" name="productId" value="${item.product_Id}">
                            <button class="removeBtn" type="submit">
                                <i class="fa-solid fa-circle-xmark"></i>
                            </button>
                        </form>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
function switchTab(tab) {
    var bagSection = document.getElementById("bagSection");
    var wishSection = document.getElementById("wishSection");
    var bagBtn = document.getElementById("bagBtn");
    var wishBtn = document.getElementById("wishBtn");
    var title = document.getElementById("cartTitle");

    if (tab === "bag") {
        bagSection.style.display = "flex";
        wishSection.style.display = "none";
        bagBtn.classList.add("active");
        wishBtn.classList.remove("active");
        title.textContent = "YOUR BAG";
    } else {
        wishSection.style.display = "flex";
        bagSection.style.display = "none";
        wishBtn.classList.add("active");
        bagBtn.classList.remove("active");
        title.textContent = "YOUR WISHLIST";
    }
}


function openCart() {
    document.getElementById('cartPanel').classList.add('open');
    document.getElementById('cartOverlay').classList.add('active');
}

function closeCart() {
    document.getElementById('cartPanel').classList.remove('open');
    document.getElementById('cartOverlay').classList.remove('active');
}

document.getElementById('cartOverlay').addEventListener('click', closeCart);
</script>