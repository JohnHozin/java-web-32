<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms List</title>
    <link rel="stylesheet" href="resources/css/styles.css?v1.3">
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
        </div>
    </div>

    <form method="get">
        <div class="flex">
            <h3 class="margin-rigth">
                Выбрать семестр
            </h3>

            <select class="margin-rigth" name="idSelectedTerm">
                <c:forEach items="${terms}" var="t">
                    <option value="${t.id}"
                            <c:if test="${t eq selectedTerm}">
                                selected
                            </c:if>
                    >${t.term}</option>
                </c:forEach>
            </select>

            <div class="justBut">
                <input type="submit" value="Выбрать" class="progress">
            </div>
        </div>
        <h2>
            Длительность семестра: ${selectedTerm.duration}
        </h2>
    </form>
</div>

<div class="flex">
    <div class="side"></div>
    <div class="sideDiscipline">
        <form method="get">
            <table>
                <thead class="thead">
                <tr>
                    <th>Наименование дисциплины</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${disciplines}" var="d">
                    <tr>
                        <td>${d.discipline}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
    <c:if test="${role eq 1}">
        <div class="sideDiscipline">
            <div class="buttonBot">
                <input type="submit" class="button" onclick="window.location.href='/term-create'"
                       value="Создать семестр...">
            </div>
            <div class="buttonBot">
                <input type="submit" class="button" onclick="window.location.href='/term-modifying'"
                       value="Модифицировать текущий семестр...">
            </div>
            <form method="post" action="/term-delete">
            <div class="buttonBot">
                <input type="submit" class="button"
                       value="Удалить текущий семестр...">
            </div>
            </form>
        </div>
    </c:if>
</div>

</body>
</html>