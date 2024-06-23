<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sql</title>
</head>
<body>
<sql:setDataSource var="contacts" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/javalab9"
                   user="jokimi" password="sonamytabian48"/>

<sql:query dataSource="${contacts}" var="myself" >
  SELECT * FROM users where username = ?
  <sql:param value="admin" />
</sql:query>

<sql:query dataSource="${contacts}" var="contacts">
  SELECT * FROM users
</sql:query>

<h1>SQL TAGS</h1>

<table style="border: 1px solid black; width: 40%">
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Password</th>
    <th>Role</th>
  </tr>

  <c:forEach var = "row" items = "${contacts.rows}">
    <tr>
      <td><c:out value = "${row.Id}"/></td>
      <td> <c:out value = "${row.UserName}"/></td>
      <td> <c:out value = "${row.UserPassword}"/></td>
      <td> <c:out value = "${row.UserRole}"/></td>
    </tr>
  </c:forEach>
</table>



<br/><br/><br/>
<table style="border: 1px solid black; width: 25%">
  <tr>
    <th>Name</th>
    <th>Password</th>
    <th>Role</th>
  </tr>

  <c:forEach var = "row" items = "${myself.rows}">
    <tr>
      <td><c:out value = "${row.Id}"/></td>
      <td> <c:out value = "${row.UserName}"/></td>
      <td> <c:out value = "${row.UserPassword}"/></td>
      <td> <c:out value = "${row.UserRole}"/></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>