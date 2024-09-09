<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Realizar Matricula</title>
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/style.css"/>' />
  </head>
  <body>
    <div>
      <jsp:include page="menu.jsp"/>
    </div>
    <main>
      <form action="realizar_matricula" method="post">
        <div>
          <label for="ra">RA: </label>
          <input type="number" name="ra" id="ra"
                 value="${matricula.ra}"
          />
          <input type="submit" name="botao" value="Buscar">
        </div>
        <div>
          <input
                  type="submit"
                  value="Listar Disciplinas Disponiveis"
                  name="botao"
                  class="esticado"
                  <c:if test="${ empty busca_valida }"> disabled </c:if>
          />
          <input
                  type="submit"
                  value="Listar Disciplinas Matriculadas"
                  name="botao"
                  class="esticado"
                  <c:if test="${ empty busca_valida }"> disabled </c:if>
          />
        </div>
        <div class="tabela_container">
          <table>
            <thead>
            <th>Código</th>
            <th>Nome</th>
            <th>Num. Aulas</th>
            <c:if test="${ acao ne 'ALTERAR' }">
              <th>Situação</th>
            </c:if>
            <c:if test="${ acao eq 'ALTERAR' }">
              <th>Horário</th>
              <th>Dia</th>
            </c:if>
            <th>Ação</th>
            </thead>
            <tbody>
            <c:if test="${ not empty matriculasDisciplina }">
              <c:forEach items="${matriculasDisciplina}" var="md">
                <tr>
                  <td><c:out value="${md.disciplina.codigo}"/></td>
                  <td><c:out value="${md.disciplina.nome}"/></td>
                  <td><c:out value="${md.disciplina.horas_semanais}"/></td>
                  <c:if test="${ acao ne 'ALTERAR' }">
                    <td><c:out value="${md.situacao}"/></td>
                  </c:if>
                  <c:if test="${ acao eq 'ALTERAR' }">
                    <td><c:out value="${md.horario.horario_inicio}"/></td>
                    <td><c:out value="${md.dia_semana}"/></td>
                  </c:if>
                  <td>
                    <a class="acao" id="${md.disciplina.codigo}"
                       onclick="selecionar_disciplina('${md.disciplina.codigo}')"
                       data-ra="${matricula.ra}" data-cod_disc="${md.disciplina.codigo}"
                       data-nome_disc="${md.disciplina.nome}"
                            <c:if test="${ acao eq 'SELECIONAR' }"> data-acao="SELECIONAR" data-id="null" >Selecionar </c:if>
                            <c:if test="${ acao eq 'ALTERAR' }"> data-acao="ALTERAR" data-id="${md.id}" >Alterar </c:if>
                    </a>
                  </td>
                </tr>
              </c:forEach>
            </c:if>
            </tbody>
          </table>
        </div>
        <div>
          <label for="dia_semana">Dia em deseja cursar a disciplina: </label>
          <select name="dia_semana" id="dia_semana">
            <option <c:if test="${dia eq 2}">selected="selected"</c:if> value="2">Segunda-Feira</option>
            <option <c:if test="${dia eq 3}">selected="selected"</c:if> value="3">Terça-Feira</option>
            <option <c:if test="${dia eq 4}">selected="selected"</c:if> value="4">Quarta-Feira</option>
            <option <c:if test="${dia eq 5}">selected="selected"</c:if> value="5">Quinta-Feira</option>
            <option <c:if test="${dia eq 6}">selected="selected"</c:if> value="6">Sexta-Feira</option>
            <option <c:if test="${dia eq 7}">selected="selected"</c:if> value="7">Sábado</option>
          </select>
        </div>
        <div>
          <input disabled id="i_cod_disc" type="text" placeholder="Código Disciplina" class="dado_matricula" value="${ cod_disc }">
          <input disabled id="i_nome_disc" type="text" placeholder="Nome Disciplina" class="dado_matricula" value="${ nome_disc }">
          <select name="horario" id="horario">
            <option value="00000">Escolha um horário</option>
            <c:forEach items="${horarios}" var="h">
              <option value="${h.codigo}">${h.horario_inicio}; ${h.numero_aulas} aulas</option>
            </c:forEach>
          </select>
          <%-- Solução de contorno --%>
          <input type="hidden" id="id_matricula" name="id_matricula" value="${ id_matricula }">
          <input type="hidden" id="cod_disc" name="cod_disc" value="${ cod_disc }">
          <input type="hidden" id="nome_disc" name="nome_disc" value="${ nome_disc }">
        </div>
        <div>
          <c:if test="${ acao ne 'ALTERAR' }">
            <input
                    type="submit"
                    name="botao"
                    value="Realizar Matricula"
                    <c:if test="${ empty matricula_valida }"> disabled </c:if>
            />
          </c:if>
          <c:if test="${ acao eq 'ALTERAR' }">
            <input
                    type="submit"
                    name="botao"
                    value="Alterar Matricula"
                    <c:if test="${ empty matricula_valida }"> disabled </c:if>
            />
          </c:if>
        </div>
        <div>
          <c:if test="${not empty erro}">
            <h3 class="erro"><c:out value="${erro}"/></h3>
          </c:if>
          <c:if test="${not empty saida}">
            <h3 class="saida"><c:out value="${saida}"/></h3>
          </c:if>
        </div>
      </form>
    </main>
  </body>
  <script>
    function selecionar_disciplina(id) {
      var hiperlink = document.getElementById(id)
      var ra = hiperlink.getAttribute('data-ra')
      var cod_disc = hiperlink.getAttribute('data-cod_disc')
      var nome_disc = hiperlink.getAttribute('data-nome_disc')
      var acao = hiperlink.getAttribute('data-acao')
      var id_matricula = hiperlink.getAttribute('data-id')
      var select = document.getElementById('dia_semana')
      var dia = select.value
      var url = "realizar_matricula?ra="+ra+"&cd="+cod_disc+"&n="+nome_disc+"&d="+dia+"&acao="+acao
      if (id_matricula !== 'null')
        url = "realizar_matricula?ra="+ra+"&cd="+cod_disc+"&n="+nome_disc+"&d="+dia+"&id="+id_matricula+"&acao="+acao
      window.location.href = url
    }
  </script>
</html>