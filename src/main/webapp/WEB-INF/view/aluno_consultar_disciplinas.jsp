<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Consultar Disciplinas Matriculadas</title>
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/style.css"/>' />
  </head>
  <body>
    <div>
      <jsp:include page="menu.jsp"/>
    </div>
    <!-- TODO: Consultar Disciplinas Matriculadas -->
    <main>
      <h1>Disciplinas Matriculadas</h1>
      <form action="consultar_disciplinas" method="post">
        <div>
          <label for="ra">RA</label>
          <input type="number" name="ra" id="ra" maxlength="9"/>
          <input type="submit" value="Buscar" name="botao" id="botao" />
        </div>
        <div align="center" class="erro">
          <c:if test="${not empty erro}">
            <h2><b><c:out value="${erro}"/></b></h2>
          </c:if>
        </div>
        <div class="tabela_container">
          <table>
            <thead>
              <th>Código</th>
              <th>Nome</th>
              <th>Situação</th>
              <th>Horário</th>
              <th>Dia da Semana</th>
            </thead>
            <tbody>
              <c:if test="${not empty listaDisciplinas}">
                <c:forEach var="MatriDisciplina" items="${listaDisciplinas}">
                  <tr>
                    <td><c:out value="${MatriDisciplina.disciplina.codigo}" /></td>
                    <td><c:out value="${MatriDisciplina.disciplina.nome}" /></td>
                    <td><c:out value="${MatriDisciplina.situacao}" /></td>
                    <td><c:out value="${MatriDisciplina.horario.horario_inicio}" /> - <c:out value="${MatriDisciplina.horario.horario_termino}" /></td>
                    <td>
                      <c:if test="${MatriDisciplina.dia_semana == 2}">
                          Segunda-Feira
                      </c:if>
                      <c:if test="${MatriDisciplina.dia_semana == 3}">
                          Terça-Feira
                      </c:if>
                      <c:if test="${MatriDisciplina.dia_semana == 4}">
                        Quarta-Feira
                      </c:if>
                      <c:if test="${MatriDisciplina.dia_semana == 5}">
                        Quinta-Feira
                      </c:if>
                      <c:if test="${MatriDisciplina.dia_semana == 6}">
                        Sexta-Feira
                      </c:if>
                      <c:if test="${MatriDisciplina.dia_semana == 7}">
                        Sábado
                      </c:if>
                    </td>
                  </tr>
                </c:forEach>
              </c:if>
            </tbody>
          </table>
        </div>
      </form>
    </main>
  </body>
</html>
<!-- https://mfyg5g.csb.app/aluno/consultar_disciplinas.html -->
