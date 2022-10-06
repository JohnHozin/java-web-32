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
</head>

<body>
<div class="flex">
    <div class="side"></div>
    <div class="header">
        <h1>Система управления студентами и их успеваемостью</h1>
    </div>
    <div class="side margin-top-auto">
        <div class="rigth-side">
            <a href="#">Login</a>
            <br>
            <br>
            <a href="#">Logout</a>
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
                    <th></th>
                    <th>Наименование дисциплины</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${disciplines}" var="discipline">
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>${discipline.discipline}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
    <div class="sideDiscipline">
        <div class="buttonBot">
            <a href="/discipline-create" class="button">Создать дисциплину...</a>
        </div>
        <div class="buttonBot">
            <a href="/discipline-modifying" class="button">Модифицировать выбранную дисциплину...</a>
        </div>
        <div class="buttonBot">
            <a href="" class="button">Удалить выбранную дисциплину...</a>
        </div>
    </div>
</div>


</body>

</html>