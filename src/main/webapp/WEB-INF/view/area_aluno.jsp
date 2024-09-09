<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Área do Aluno</title>
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/style.css"/>' />
  </head>
  <body>
    <div>
      <jsp:include page="menu.jsp"/>
    </div>
    <main>
      <h1>Área do Aluno</h1>
      <div>
        <a class="btn" href="realizar_matricula">
          Realizar Matricula
        </a>
      </div>
      <div>
        <a class="btn" href="consultar_disciplinas">
          Consultar Disciplinas Matriculadas
        </a>
      </div>
    </main>
  </body>
</html>
