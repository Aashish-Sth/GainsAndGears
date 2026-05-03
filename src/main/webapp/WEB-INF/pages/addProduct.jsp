<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gains & Gears</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/addProduct.css">
</head>
<body>
<jsp:include page="adminSideBar.jsp" />
<a href="<%=request.getContextPath()%>/admin/products" class="back"><i class="fa-solid fa-chevron-left"></i></a>
    <div class="page-content">

        <div class="container">
        
            <form action="<%=request.getContextPath()%>/admin/products/add" method="post" enctype="multipart/form-data">
                <!--Main heading-->
                <div class="header">
                    <h1 class="title">Product Details</h1>
                    <button type="submit">Done</button>
                </div>
                
                 <div class="info">
                    <p>Product Information</p>
                </div>
                
                <!-- Error Message -->
                <c:if test="${not empty error}">
                    <div class="error">
                    	<i class="fa-solid fa-circle-exclamation"></i>${error}
                    </div>
                </c:if>
                
               


                <div class="top">
                    <!--Category-->
                    <div class="product">
                        <label for="product_category">Category</label>
                        <select id="product_category" name="product_category">
                            <option value="mens" ${category == 'mens' ? 'selected' : ''} selected>Mens Clothing</option>
                            <option value="womens" ${category == 'womens' ? 'selected' : ''}>Womens Clothing</option>
                            <option value="supplement" ${category == 'supplement' ? 'selected' : ''}>Supplement</option>
                        </select>
                    </div>
                    <!--Cloth Brand-->
                    <div class="product" id="cloth_brand">
                        <label for="product_cloth_brand">Brand</label>
                        <select id="product_cloth_brand" name="product_cloth_brand">
                            <option value="" disabled="disabled" hidden="hidden" ${empty product_brand ? 'selected' : ''} >Select Brand</option>
                            <option value="youngLA" ${product_brand == 'youngLA' ? 'selected' : ''}>YoungLA</option>
                            <option value="gymshark" ${product_brand == 'gymshark' ? 'selected' : ''}>Gymshark</option>
                            <option value="furaak" ${product_brand == 'furaak' ? 'selected' : ''}>Furaak</option>
                        </select>
                    </div>
                    <!--Supplement Brand-->
                    <div class="product" id="supplement_brand">
                        <label for="product_supplement_brand">Brand</label>
                        <select id="product_supplement_brand" name="product_supplement_brand">
                            <option value="" disabled="disabled" hidden="hidden" ${empty product_brand ? 'selected' : ''}>Select Brand</option>
                            <option value="ghost" ${product_brand == 'ghost' ? 'selected' : ''}>Ghost</option>
                            <option value="feral" ${product_brand == 'feral' ? 'selected' : ''}>Feral</option>
                            <option value="muscleblaze" ${product_brand == 'muscleblaze' ? 'selected' : ''}>MuscleBlaze</option>
                        </select>
                    </div>
                </div>

                <!--Name-->
                <div class="product">
                    <label for="product_name">Product Name</label>
                    <input type="text" id="product_name" name="product_name" placeholder="Product Name"
                    value="${product_name}">
                </div>

                <!--Price-->
                <div class="product"> 
                    <label for="product_price">Price</label>
                    <input type="text" id="product_price" name="product_price" placeholder="Rs Price"
                    value="${product_price_str}">
                </div>

                <!--Sizes-->
                <div class="product" id="sizes">
                    <label for="product_sizes">Sizes</label>
                    <div class="options">
                        <input type="checkbox" id="xs" name="size" value="XS" ${attr1.contains('XS') ? 'checked' : ''}>
                        <label for="xs">XSmall</label>

                        <input type="checkbox" id="s" name="size" value="S" ${attr1.contains('S') ? 'checked' : ''}>
                        <label for="s">Small</label>

                        <input type="checkbox" id="m" name="size" value="M" ${attr1.contains('M') ? 'checked' : ''}>
                        <label for="m">Medium</label>

                        <input type="checkbox" id="l" name="size" value="L" ${attr1.contains('L') ? 'checked' : ''}>
                        <label for="l">Large</label>

                        <input type="checkbox" id="xl" name="size" value="XL" ${attr1.contains('XL') ? 'checked' : ''}>
                        <label for="xl">XLarge</label>
                    </div>
                </div>

                <!--colors-->
                <div class="product" id="colors">
                    <label for="product_color">Colors</label>
                    <div class="options">
                        <input type="checkbox" id="red" name="color" value="Red" ${attr2.contains('Red') ? 'checked' : ''}>
                        <label for="red">Red</label>

                        <input type="checkbox" id="blue" name="color" value="Blue" ${attr2.contains('Blue') ? 'checked' : ''}>
                        <label for="blue">Blue</label>

                        <input type="checkbox" id="green" name="color" value="Green" ${attr2.contains('Green') ? 'checked' : ''}>
                        <label for="green">Green</label>

                        <input type="checkbox" id="black" name="color" value="Black" ${attr2.contains('Black') ? 'checked' : ''}>
                        <label for="black">Black</label>

                        <input type="checkbox" id="white" name="color" value="White" ${attr2.contains('White') ? 'checked' : ''}>
                        <label for="white">White</label>
                    </div>
                </div>

                <!--Flavors-->
                <div class="product hidden" id="flavors">
                    <label for="product_flavors">Flavors</label>
                    <div class="options">
                        <input type="checkbox" id="chocolate" name="flavor" value="Chocolate" ${attr1.contains('Chocolate')  ? 'checked' : ''}>
                        <label for="chocolate">Chocolate</label>

                        <input type="checkbox" id="vanilla" name="flavor" value="Vanilla" ${attr1.contains('Vanilla')    ? 'checked' : ''}>
                        <label for="vanilla">Vanilla</label>

                        <input type="checkbox" id="strawberry" name="flavor" value="Strawberry" ${attr1.contains('Strawberry') ? 'checked' : ''}>
                        <label for="strawberry">Strawberry</label>

                        <input type="checkbox" id="blueberry" name="flavor" value="Blueberry" ${attr1.contains('Blueberry')  ? 'checked' : ''}>
                        <label for="blueberry">Blueberry</label>
                    </div>
                </div>

                <!--Quantity-->
                <div class="product hidden" id="quantity">
                    <label for="product_quantity">Quantity</label>
                    <div class="options">
                        <input type="checkbox" id="250" name="quantity" value="250g" ${attr2.contains('250g')  ? 'checked' : ''}>
                        <label for="250">250g</label>

                        <input type="checkbox" id="500" name="quantity" value="500g" ${attr2.contains('500g')  ? 'checked' : ''}>
                        <label for="500">500g</label>

                        <input type="checkbox" id="1000" name="quantity" value="1000g" ${attr2.contains('1000g') ? 'checked' : ''}>
                        <label for="1000">1000g</label>

                        <input type="checkbox" id="2500" name="quantity" value="2500g" ${attr2.contains('2500g') ? 'checked' : ''}>
                        <label for="2500">2500g</label>
                    </div>
                </div>

                <div class="product">
                    <label for="product_image">Image</label>
                    <input type="file" id="product_image" name="product_image" hidden>
                    <label for="product_image" class="upload-btn">Upload Product Photo</label>
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
    </script>
</body>
</html>