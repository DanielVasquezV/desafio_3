<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 09/05/2024
  Time: 11:16 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Editar Estudiante</h2>
<form action="subjectDetails" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
    <label for="nombres">Nombres:</label>
    <input type="text" id="nombres" name="nombres" value="<%= request.getParameter("nombres") %>"><br>
    <!-- Agrega los campos restantes para la edición -->
    <button type="submit">Guardar Cambios</button>
</form>
</body>
</html>
