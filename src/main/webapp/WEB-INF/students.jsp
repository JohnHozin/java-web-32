<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students List</title>
    <link rel="stylesheet" href="resources/css/styles.css">
    <script src="../resources/js/functions.js?v125"></script>

    <!-- Yandex.Metrika counter -->
    <script type="text/javascript" >
        (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
            m[i].l=1*new Date();
            for (var j = 0; j < document.scripts.length; j++) {if (document.scripts[j].src === r) { return; }}
            k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
        (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

        ym(91148681, "init", {
            clickmap:true,
            trackLinks:true,
            accurateTrackBounce:true,
            webvisor:true
        });
    </script>
    <noscript><div><img src="https://mc.yandex.ru/watch/91148681" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
    <!-- /Yandex.Metrika counter -->
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
        <div class="flex">
            <input type="submit" class="button" onclick="progressStudent()"
                   value="Посмотреть успеваемость выбранных студентов">

            <c:if test="${role eq 1}">
                <input type="submit" class="button" onclick="window.location.href='/student-create'"
                       value="Создать студента...">
            </c:if>
        </div>
        <c:if test="${role eq 1}">
            <div class="flex">
                <input type="submit" class="button" onclick="modifyStudent()"
                       value="Модифицировать выбранного студента">
                <input type="submit" class="button" onclick="deleteStudents()" value="Удалить выбранных студентов">
            </div>
        </c:if>
    </div>
    <div class="side"></div>
</div>

<div class="margin-left">
    <h2>
        Список студентов
    </h2>
</div>

<div class="flex">
    <div class="side"></div>
    <div class="midle-place">
        <form method="get">
            <table>
                <thead class="thead">
                <tr>
                    <th></th>
                    <th>Фамилия</th>
                    <th>Имя</th>
                    <th>Группа</th>
                    <th>Дата поступления</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${students}" var="student">
                    <tr>
                        <td><input type="checkbox" value="${student.id}" name="idStud"></td>
                        <td>${student.surname}</td>
                        <td>${student.name}</td>
                        <td>${student.group}</td>
                        <td>
                            <f:formatDate value="${student.date}" pattern="dd/MM/yyyy"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
    <div class="side"></div>
</div>

<form action="/student-delete" method="post" id="formDelete">
    <input type="hidden" value="" name="hiddenDelete" id="hiddenDelete">
</form>

<form action="/student-modify" method="get" id="formModify">
    <input type="hidden" value="" name="hiddenModify" id="hiddenModify">
</form>

<form action="/student-progress" method="get" id="formProgress">
    <input type="hidden" value="" name="hiddenProgress" id="hiddenProgress">
</form>

</body>

</html>