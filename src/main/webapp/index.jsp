<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title page</title>
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
            <a href="/login">Login</a>
            <br>
            <br>
            <a href="">Logout</a>
        </div>
    </div>
</div>

<div class="flex justify">
    <div class="link">
        <a href="/students">Студенты</a>
    </div>
    <div class="link">
        <a href="/disciplines">Дисциплины</a>
    </div>
    <div class="link">
        <a href="/terms">Семестры</a>
    </div>
</div>
</body>

</html>