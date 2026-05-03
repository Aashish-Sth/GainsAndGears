<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gains & Gears</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/updateProduct.css">
</head>
<body>
<jsp:include page="adminSideBar.jsp" />
<a href="<%=request.getContextPath()%>/admin/products" class="back"><i class="fa-solid fa-chevron-left"></i></a>
    <div class="page-content">

        <div class="container">
        
            <form action="<%=request.getContextPath()%>/admin/products/update" method="post" enctype="multipart/form-data">
            
            	<input type="hidden" name="product_id" value="${product.product_id}"/>
            	
                <!--Main heading-->
                <div class="header">
                    <h1 class="title">Product Details</h1>
                    
                    <!-- keeping form non editable at default -->
                    <c:choose>
	                    <c:when test="${param.mode == 'edit'}">
	                    <div class="buttonGroup">
	                        <button type="submit" class="update">
	                            <i class="fa-solid fa-save"></i> Save
	                        </button>
	                        <a href="?id=${product.product_id}" class="cancel">
	                            <i class="fa-solid fa-xmark"></i> Cancel
	                        </a>	
	                    </div>
	                    </c:when>
	                    <c:otherwise>
	                        <a href="?id=${product.product_id}&mode=edit" class="update">
	                            <i class="fa-solid fa-pen"></i> Update
	                        </a>
	                    </c:otherwise>
	                </c:choose>
                </div>
                
                 <div class="info">
                    <p>Product Information</p>
                </div>
                
                <!-- Error Message -->
                <c:if test="${not empty requestScope.errorMessage}">
                    <div class="error">
                    	<i class="fa-solid fa-circle-exclamation"></i> ${requestScope.errorMessage}
                    </div>
                </c:if>
                

                <div class="top">
                    <!--Category-->
                    <div class="product">
                        <label>Category</label>
                        <select id="product_category" name="product_category" ${param.mode == 'edit' ? '' : 'disabled'}>
                            <option value="mens" ${product.category == 'mens' ? 'selected' : ''}>Mens Clothing</option>
                            <option value="womens" ${product.category == 'womens' ? 'selected' : ''}>Womens Clothing</option>
                            <option value="supplement" ${product.category == 'supplement' ? 'selected' : ''}>Supplement</option>
                        </select>
                    </div>
                    
                    <!--Cloth Brand-->
                    <div class="product" id="cloth_brand">
                        <label>Brand</label>
                        <select id="product_cloth_brand" name="product_cloth_brand" ${param.mode == 'edit' ? '' : 'disabled'}>
                            <option value="" disabled="disabled" hidden="hidden">Select Brand</option>
                            <option value="youngLA" ${product.product_brand == 'youngLA' ? 'selected' : ''}>YoungLA</option>
                            <option value="gymshark" ${product.product_brand == 'gymshark' ? 'selected' : ''}>Gymshark</option>
                            <option value="furaak" ${product.product_brand == 'furaak' ? 'selected' : ''}>Furaak</option>
                        </select>
                    </div>
                    <!--Supplement Brand-->
                    <div class="product" id="supplement_brand">
                        <label>Brand</label>
                        <select id="product_supplement_brand" name="product_supplement_brand" ${param.mode == 'edit' ? '' : 'disabled'}>
                            <option value="" disabled="disabled" hidden="hidden">Select Brand</option>
                            <option value="ghost" ${product.product_brand == 'ghost' ? 'selected' : ''}>Ghost</option>
                            <option value="feral" ${product.product_brand == 'feral' ? 'selected' : ''}>Feral</option>
                            <option value="muscleblaze" ${product.product_brand == 'muscleblaze' ? 'selected' : ''}>MuscleBlaze</option>
                        </select>
                    </div>
                </div>

                <!--Name-->
                <div class="product">
                    <label>Product Name</label>
                    <input type="text" id="product_name" name="product_name" placeholder="Product Name"
                    value="${product.product_name}" ${param.mode == 'edit' ? '' : 'disabled'}/>
                </div>

                <!--Price-->
                <div class="product"> 
                    <label>Price</label>
                    <input type="text" id="product_price" name="product_price" placeholder="Rs Price"
                    value="${product.product_price}" ${param.mode == 'edit' ? '' : 'disabled'}/>
                </div>

                <!--Sizes-->
                <div class="product" id="sizes">
                    <label>Sizes</label>
                    <div class="options">
                    	<input type="checkbox" id="size_XS" name="size" value="XS" ${attr1.contains('XS') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="size_XS">XS</label>
				
				        <input type="checkbox" id="size_S" name="size" value="S" ${attr1.contains('S') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="size_S">S</label>
				
				        <input type="checkbox" id="size_M" name="size" value="M" ${attr1.contains('M') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="size_M">M</label>
				
				        <input type="checkbox" id="size_L" name="size" value="L" ${attr1.contains('L') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="size_L">L</label>
				
				        <input type="checkbox" id="size_XL" name="size" value="XL" ${attr1.contains('XL') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="size_XL">XL</label>
				    </div>
                </div>
                

                <!--colors-->
                <div class="product" id="colors">
                    <label>Colors</label>
                    <div class="options">
                        <input type="checkbox" id="color_Red" name="color" value="Red" ${attr2.contains('Red') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="color_Red">Red</label>
				
				        <input type="checkbox" id="color_Blue" name="color" value="Blue" ${attr2.contains('Blue') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="color_Blue">Blue</label>
				
				        <input type="checkbox" id="color_Green" name="color" value="Green" ${attr2.contains('Green') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="color_Green">Green</label>
				
				        <input type="checkbox" id="color_Black" name="color" value="Black" ${attr2.contains('Black') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="color_Black">Black</label>
				
				        <input type="checkbox" id="color_White" name="color" value="White" ${attr2.contains('White') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="color_White">White</label>
                    </div>
                </div>

                <!--Flavors-->
                <div class="product hidden" id="flavors">
                    <label>Flavors</label>
                    <div class="options">
                        <input type="checkbox" id="flavor_Chocolate" name="flavor" value="Chocolate" ${attr1.contains('Chocolate') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="flavor_Chocolate">Chocolate</label>
				
				        <input type="checkbox" id="flavor_Vanilla" name="flavor" value="Vanilla" ${attr1.contains('Vanilla') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="flavor_Vanilla">Vanilla</label>
				
				        <input type="checkbox" id="flavor_Strawberry" name="flavor" value="Strawberry" ${attr1.contains('Strawberry') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="flavor_Strawberry">Strawberry</label>
				
				        <input type="checkbox" id="flavor_Blueberry" name="flavor" value="Blueberry" ${attr1.contains('Blueberry') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
				        <label for="flavor_Blueberry">Blueberry</label>
                    </div>
                </div>

                <!--Quantity-->
                <div class="product hidden" id="quantity">
                    <label>Quantity</label>
                    <div class="options">
                        <div class="options">
				            <input type="checkbox" id="qty_250" name="quantity" value="250g" ${attr2.contains('250g') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
					        <label for="qty_250">250g</label>
					
					        <input type="checkbox" id="qty_500" name="quantity" value="500g" ${attr2.contains('500g') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
					        <label for="qty_500">500g</label>
					
					        <input type="checkbox" id="qty_1000" name="quantity" value="1000g" ${attr2.contains('1000g') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
					        <label for="qty_1000">1000g</label>
					
					        <input type="checkbox" id="qty_2500" name="quantity" value="2500g" ${attr2.contains('2500g') ? 'checked' : ''} ${param.mode == 'edit' ? '' : 'disabled'}/>
					        <label for="qty_2500">2500g</label>
                    	</div>
                	</div>
               	</div>
                

                <div class="product">
                    <label>Photo</label>
                    <img src="<%=request.getContextPath()%>/admin/products/image?id=${product.product_id}" 
                         class="photo-preview">
                    <!-- Upload only available in edit mode -->
                    <c:if test="${param.mode == 'edit'}">
                        <input type="file" id="product_image" name="product_image" hidden>
                        <label for="product_image" class="upload-btn">Upload Product Photo</label>
                    </c:if>
                </div>

            </form>
        </div>

    </div>

    <script src="https://kit.fontawesome.com/7c15c07e01.js" crossorigin="anonymous"></script>
    <script>
	    const categorySelect = document.getElementById('product_category');
	    const sizes = document.getElementById('sizes');
	    const colors = document.getElementById('colors');
	    const flavors = document.getElementById('flavors');
	    const quantity = document.getElementById('quantity');
	    const cloth = document.getElementById('cloth_brand')
	    const supplement = document.getElementById('supplement_brand')
	
	    function update() {
	        const selectedCategory = categorySelect.value;
	
	        if (selectedCategory === 'supplement') {
	            sizes.classList.add('hidden');
	            colors.classList.add('hidden');
	            cloth.classList.add('hidden');
	            supplement.classList.remove('hidden');
	            flavors.classList.remove('hidden');
	            quantity.classList.remove('hidden');
	        } else {
	            sizes.classList.remove('hidden');
	            colors.classList.remove('hidden');
	            cloth.classList.remove('hidden');
	            supplement.classList.add('hidden');
	            flavors.classList.add('hidden');
	            quantity.classList.add('hidden');
	        }
	    }
	
	    categorySelect.addEventListener('change', update);
	
	
	    update();
	
	    // Live photo preview
	    const fileInput = document.getElementById('product_image');
	    if (fileInput) {
	        fileInput.addEventListener('change', function () {
	            const file = this.files[0];
	            if (file) {
	                const reader = new FileReader();
	                reader.onload = e => document.getElementById('photoPreview').src = e.target.result;
	                reader.readAsDataURL(file);
	            }
	        });
	    }
	</script>
</body>
</html>