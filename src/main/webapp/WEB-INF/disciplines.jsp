<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discipline List</title>
    <link rel="stylesheet" href="resources/css/styles.css">
    <script src="../resources/js/functions.js?v125"></script>
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

    <div class="midle-place">
        <h2 class="margin-0">
            Список дисциплин
        </h2>
    </div>
</div>

<div class="flex">
    <div class="side"></div>
    <div class="sideDiscipline">
        <form method="get">
            <table>
                <thead class="thead">
                <tr>
                    <c:if test="${role eq 1}">
                        <th></th>
                    </c:if>
                    <th>Наименование дисциплины</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${disciplines}" var="discipline">
                    <tr>
                        <c:if test="${role eq 1}">
                            <td><input type="checkbox" value="${discipline.id}" name="idDiscip"></td>
                        </c:if>
                        <td>${discipline.discipline}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
    <c:if test="${role eq 1}">
        <div class="sideDiscipline">
                <%--        <div class="buttonBot">--%>
                <%--            <a href="/discipline-create" class="button">Создать дисциплину...</a>--%>
                <%--        </div>--%>
                <%--        <div class="buttonBot">--%>
                <%--            <a href="/discipline-modifying" class="button">Модифицировать выбранную дисциплину...</a>--%>
                <%--        </div>--%>
                <%--        <div class="buttonBot">--%>
                <%--            <a href="" class="button">Удалить выбранную дисциплину...</a>--%>
                <%--        </div>--%>

            <div class="buttonBot">
                <input type="submit" class="button" onclick="window.location.href='/discipline-create'"
                       value="Создать дисциплину...">
            </div>
            <div class="buttonBot">
                <input type="submit" class="button" onclick="modifyDiscipline()"
                       value="Модифицировать выбранную дисциплину...">
            </div>
            <div class="buttonBot">
                <input type="submit" class="button" onclick="deleteDisciplines()"
                       value="Удалить выбранную дисциплину...">
            </div>
        </div>
    </c:if>
</div>

<form action="/discipline-delete" method="post" id="formDeleteDiscipline">
    <input type="hidden" value="" name="hiddenDeleteDiscipline" id="hiddenDeleteDiscipline">
</form>

<form action="/discipline-modifying" method="get" id="formModifyDiscipline">
    <input type="hidden" value="" name="hiddenModifyDiscipline" id="hiddenModifyDiscipline">
</form>

</body>

</html>