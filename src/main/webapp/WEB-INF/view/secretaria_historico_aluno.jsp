<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Histórico Alunos</title>
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/style.css"/>' />
</head>

<body>
    <div>
        <jsp:include page="menu.jsp"/>
    </div>

    <main>
        <h1>Histórico Aluno</h1>
        <br>
        <form action="historico" method="post">
            <div>
                <label for="ra">RA</label>
                <input type="number" name="ra" id="ra" value='<c:out value="${matricula.ra }"/>'>
                <input type="submit" name="botao" value="Buscar">
            </div>
            <c:if test="${not empty erro}">
            <div>
            <h3 class="erro">ERRO: <c:out value="${erro }"/></h3>
            </div>
            </c:if>
            <c:if test="${not empty saida}">
            <div>
            <h3 class="saida"><c:out value="${saida }"/></h3>
            </div>
            </c:if>
            <div>
                <table>
                    <thead>
                        <th>RA</th>
                        <th>NOME</th>
                        <th>NOME CURSO</th>
                        <th>DATA 1ª MATRICULA</th>
                        <th>PONTUAÇÃO VESTUBULAR</th>
                        <th>POSIÇÃO VESTUBULAR</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td><c:out value="${matricula.ra }"/></td>
                            <td><c:out value="${matricula.aluno.nome }"/></td>
                            <td><c:out value="${matricula.curso.nome }"/></td>
                            <td><c:out value="${matricula.ano_ingresso }"/>/<c:out value="${matricula.semestre_ingresso }"/></td>
                            <td><c:out value="${matricula.pontuacao_vestibular }"/></td>
                            <td><c:out value="${matricula.posicao_vestibular }"/></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <br>
            <br>

            <!-- DISCIPLINAS -->
            <h3>Disciplinas Aprovadas</h3>
            <div class="tabela_container">
                <table>
                    <thead>
                        <th>CÓDIGO DISCIPLINA</th>
                        <th>NOME DISCIPLINA</th>
                        <th>PROFESSOR</th>
                        <th>NOTA FINAL</th>
                        <th>FALTAS</th>
                    </thead>
                    <tbody>
                    	<c:forEach items="${matDisciplinas }" var="md">
                    		<tr>
                    			<td><c:out value="${md.disciplina.codigo }"/></td>
                    			<td><c:out value="${md.disciplina.nome }"/></td>
                    			<td><c:out value="${md.disciplina.professor.nome }"/></td>
                    			<td><c:out value="${md.nota_final }"/></td>
                    			<td><c:out value="${md.total_faltas }"/></td>
                    		</tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
        </form>
    </main>

</body>

</html>