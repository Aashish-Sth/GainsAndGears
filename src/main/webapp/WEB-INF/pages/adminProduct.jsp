<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
			 
			 <!-- Success Message -->
			<c:if test="${param.success == 'true'}">
	            <div class="success" id="status">
	                <i class="fa-solid fa-check-circle"></i> Successfully changed the product's status!
	            </div>
	        </c:if>
			
			<c:if test="${param.success == 'updated'}">
			    <div class="success" id="update">
			        <i class="fa-solid fa-circle-check"></i> Product updated successfully!
			    </div>
			</c:if>
			
			<c:if test="${param.success == 'added'}">
			    <div class="success" id="add">
			        <i class="fa-solid fa-circle-check"></i> Product added successfully!
			    </div>
			</c:if>
			
            <div class="main-card">
                <div class="card">
                    <span class="label">All Products</span>
                    <span class="number">${totalProducts}</span>
                </div>
                <div class="card">
                    <span class="label">Available Products<span class="green"></span></span>
                    <span class="number">${availableProducts}</span>
                </div>
                <div class="card">
                    <span class="label">Unavailable Products<span class="red"></span></span>
                    <span class="number">${unavailableProducts}</span>
                </div>
            </div>

            <div class="container">
                <div class="table-top">
                	<form action="<%=request.getContextPath()%>/admin/products" method="POST" class="search-box">
	                    <i class="fa-solid fa-magnifying-glass"></i>
	                    <input type="text" name="search" placeholder="Search product..." value="${searchedName}">
	                    <button type="submit" style="display:none"></button>
	                </form>
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
                    
                    	<c:forEach var="product" items="${productList}">
                    		<tr>
	                            <td>${product.product_id}</td>
	                            <td>${product.product_name}</td>
	                            <td>Rs ${product.product_price}</td>
                        		<td>
                        			<form id="statusForm-${product.product_id}" action="<%=request.getContextPath()%>/admin/products" method="POST">
				                        <input type="hidden" name="product_id" value="${product.product_id}">
				                        <input type="hidden" name="status" value="${product.has_been_deleted == false ? true : false}">
				                        <span class="status ${product.has_been_deleted == false ? 'available' : 'unavailable'}"
				                              style="cursor: pointer;"
				                              onclick="Submit(${product.product_id}, ${product.has_been_deleted})">
				                            ${product.has_been_deleted == false ? 'Available' : 'Unavailable'}
				                            <i class="fa-solid fa-caret-down"></i>
				                        </span>
				                    </form>
                                </td>
                            	<td><a href="<%=request.getContextPath()%>/admin/products/update?id=${product.product_id}" class="detail"> <i class="fa-solid fa-angle-right"></i> </a></td>
                        	</tr>
                        </c:forEach>
                        
                        <c:if test="${empty productList}">
                        <tr>
                            <td colspan="5" style="text-align: center; padding: 20px;">No products found in database.</td>
                        </tr>
                    </c:if>
                	</tbody>
            	</table>
        	</div>
                        	

            <a class="add-btn" href="<%=request.getContextPath()%>/admin/products/add">
                <i class="fa-solid fa-plus"></i>
            </a>

        </div>


        <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
        <script>
        
		    function Submit(product_id, status) {
		        const nextText = (status === false) ? 'Unavailable' : 'Available';
		        
		        if (confirm("Are you sure you want to make this product " + nextText + "?")) {
		            document.getElementById('statusForm-' + product_id).submit();
		        }
	    	}
		    
		    const sucessMsg = document.getElementById('status');
		    if (sucessMsg) {
		        setTimeout(() => {
		        	sucessMsg.classList.add('hide');
		            setTimeout(() => sucessMsg.remove(), 600); // remove after fade
		        }, 2000); // shows for 3 seconds
		    }
		    
		    const updateMsg = document.getElementById('update');
		    if (updateMsg) {
		        setTimeout(() => {
		            updateMsg.classList.add('hide');
		            setTimeout(() => updateMsg.remove(), 600); // remove after fade
		        }, 2000); // shows for 3 seconds
		    }
		    
		    const addMsg = document.getElementById('add');
		    if (addMsg) {
		        setTimeout(() => {
		        	addMsg.classList.add('hide');
		            setTimeout(() => addMsg.remove(), 600); // remove after fade
		        }, 2000); // shows for 3 seconds
		    }
	    </script>

    </body>
</html>