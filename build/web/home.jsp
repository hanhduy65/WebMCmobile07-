<%-- 
    Document   : home
    Created on : Jun 20, 2022, 9:34:10 PM
    Author     : hanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MCmobile - Điện thoại, Máy tính Bảng, Đồng hồ</title>
        <link rel="icon" href="images/logo.png">
        <style>
            #Slider {
                padding-bottom: 30px;
                border-bottom: 2px solid #333;
                overflow: hidden;
            }

            .aspect-ratio-169 {
                display: block;
                position: relative;
                padding-top: 56.25%;
                transition: 0.3s;

            }

            .aspect-ratio-169 img {
                display: block;
                position: absolute;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
            }

            .dot-container {
                position: absolute;
                height: 30px;
                width: 100%;
                display: flex;
                align-items: center;
                text-align: center;
                justify-content: center;
            }

            .dot {
                height: 18px;
                width: 18px;
                background-color: #ccc;
                border-radius: 50%;
                margin-right: 12px;
                cursor: pointer;
            }

            .dot.active {
                background-color: #333;
            }

            #wrapper {
                max-width: 1170px;
                margin: 0 auto;
            }

            ul.product {
                list-style: none;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                margin-left: 10%;
                margin-right: 10%;
                margin-top: 40px;

            }

            ul.product li {
                flex-basis: 20%;
                padding-left: 15px;
                padding-right: 15px;
                box-sizing: border-box;
                margin-bottom: 30px;

            }


            ul.product li .product-top{
                position: relative;
                overflow: hidden;
            }

            ul.product li .product-top .product-thumb {
                display: block;
            }


            ul.product li:hover .product-top .product-thumb img{
                filter: opacity(80%);
            }

            ul.product li .product-top .product-thumb img {
                display: block;
            }

            ul.product li .product-top a.buy-now {
                text-transform: uppercase;
                text-decoration: none;
                text-align: center;
                display: block;
                background-color: #446084;
                color: white;
                padding: 10px 0px;
                position: absolute;
                bottom: -36px;
                width: 100%;
                transition: 0.25s ease-in-out;
                opacity: 0.85

            }

            ul.product li:hover a.buy-now{
                bottom: 0px;
            }

            ul.product li .product-info {
                padding: 10px 0px;
            }

            ul.product li img {
                max-width: 100%;
                height: auto;
            }

            ul.product li .product-info a{
                display: block;
                text-decoration: none;
            }
            ul.product li .product-info a.product-cat {
                font-size: 11px;
                text-transform: uppercase;
                color: #003333;
                padding: 3px 0px;

            }

            ul.product li .product-info a.product-name {
                color: #334862;
                padding: 3px 0px;
            }

            ul.product li .product-info .product-price {
                color: #111;
                padding: 2px 0px;
                font-weight: 600;
            }



 
            
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <section id="Slider">
                <div class="aspect-ratio-169">
                    <img src="images/slide1.webp">
                    <img src="images/slide2.jpg">
                    <img src="images/slide3.jpg">
                    <img src="images/silde4.webp">
                </div>
                <div class="dot-container">
                    <div class="dot active"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                </div>
            </section>



            <div class="wrapper">
                <ul class="product">
                <c:forEach items="${requestScope.listP}" var="p"> 
                    <li>
                        <div class="product-item">
                            <div class="product-top">
                                <a href="" class="product-thumb">
                                    <img src="${p.image}" alt="">
                                </a>
                                <!-- mua ngay -->
                                <a href="" class="buy-now">Mua Ngay</a>
                            </div>
                            <div class="product-info">
                                <a href="" class="product-cat">${p.title}</a>
                                <a href="detail?pid=${p.id}" class="product-name">${p.name}</a>
                                <div class="product-price">${p.price}</div>                            
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>    

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
    <script>
        const header = document.querySelector("header")
        window.addEventListener("scroll", function () {
            x = window.pageYOffset
            if (x > 0) {
                header.classList.add("sticky")
            } else {
                header.classList.remove("sticky")
            }
        })
        const imgPosition = document.querySelectorAll(".aspect-ratio-169 img")
        const imgContainer = document.querySelector(".aspect-ratio-169")
        const dotItem = document.querySelectorAll(".dot")
        let index = 0;
        let imgNum = imgPosition.length
        // console.log(imgPosition)
        imgPosition.forEach(function (image, index) {
            image.style.left = index * 100 + "%"
            dotItem[index].addEventListener("click", function () {
                slider(index)
            })
        })
        function imgSilde() {
            index++;
            if (index >= imgNum) {
                index = 0
            }
            imgContainer.style.left = "-" + index * 100 + "%"
            slider(index)

        }

        function slider(index) {
            imgContainer.style.left = "-" + index * 100 + "%"
            const dotActive = document.querySelector(".active")
            dotActive.classList.remove("active")
            dotItem[index].classList.add("active")
        }
        setInterval(imgSilde, 5000)
    </script>
</html>
