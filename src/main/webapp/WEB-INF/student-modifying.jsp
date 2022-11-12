<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Modifying</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/styles.css">

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>

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
            <a href="/students">Назад</a>
        </div>
    </div>

    <div class="midle-place">
        <h3>
            Для модификации студента, введите новые значения и нажмите кнопку "Применить".
        </h3>
    </div>
</div>
<form method="post" action="student-modify">
    <input type="hidden" name="id" value="${student.id}">
    <div class="flex margin-left margin-top">
        <div class="nameText">
            <p>Фамилия</p>
            <p>Имя</p>
            <p>Группа</p>
            <p>Дата поступления</p>
        </div>

        <div class="inputText">
            <div>
                <input type="text" class="textInput" name="surname" value="${student.surname}">
            </div>
            <div>
                <input type="text" class="textInput" name="name" value="${student.name}">
            </div>
            <div>
                <input type="text" class="textInput" name="group" value="${student.group}">
            </div>
            <div>
                <input type="text" class="textInput margin-bottom" id="datepicker" name="date"
                       value="<f:formatDate value="${student.date}" pattern="MM/dd/yyyy"/>">
            </div>
            <div class="margin-bottom">
                <input type="submit" class="button confirm" value="Применить">
            </div>
        </div>

    </div>
</form>
</body>
</html>
