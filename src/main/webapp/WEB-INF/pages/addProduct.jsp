<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <form action="" method="post">
                <!--Main heading-->
                <div class="header">
                    <h1 class="title">Product Details</h1>
                    <button type="submit">Done</button>
                </div>
                <div class="info">
                    <p>Product Information</p>
                </div>


                <div class="top">
                    <!--Category-->
                    <div class="product">
                        <label for="product_category">Category</label>
                        <select id="product_category" name="product_category">
                            <option value="mens" selected>Mens Clothing</option>
                            <option value="womens">Womens Clothing</option>
                            <option value="supplement">Supplement</option>
                        </select>
                    </div>
                    <!--Cloth Brand-->
                    <div class="product" id="cloth_brand">
                        <label for="product_cloth_brand">Brand</label>
                        <select id="product_cloth_brand" name="product_cloth_brand">
                            <option disabled selected hidden>Select Brand</option>
                            <option value="youngLA">YoungLA</option>
                            <option value="gymshark">Gymshark</option>
                            <option value="furaak">Furaak</option>
                        </select>
                    </div>
                    <!--Supplement Brand-->
                    <div class="product" id="supplement_brand">
                        <label for="product_supplement_brand">Brand</label>
                        <select id="product_supplement_brand" name="product_supplement_brand">
                            <option disabled selected hidden>Select Brand</option>
                            <option value="ghost">Ghost</option>
                            <option value="feral">Feral</option>
                            <option value="muscleblaze">MuscleBlaze</option>
                        </select>
                    </div>
                </div>

                <!--Name-->
                <div class="product">
                    <label for="product_name">Product Name</label>
                    <input type="text" id="product_name" name="product_name" placeholder="Product Name">
                </div>

                <!--Price-->
                <div class="product">
                    <label for="product_price">Price</label>
                    <input type="text" id="product_price" name="product_price" placeholder="Rs Price">
                </div>

                <!--Sizes-->
                <div class="product" id="sizes">
                    <label for="product_sizes">Sizes</label>
                    <div class="options">
                        <input type="checkbox" id="xs" name="size" value="XS">
                        <label for="xs">XSmall</label>

                        <input type="checkbox" id="s" name="size" value="S">
                        <label for="s">Small</label>

                        <input type="checkbox" id="m" name="size" value="M">
                        <label for="m">Medium</label>

                        <input type="checkbox" id="l" name="size" value="L">
                        <label for="l">Large</label>

                        <input type="checkbox" id="xl" name="size" value="XL">
                        <label for="xl">XLarge</label>
                    </div>
                </div>

                <!--colors-->
                <div class="product" id="colors">
                    <label for="product_color">Colors</label>
                    <div class="options">
                        <input type="checkbox" id="red" name="color" value="Red">
                        <label for="red">Red</label>

                        <input type="checkbox" id="blue" name="color" value="Blue">
                        <label for="blue">Blue</label>

                        <input type="checkbox" id="green" name="color" value="Green">
                        <label for="green">Green</label>

                        <input type="checkbox" id="black" name="color" value="Black">
                        <label for="black">Black</label>

                        <input type="checkbox" id="white" name="color" value="White">
                        <label for="white">White</label>
                    </div>
                </div>

                <!--Flavors-->
                <div class="product hidden" id="flavors">
                    <label for="product_flavors">Flavors</label>
                    <div class="options">
                        <input type="checkbox" id="chocolate" name="flavor" value="Chocolate">
                        <label for="chocolate">Chocolate</label>

                        <input type="checkbox" id="vanilla" name="flavor" value="Vanilla">
                        <label for="vanilla">Vanilla</label>

                        <input type="checkbox" id="strawberry" name="flavor" value="Strawberry">
                        <label for="strawberry">Strawberry</label>

                        <input type="checkbox" id="blueberry" name="flavor" value="Blueberry">
                        <label for="blueberry">Blueberry</label>
                    </div>
                </div>

                <!--Quantity-->
                <div class="product hidden" id="quantity">
                    <label for="product_quantity">Quantity</label>
                    <div class="options">
                        <input type="checkbox" id="250" name="quantity" value="250g">
                        <label for="250">250g</label>

                        <input type="checkbox" id="500" name="quantity" value="500g">
                        <label for="500">500g</label>

                        <input type="checkbox" id="1000" name="quantity" value="1000g">
                        <label for="1000">1000g</label>

                        <input type="checkbox" id="2500" name="quantity" value="2500g">
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