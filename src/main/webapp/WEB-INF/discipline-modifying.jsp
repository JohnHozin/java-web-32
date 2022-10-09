<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DisciplineModifying</title>
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
            <a href="/disciplines">Назад</a>
        </div>
    </div>

    <div class="midle-place">
        <h3>
            Для того чтобы модифицировать дисциплину введите новое значение поля и нажмите кнопку "Применить":
        </h3>
    </div>
</div>

<form method="post" action="/discipline-modifying">
<input type="hidden" name="id" value="${discipline.id}">
<div class="flex margin-left margin-top">
    <div class="nameText">
        <p>Название</p>
    </div>
    <div class="inputText">
        <div>
            <input type="text" class="textInput margin-bottom" name="discipline" value="${discipline.discipline}">
        </div>
        <div class="margin-bottom">
            <input type="submit" class="button confirm" value="Применить">
        </div>
    </div>
</div>
</form>

</body>
</html>
