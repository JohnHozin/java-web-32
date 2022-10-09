<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms Modifying</title>
    <link rel="stylesheet" href="resources/css/styles.css">
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
            <a href="/terms">Назад</a>
        </div>
    </div>

    <div class="midle-place">
        <h3>
            Для модификации семестра отредактируйте данные и нажмите кнопку "Применить".
        </h3>
    </div>
</div>

<div class="flex margin-left margin-top">
    <div class="nameText">
        <p>Длительность (в неделях)</p>
        <p>Дисциплины в семестре</p>
    </div>
    <div class="inputText">
        <div>
            <input type="text" class="textInput">
        </div>
        <select class="margin-rigth margin-bottom" multiple size="5">
            <c:forEach items="${disciplines}" var="discipline">
                <option value="${discipline.discipline}">${discipline.discipline}</option>
            </c:forEach>
        </select>
        <div>
            <a href="" class="button confirm">Создать</a>
        </div>
    </div>
</div>

</body>
</html>
