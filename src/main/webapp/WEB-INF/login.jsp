<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/styles.css">
    <title>Система управления студентами и их успеваемостью</title>
</head>
<body>
<div class="header">
    <div class="left-side"></div>
    <div id="title"><h1>Система управления студентами и их успеваемостью</h1></div>
    <div class=" right-side blue-button logout"><span><a href="">Logout</a></span></div>
</div>
<div class="main">
    <div class="left-side"><div class="blue-button"></div><div class="blue-button"></div></div>
    <div class="index">
        <form method="post" action="/login">
            <div class="text">Выберите пользователя: <select name="role">
                <option value="3">Студент</option>
                <option value="2">Учитель</option>
                <option value="1">Администратор</option>
            </select>
            </div>
            <div>
                <div class="text">Логин: <input name="login" type="text" size="40"></div>
                <div class="text">Пароль: <input type="password" name="password" type="text" size="40"></div>
            </div>
            <div><button class="grey-button-discipline">Войти</button><div style="width: 299px;"></div></div>
            <input type="submit" value="Войти"/>


        </form>
    </div>
    <div class="right-side blue-button"><span></span></div>
</div>
</div>
</body>
