<%@ include file="../../../header.jsp"%>
<form action="<c:url value='/fornecedores/consultanome'/>" method="post">
	<input	class="maiuscula" type="text" name="fornecedor.nome" size=50 value="${cliente.nome}" />
	<input type="submit" value="Consultar" class="consultar" icon="ui-icon-disk"/><br>

	<table>
		<tr>
			<th>nome</th>
		</tr>
		<c:forEach items="${fornecedorList}" var="fornecedor">
			<tr>
			  <td>${fornecedor.nome}</td>
			  <td><a href="<c:url value="/fornecedores/editar/${fornecedor.id}"/>">Editar</a></td>
			</tr>
		</c:forEach>
	</table>
	
</form>	
<%@ include file="../../../footer.jsp"%>