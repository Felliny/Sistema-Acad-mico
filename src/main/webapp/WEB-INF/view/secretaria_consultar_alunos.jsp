<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Consultar Alunos</title>
    <link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/style.css"/>' />
</head>

<body>
    <div>
        <jsp:include page="menu.jsp"/>
    </div>

    <main>
        <h1>Consultar Alunos</h1>
        <br>
        <form action="consultar_alunos" method="post">
            <div>
                <select name="tipo_busca" id="tipo_busca" onchange="change_type()">
                    <option value="cpf">CPF</option>
                    <option value="nome">NOME</option>
                    <option value="ano">ANO</option>
                    <option value="curso">CURSO</option>
                    <option value="ra">RA</option>
                </select>
                <input type="number" name="valor_pesquisa" id="valor_pesquisa">
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
            <div class="tabela_consulta">
                <table>
                    <thead>
                        <th>CPF</th>
                        <th>RA</th>
                        <th>NOME</th>
                        <th>ANO/SEMES. INGRESSO</th>
                        <th>CURSO</th>
                        <th>ação</th>
                    </thead>
                    <tbody>
                    	<c:forEach items="${matriculas}" var="m">
                    	<tr>
                    		<td><c:out value="${m.aluno.cpf }"/></td>
                    		<td><c:out value="${m.ra }"/></td>
                    		<td><c:out value="${m.aluno.nome }"/></td>
                    		<td><c:out value="${m.ano_ingresso }"/>/<c:out value="${m.semestre_ingresso }"/></td>
                    		<td><c:out value="${m.curso.nome }"/></td>
                    		<td>
                    			<ul>
                    				<li class="acao"><a href='dispensar_disciplinas?ra=<c:out value="${m.ra }"/>'>Disp. Disc.</a></li>
                    				<br>
                    				<li class="acao"><a href='historico?ra=<c:out value="${m.ra }"/>'>Histórico</a></li>
                    			</ul>
                    		</td>
                    	</tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
        </form>
    </main>

</body>

<script>
    function change_type() {
        tipo_busca = document.getElementById('tipo_busca')
        tipo_busca = tipo_busca.value
        valor_pesquisa = document.getElementById('valor_pesquisa')

        if (tipo_busca === "cpf" || tipo_busca === "ano" || tipo_busca === "ra") {
            valor_pesquisa.type = 'number'
        }
        else {
            valor_pesquisa.type = 'text'
        }

        valor_pesquisa.value = ''
    }
</script>

</html>