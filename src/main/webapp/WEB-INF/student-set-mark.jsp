<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Set Marks</title>
    <link rel="stylesheet" href="resources/css/styles.css?v1.7">

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
            <a href="/student-progress">Назад</a>
        </div>
    </div>

    <div class="midle-place">
        <h3>
            Отображена успеваемость для следующего студента:
        </h3>
    </div>
</div>

<div class="flex margin-top">
    <div class="side"></div>
    <div class="midle-place">
        <form method="get">
            <table class="student-table">
                <thead class="thead">
                <tr>
                    <th>Фамилия</th>
                    <th>Имя</th>
                    <th>Группа</th>
                    <th>Дата поступления</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${student.surname}</td>
                    <td>${student.name}</td>
                    <td>${student.group}</td>
                    <td><f:formatDate value="${student.date}" pattern="dd/MM/yyyy"/></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>

<div class="flex margin-top">
    <div class="side"></div>
    <div class="sideDiscipline">
        <form method="post" action="/set-mark">
            <table>
                <thead class="thead">
                <tr>
                    <th>Дисциплина</th>
                    <th>Оценка</th>
                </tr>
                </thead>
                <tbody>

                <c:choose>
                    <c:when test="${marks.size() eq 0}">
                        <c:forEach items="${disciplinesByTerm}" var="dT">
                            <tr>
                                <td>${dT.discipline}</td>
                                <td>
                                    <select name="mark ${dT.discipline}">
                                        <option value="0">Выберете оценку</option>
                                        <option value="5">5</option>
                                        <option value="4">4</option>
                                        <option value="3">3</option>
                                        <option value="2">2</option>
                                        <option value="1">1</option>
                                    </select>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${marks}" var="m">
                            <tr>
                                <td>${m.discipline.discipline}</td>
                                <td>${m.mark}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                <%--                <c:choose>--%>
                <%--                    <c:when test="${marks.size() eq 0}">--%>
                <%--                        <c:forEach items="${disciplinesByTerm}" var="d">--%>
                <%--                            <tr>--%>
                <%--                                <td>${d.discipline}</td>--%>
                <%--                                <td>--%>
                <%--                                        &lt;%&ndash;                                    <select name="setMark ${d.discipline}">&ndash;%&gt;--%>
                <%--                                    <select name="mk">--%>
                <%--                                        <option value="0">Выберете оценку</option>--%>
                <%--                                        <option value="5">5</option>--%>
                <%--                                        <option value="4">4</option>--%>
                <%--                                        <option value="3">3</option>--%>
                <%--                                        <option value="2">2</option>--%>
                <%--                                        <option value="1">1</option>--%>
                <%--                                    </select>--%>
                <%--                                </td>--%>
                <%--                            </tr>--%>
                <%--                        </c:forEach>--%>
                <%--                    </c:when>--%>
                <%--                    <c:otherwise>--%>
                <%--                        <c:forEach items="${marks}" var="m">--%>
                <%--                            <tr>--%>
                <%--                                <td>${m.discipline.discipline}</td>--%>
                <%--                                <td>${m.mark}</td>--%>
                <%--                            </tr>--%>
                <%--                        </c:forEach>--%>
                <%--                    </c:otherwise>--%>
                <%--                </c:choose>--%>

                </tbody>
            </table>
            <div class="text-center margin-top">
                <input type="submit" class="button"
                       value="Принять">
            </div>
        </form>

        <%--        <form method="post" action="/set-mark">--%>
        <%--            <c:forEach items="${disciplinesByTerm}" var="dT">--%>
        <%--                <div class="flex margin-top">--%>
        <%--                    <div class="margin-rigth">--%>
        <%--                        <p>${dT.discipline}</p>--%>
        <%--                    </div>--%>
        <%--                    <select name="mark ${dT.discipline}">--%>
        <%--                        <option value="0">Выберете оценку</option>--%>
        <%--                        <option value="5">5</option>--%>
        <%--                        <option value="4">4</option>--%>
        <%--                        <option value="3">3</option>--%>
        <%--                        <option value="2">2</option>--%>
        <%--                        <option value="1">1</option>--%>
        <%--                    </select>--%>
        <%--                </div>--%>
        <%--            </c:forEach>--%>
        <%--            <div class="text-center margin-top">--%>
        <%--                <input type="submit" class="button"--%>
        <%--                       value="Принять">--%>
        <%--            </div>--%>
        <%--        </form>--%>

    </div>


    <div class="sideDiscipline">
        <form method="get">
            <div class="flex justBetween">
                <h3>
                    Выбрать семестр
                </h3>

                <select name="idSelectedTerm">
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
            <div class="text-center">
                <h2>
                    Средняя оценка за семестр: ${middleMark}
                    <c:if test="${!(marks.size() eq 0)}">
                        балла
                    </c:if>
                </h2>
            </div>
        </form>
    </div>


</div>


</body>

</html>
