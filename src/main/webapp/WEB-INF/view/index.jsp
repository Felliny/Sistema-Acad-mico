<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/style.css"/>' />
  </head>
  <body>
    <h1 class="titulo">AGIS</h1>
    <main>
      <h2>Home</h2>
      <br />
      <div>
        <a class="btn" href="area_secretaria">Área da Secretaria</a>
      </div>
      <br />
      <div>
        <a class="btn" href="area_aluno">Área do Aluno</a>
      </div>
      <br />
      <div>
        <a class="btn" href="area_professor">Área do Professor</a>
      </div>
    </main>
  </body>
</html>
