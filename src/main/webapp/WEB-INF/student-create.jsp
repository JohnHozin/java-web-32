<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Create</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/styles.css">

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        // $(function () {
        //     $("#datepicker").datepicker();
        // });
    </script>
</head>

<body>
<div class="flex">
    <div class="side"></div>
    <div class="header">
        <h1>Система управления студентами и их успеваемостью</h1>
    </div>
    <div class="side margin-top-auto">
        <div class="rigth-side">
            <c:choose>
                <c:when test="${isLogin eq true}">
                    <p>${login}</p>
                    <c:choose>
                        <c:when test="${role eq 1}">
                            <p>Администратор</p>
                        </c:when>
                        <c:when test="${role eq 2}">
                            <p>Учитель</p>
                        </c:when>
                        <c:when test="${role eq 3}">
                            <p>Студент</p>
                        </c:when>
                    </c:choose>
                    <a href="/logout">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="/login">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<div class="flex margin-top">
    <div class="side">
        <div class=" backToStart">
            <a href="/">На главную</a>
            <a href="/students">Назад</a>
        </div>
    </div>

    <div class="midle-place">
        <h3>
            Для создания студента заполните все поля и нажмите кнопку "Создать".
        </h3>
    </div>
</div>

<form method="post" action="/student-create">
    <div class="flex margin-left margin-top">
        <div class="nameText">
            <p>Фамилия</p>
            <p>Имя</p>
            <p>Группа</p>
            <p>Дата поступления</p>
        </div>
        <div class="inputText">
            <div>
                <input type="text" class="textInput" name="surname">
            </div>
            <div>
                <input type="text" class="textInput" name="name">
            </div>
            <div>
                <input type="text" class="textInput" name="group">
            </div>
<%--            <div>--%>
<%--                <input type="text" class="textInput margin-bottom" id="datepicker" name="date"--%>
<%--                       value="<f:formatDate value="" pattern="MM/dd/yyyy"/>">--%>
<%--            </div>--%>
            <div class="margin-bottom">
                <input type="submit" class="button confirm" value="Создать">
            </div>
        </div>
    </div>
</form>

<c:if test="${Error eq 1}">
    <div class="margin-left error">
        <p>Поля не должны быть пустыми!</p>
    </div>
</c:if>

</body>

</html>