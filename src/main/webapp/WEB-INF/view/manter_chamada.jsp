<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/style.css"/>' />
    <title>Manter Chamada</title>
</head>
<body>
    <div>
        <jsp:include page="menu.jsp"/>
    </div>
    <main>
        <h1>Manter Chamada</h1>
        <form id="chamada" action="manter_chamada" method="post">
        <div>
            <label for="curso">Curso:</label>
            <select name="curso" id="curso">
                <option value="" disabled selected hidden>Selecione uma opção...</option>
                <c:if test="${not empty cursos}">
                    <c:forEach var="c" items="${cursos}">
                        <option value="${c.codigo}">${c.nome}</option>
                    </c:forEach>
                </c:if>
            </select>
            <label for="disciplina">Disciplina:</label>
            <select name="disciplina" id="disciplina">
                <option value="" disabled selected hidden>Selecione uma opção...</option>
                <c:if test="${not empty disciplinas}">
                    <c:forEach var="d" items="${disciplinas}">
                        <option value="${d.codigo}">${d.nome}</option>
                    </c:forEach>
                </c:if>
            </select>
        </div>
            <div>
                <input type="submit" class="btn" value="Buscar Chamadas" name="botao">
            </div>
        <div class="tabela_container">
            <table>
                <thead>
                    <th>Data</th>
                    <th>Conteúdo</th>
                    <th>Ação</th>
                </thead>
                <tbody>
                    <c:if test="${not empty presencas}">
                        <c:forEach var="p" items="${presencas}">
                            <tr>
                                <td><c:out value="${p.data}" /> </td>
                                <td><c:out value="${p.conteudo_titulo}"/> </td>
                                <td><a href="${pageContext.request.contextPath}/manter_chamada?id=${p.id_conteudo}&acao=Editar">Editar</a></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>
            <br />
            <br />
            <div align="center">
                <c:if test="${not empty saida}">
                    <h3><b><c:out value="${saida}"/></b></h3>
                </c:if>
                <c:if test="${not empty erro}">
                    <h3><b><c:out value="${erro}"/></b></h3>
                </c:if>
            </div>
            <br />
            <br />
            <div>
                <h1>Chamada</h1>
            </div>
            <div>
                <input type="submit" class="btn" value="Adicionar Chamada" name="botao" width="300">
            </div>
            <div>
                <table>
                    <thead>
                    <th>Aluno</th>
                    <c:if test="${not empty chamada}">
                        <c:if test="${chamada.get(0).num_aulas > 2}" >
                            <c:if test="${chamada.get(0).horario_inicio == '14:50:00'}">
                                <th>15:40</th>
                                <th>16:30</th>
                                <th>17:20</th>
                                <th>18:20</th>
                            </c:if>
                            <c:if test="${chamada.get(0).horario_inicio == '13:00:00'}">
                                <th>13:50</th>
                                <th>14:40</th>
                                <th>15:30</th>
                                <th>16:30</th>
                            </c:if>
                        </c:if>
                        <c:if test="${chamada.get(0).num_aulas == 2}" >
                            <c:if test="${chamada.get(0).horario_inicio == '13:00:00'}">
                                <th>13:50</th>
                                <th>14:40</th>
                            </c:if>
                            <c:if test="${chamada.get(0).horario_inicio == '16:40:00'}">
                                <th>17:30</th>
                                <th>18:20</th>
                            </c:if>
                            <c:if test="${chamada.get(0).horario_inicio == '14:50:00'}">
                                <th>15:40</th>
                                <th>16:30</th>
                            </c:if>
                        </c:if>
                    </c:if>
                    </thead>
                    <tbody>
                        <c:if test="${not empty chamada}">
                            <c:forEach var="c" items="${chamada}">
                                <tr>
                                    <td><c:out value="${c.nome_aluno}" /></td>
                                    <c:if test="${chamada.get(0).num_aulas > 2}" >
                                        <c:if test="${c.presenca1 != 2 || c.presenca2 != 2 || c.presenca3 != 2 || c.presenca4 != 2}" >
                                            <c:if test="${c.presenca1 == 0}" >
                                                <th><input id="presenca1${c.id_matricula_disciplina}" type="checkbox" name="presenca1${c.id_matricula_disciplina}" value="presenca" ></th>
                                            </c:if>
                                            <c:if test="${c.presenca1 == 1}" >
                                                <th><input id="presenca1${c.id_matricula_disciplina}" type="checkbox" name="presenca1${c.id_matricula_disciplina}" value="presenca" checked ></th>
                                            </c:if>
                                            <c:if test="${c.presenca2 == 0}" >
                                                <th><input id="presenca2${c.id_matricula_disciplina}" type="checkbox" name="presenca2${c.id_matricula_disciplina}" value="presenca" ></th>
                                            </c:if>
                                            <c:if test="${c.presenca2 == 1}" >
                                                <th><input id="presenca2${c.id_matricula_disciplina}" type="checkbox" name="presenca2${c.id_matricula_disciplina}" value="presenca" checked ></th>
                                            </c:if>
                                            <c:if test="${c.presenca3 == 0}" >
                                                <th><input id="presenca3${c.id_matricula_disciplina}" type="checkbox" name="presenca3${c.id_matricula_disciplina}" value="presenca" ></th>
                                            </c:if>
                                            <c:if test="${c.presenca3 == 1}" >
                                                <th><input id="presenca3${c.id_matricula_disciplina}" type="checkbox" name="presenca3${c.id_matricula_disciplina}" value="presenca" checked ></th>
                                            </c:if>
                                            <c:if test="${c.presenca4 == 0}" >
                                                <th><input id="presenca4${c.id_matricula_disciplina}" type="checkbox" name="presenca4${c.id_matricula_disciplina}" value="presenca" ></th>
                                            </c:if>
                                            <c:if test="${c.presenca4 == 1}" >
                                                <th><input id="presenca4${c.id_matricula_disciplina}" type="checkbox" name="presenca4${c.id_matricula_disciplina}" value="presenca" checked ></th>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${c.presenca1 == 2 && c.presenca2 == 2 && c.presenca3 == 2 && c.presenca4 == 2}" >
                                            <th><input id="presenca1${c.id_matricula_disciplina}" type="checkbox" name="presenca1${c.id_matricula_disciplina}" value="presenca" checked></th>
                                            <th><input id="presenca2${c.id_matricula_disciplina}" type="checkbox" name="presenca2${c.id_matricula_disciplina}" value="presenca" checked></th>
                                            <th><input id="presenca3${c.id_matricula_disciplina}" type="checkbox" name="presenca3${c.id_matricula_disciplina}" value="presenca" checked></th>
                                            <th><input id="presenca4${c.id_matricula_disciplina}" type="checkbox" name="presenca4${c.id_matricula_disciplina}" value="presenca" checked></th>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${chamada.get(0).num_aulas == 2}" >
                                        <c:if test="${c.presenca1 != 2 || c.presenca2 != 2}" >
                                            <c:if test="${c.presenca1 == 0}" >
                                                <th><input id="presenca1${c.id_matricula_disciplina}" type="checkbox" name="presenca1${c.id_matricula_disciplina}" value="presenca" ></th>
                                            </c:if>
                                            <c:if test="${c.presenca1 == 1}" >
                                                <th><input id="presenca1${c.id_matricula_disciplina}" type="checkbox" name="presenca1${c.id_matricula_disciplina}" value="presenca" checked ></th>
                                            </c:if>
                                            <c:if test="${c.presenca2 == 0}" >
                                                <th><input id="presenca2${c.id_matricula_disciplina}" type="checkbox" name="presenca2${c.id_matricula_disciplina}" value="presenca" ></th>
                                            </c:if>
                                            <c:if test="${c.presenca2 == 1}" >
                                                <th><input id="presenca2${c.id_matricula_disciplina}" type="checkbox" name="presenca2${c.id_matricula_disciplina}" value="presenca" checked ></th>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${c.presenca1 == 2 && c.presenca2 == 2}" >
                                            <th><input id="presenca1${c.id_matricula_disciplina}" type="checkbox" name="presenca1${c.id_matricula_disciplina}" value="presenca" checked></th>
                                            <th><input id="presenca2${c.id_matricula_disciplina}" type="checkbox" name="presenca2${c.id_matricula_disciplina}" value="presenca" checked></th>
                                        </c:if>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </div>
            <div>
                <label for="conteudo">Conteúdo:</label>
                <select name="conteudo" id="conteudo" >
                    <option value="" disabled selected hidden>Selecione um Conteúdo...</option>
                    <c:if test="${not empty conteudos}">
                        <c:forEach var="c" items="${conteudos}">
                            <option value="${c.id}">${c.titulo}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <div>
                <input class="btn" type="submit" name="botao" value="Editar Chamada">
                <input class="btn" type="submit" name="botao" value="Salvar Chamada">
            </div>

        </form>
        <script>
            // Adicionando um event listener para detectar a mudança de seleção
            document.getElementById("curso").addEventListener("change", function() {
                // Enviar o formulário quando uma opção for selecionada
                document.getElementById("chamada").submit();
            });
        </script>
    </main>

</body>
</html>
