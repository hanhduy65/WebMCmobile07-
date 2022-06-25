<%-- 
    Document   : detail
    Created on : Jun 24, 2022, 12:43:27 AM
    Author     : hanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MCmobile - Điện thoại, Máy tính Bảng, Đồng hồ</title>
        <link rel="icon" href="images/logo.png">
        <style>
            .product {
                padding: 100px 100px;

            }

            .product-content {
                display: flex;
            }

            .product-content-left {
                width: 50%;
                display: flex;

            }

            .product-content-right {
                width: 50%;

            }

            .product-content-left-bigimg {
                width: 80%;
                padding-right: 20px;

            }

            .product-content-left-bigimg img {
                width: 100%;

            }

            .product-content-left-smallimg {
                width: 20%;
                display: block;
            }

            .product-content-left-smallimg img {
                width: 100%;

            }

            .product-content-right {
                width: 50%;
                padding-left: 80px;

            }

            .product-content-right-right-product-name h1 {
                font-family: var(--main-text-font);
                font-size: 40px;
            }

            .product-content-right-right-product-name p {
                color: #cccccccc;
                font-size: 12px;

            }

            .product-content-right-product-price {
                margin: 12px 0;
                font-size: 20px;
                font-weight: bold;
                font-family: var(--main-text-font);
            }

            .product-content-right-right-product-color img {
                width: 5px;
                height: 5px;
                border-radius: 50%;
            }

            .product-content-right-right-product-color-img {
                height: 40px;
                width: 40px;
                border: 1px solid #333;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 12px 0;
            }

            .size span {
                display: inline-block;
                padding: 3px 6px;
                border: 1px solid #dddddd;
                margin: 12px 10px 12px 0;
                font-size: 12px;
                cursor: pointer;
            }

            .quantiy {
                display: flex;
                margin-bottom: 20px;
                padding-right: 10px;
            }

            .quantiy input {
                width: 25px;
                height: 30px;
                padding-left: 1px;
                margin-left: 10px;

            }

            .product-content-right-product-button button {
                width: 150px;
                height: 40px;
                display: block;
                margin: 20px 0 12px;
                transition: all 0.3s ease;
            }

            .product-content-right-product-button button p {
                padding-left: 10%;
            }

            .product-content-right-product-button button img {
                padding-left: 0%;
            }

            .product-content-right-product-button button:first-child {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border: 2px solid black;
                cursor: pointer;
            }

            .product-content-right-product-button button:first-child:hover {
                background-color: #333;
                color: aliceblue;
            }

        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <section class="product">
                <div class="container">
                    <div class="product-content">
                        <div class="product-content-left">
                            <div class="product-content-left-bigimg">
                                <img src="${detail.image}" alt="">
                        </div>
                        <div class="product-content-left-smallimg">
                            <img src="${detail.image}" alt="">
                            <img src="${detail.image}" alt="">
                            <img src="${detail.image}" alt="">
                            <img src="${detail.image}" alt="">
                        </div>
                    </div>
                    <div class="product-content-right">
                        <div class="product-content-right-right-product-name">
                            <h1>${detail.name}</h1>

                        </div>
                        <div class="product-content-right-product-price">
                            <p>${detail.price}<sup>đ</sup></p>

                        </div>
                        <div class="product-content-right-product-color">
                            <p><span style="font-weight: bold;">Màu sắc</span>:xanh cổ vịtnhajt<span style="color: red"> *</span></p>
                            <div class="product-content-right-product-color-img">
                                <!-- <img src="/assets/img/paris.jpg"> -->
                            </div>
                            <div class="product-content-right-product-capacity">
                                <p style="font-weight: bold;">Dung Lượng</p>
                                <div class="size">
                                    <span>128 gb</span>
                                    <span>1 tb</span>

                                </div>
                            </div>
                            <div class="quantiy">
                                <p style="font-weight: bold">Số lượng</p>
                                <input type="number" min="1" value="1">
                            </div>
                            <p style="color: red">Vui lòng chọn cấu hình *</p>

                            <div class="product-content-right-product-button">
                                <button><p><img src="images/cart.png" alt="alt"/>Mua Hàng</p></button>

                            </div>
                            <!-- <div class="product-content-right-bottom">
                                <div class="product-content-right-bottom-top">
    
                                </div>
                            </div>  -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
