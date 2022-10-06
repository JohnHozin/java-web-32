<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students List</title>
    <link rel="stylesheet" href="resources/css/styles.css">
    <script src="../resources/js/functions.js?v122"></script>
</head>

<body>
<div class="flex">
    <div class="side"></div>
    <div class="header">
        <h1>Система управления студентами и их успеваемостью</h1>
    </div>
    <div class="side margin-top-auto">
        <div class="rigth-side">
            <a href="">Login</a>
            <br>
            <br>
            <a href="">Logout</a>
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
            <input type="submit" class="button" onclick="deleteStudents()"
                   value="Посмотреть успеваемость выбранных студентов">
            <input type="submit" class="button" onclick="window.location.href='/student-create'"
                   value="Создать студента...">
        </div>

        <div class="flex">
            <input type="submit" class="button" onclick="modifyStudent()" value="Модифицировать выбранного студента">
            <input type="submit" class="button" onclick="deleteStudents()" value="Удалить выбранных студентов">
        </div>
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

</body>

</html>