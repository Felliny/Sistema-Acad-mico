<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Área da Secretaria</title>
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/style.css"/>' />
  </head>
  <body>
    <div>
      <jsp:include page="menu.jsp"/>
    </div>
    <main>
      <h1>Área da Secretaria</h1>
      <br />
      <div>
        <a class="btn" href="manter_aluno">Manter Aluno</a>
      </div>
      <div>
        <a class="btn" href="consultar_alunos">Consultar Alunos</a>
      </div>
      <div>
        <a class="btn" href="historico">Histórico Aluno</a>
      </div>
      <div>
        <a class="btn" href="dispensar_disciplinas">Dispensar Disciplinas Aluno</a>
      </div>
    </main>
  </body>
</html>
