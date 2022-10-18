<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="resources/css/styles.css?v126">
</head>

<body>

<div class="flex">
    <div class="side"></div>
    <div class="header">
        <h1>Система управления студентами и их успеваемостью</h1>
    </div>
    <div class="side margin-top-auto">
        <div class="rigth-side"></div>
    </div>
</div>

<form method="post" action="/login">
    <div class="flex margin-left margin-top">
        <div class="nameText">
            <p>Логин:</p>
            <p>Пароль:</p>
            <p>Выберите пользователя:</p>
        </div>
        <div class="inputText">

            <div>
                <input type="text" class="textInput" name="login">
            </div>
            <div>
                <input type="password" class="textInput" name="password">
            </div>
            <select class="margin-rigth" name="role">
                <c:forEach items="${roles}" var="r">
                    <option value="${r.id}">${r.role}</option>
                </c:forEach>
            </select>

<%--            <select class="margin-rigth"  name="role">--%>
<%--                <option value="3">Студент</option>--%>
<%--                <option value="2">Учитель</option>--%>
<%--                <option value="1">Администратор</option>--%>
<%--            </select>--%>

            <div class="margin-bottom"></div>
            <input type="submit" class="button confirm" value="Войти">
        </div>
    </div>
</form>


<c:if test="${Error eq 1}">
    <div class="margin-left error">
        <p>Поля не должны быть пустыми!</p>
    </div>
</c:if>

<c:if test="${ErrorLogin eq 1}">
    <div class="margin-left error">
        <p>Неверный логин или пароль или роль!</p>
    </div>
</c:if>

</body>

</html>