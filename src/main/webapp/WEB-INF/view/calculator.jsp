<%--
  Created by IntelliJ IDEA.
  User: ЭЛЬДОРАДО
  Date: 30.12.2018
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculator</title>
    <link rel="stylesheet" type="text/css" href="/cargodelivery/styles/calculator.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
</head>
<body>
<header>
    <div class="logo">
        <a href="/cargodelivery">
            <img class="graficlogo" src="/cargodelivery/images/logo.png" alt="Logo">
            <p style="color:white;font-size: 35px;font-family: 'Arial';margin-top: 20px;">CargoDelivery</p>
        </a>
        <c:if test="${requestScope.role == 0}">
            <form method="post" action="/cargodelivery" class="form">
                <input type="email" required placeholder="Email" name="login" class="first"><!-- <br> -->
                <input type="password" required placeholder="Password" name="password" class="second">
                <input class="button" type="submit" value="Вход">
                <div class="text">
                    <a href="/cargodelivery/registration" style="color:white;">регистрация</a>
                </div>
            </form>
        </c:if>
        <c:if test="${requestScope.role == 1}">
            <div class="exit">
                <a class="button" href=<c:url value="/logout"/>>Выход</a>
            </div>
        </c:if>
    </div>
    <nav>
        <div class="topnav" id="myTopnav">
            <c:if test="${requestScope.role == 0}">
                <a href="/cargodelivery">ГЛАВНАЯ</a>
            </c:if>
            <c:if test="${requestScope.role == 1}">
                <a href="/cargodelivery">КАБИНЕТ</a>
            </c:if>
            <a href="">О КОМПАНИИ</a>
            <a href="">ТАРИФЫ</a>
            <a href="/cargodelivery/direction">НАПРАВЛЕНИЕ</a>
            <a href="#">КАЛЬКУЛЯТОР</a>
            <a href="">КОНТАКТЫ</a>
            <a href="#" id="menu" class="icon">&#9776;</a>
        </div>
    </nav>
</header>

<main>
    <div class="calculate">
        <h2>Рассчёт стоимости доставки</h2>
        <div>
            <div>
                <c:set var="price" value="${requestScope.price}"/>
                <div>${price}</div>
            </div>
            <div>
                <c:set var="priceError" value="${requestScope.priceError}"/>
                <div style="color: #de0e0e">${priceError}</div>
            </div>
        </div>
        <br>
        <div>
            <form method="post" action="/cargodelivery/calculator" class="forma">
                <div class="one">
                    <lable>Город отправления</lable>
                    <select name="cityFrom">
                        <option disabled selected>Выберите город</option>
                        <c:forEach var="cityFrom" items="${requestScope.cities}">
                            <option c:out value="${cityFrom.id}">${cityFrom.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <br>
                <div class="one">
                    <lable>Город доставки</lable>
                    <select name="cityTo">
                        <option disabled selected>Выберите город</option>
                        <c:forEach var="cityTo" items="${requestScope.cities}">
                            <option c:out value="${cityTo.id}">${cityTo.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <br>
                <div class="one">
                    <lable>Вид доставки</lable>
                    <select name="cargoType">
                        <option disabled selected>Вид отправления</option>
                        <option c:out value="DOCUMENT">документ</option>
                        <option c:out value="PARSEL">посылка</option>
                        <option c:out value="FREIGHT">груз</option>
                    </select>
                </div>
                <br>
                <div class="one">
                    <lable>Вес груза</lable>
                    <input type="text" required placeholder="вес" name="weight">
                    <div style="font-size: 13px">Вес документов до 3кг. Вес посылок до 50кг.</div>
                </div>
                <br>
                <input class="button" type="submit" value="Посчитать стоимость">
            </form>
        </div>
    </div>
</main>

<footer>
    <nav>
        <c:if test="${requestScope.role == 0}">
            <a href="/cargodelivery">ГЛАВНАЯ</a>
        </c:if>
        <c:if test="${requestScope.role == 1}">
            <a href="/cargodelivery">КАБИНЕТ</a>
        </c:if>
        <a href="">О КОМПАНИИ</a>
        <a href="">ТАРИФЫ</a>
        <a href="/cargodelivery/direction">НАПРАВЛЕНИЕ</a>
        <a href="#">КАЛЬКУЛЯТОР</a>
        <a href="">КОНТАКТЫ</a>
    </nav>
    <div class="social">
        <a href="https://instagram.com"><img src="/cargodelivery/images/instagram.png"></a>
        <a href="https://whatsapp.com"><img src="/cargodelivery/images/whatsapp.png"></a>
        <a href="https://youtube.com"><img src="/cargodelivery/images/youtube.png"></a>
        <a href="https://facebook.com"><img src="/cargodelivery/images/facebook.png"></a>
        <a href="https://telegram.com"><img src="/cargodelivery/images/telegram.png"></a>
        <a href="https://viber.com"><img src="/cargodelivery/images/viber.png"></a>
    </div>
    <p>Java Developer.2018-2019</p>
</footer>

<script src="/cargodelivery/js/script.js"></script>
</body>
</html>
