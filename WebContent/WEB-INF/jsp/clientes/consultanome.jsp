<%@ include file="../../../header.jsp"%>
<form action="<c:url value='/clientes/consultanome'/>" method="post">
	<input	class="maiuscula" type="text" name="cliente.nome" size=50 value="${cliente.nome}" />
	<input type="submit" value="Consultar" class="consultar" icon="ui-icon-disk"/><br>

	<table>
		<tr>
			<th>nome</th>
		</tr>
		<c:forEach items="${clienteList}" var="cliente">
			<tr>
			  <td>${cliente.nome}</td>
			  <td><a href="<c:url value="/clientes/editar/${cliente.id}"/>">Editar</a></td>
			  <!-- <td><a href="<c:url value="/clientes/excluir/${tarefa.id}"/>">Excluir</a></td> -->
			</tr>
		</c:forEach>
	</table>
	
</form>	
<%@ include file="../../../footer.jsp"%>