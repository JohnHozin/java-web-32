<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Progress</title>
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
      <a href="/students">Назад</a>
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


<%--<c:forEach items="${students}" var="student">--%>
<%--  <tr>--%>
<%--    <td><input type="checkbox"></td>--%>
<%--    <td>${student.surname}</td>--%>
<%--    <td>${student.name}</td>--%>
<%--    <td>${student.group}</td>--%>
<%--    <td><f:formatDate value="${student.date}" pattern="d/MM/yyyy"/></td>--%>
<%--  </tr>--%>
<%--</c:forEach>--%>



<div class="flex margin-top">
  <div class="side"></div>
  <div class="sideDiscipline">
    <form method="get">
      <table>
        <thead class="thead">
        <tr>
          <th>Дисциплина</th>
          <th>Оценка</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>Высшая математика</td>
          <td>5</td>
        </tr>
        <tr>
          <td>История Науки и Техники</td>
          <td>4</td>
        </tr>
        <tr>
          <td>Политология</td>
          <td>5</td>
        </tr>
        <tr>
          <td>Информатика</td>
          <td>5</td>
        </tr>
        <tr>
          <td>Теория Алгоритмизации</td>
          <td>5</td>
        </tr>
        </tbody>
      </table>
    </form>
  </div>

  <div class="sideDiscipline">
    <div class="flex justBetween">
      <h3>
        Выбрать семестр
      </h3>

      <select>
        <option value="Sem1">Семестр 1</option>
        <option value="Sem2">Семестр 2</option>
        <option value="Sem3">Семестр 3</option>
        <option value="Sem4">Семестр 4</option>
      </select>

      <div class="justBut">
        <a href="" class="progress">Выбрать</a>
      </div>

    </div>
    <div class="text-center">
      <h2>
        Средняя оценка за семестр: 4.8 балла
      </h2>
    </div>

  </div>

</div>

</body>

</html>
