<%@ include file="../../../header.jsp"%>
<form action="<c:url value='/produtos/consultanome'/>" method="post">
	<input	class="maiuscula" type="text" name="produto.nome" size=50 value="${cliente.nome}" />
	<input type="submit" value="Consultar" class="consultar" icon="ui-icon-disk"/><br>

	<table>
		<tr>
			<th>nome</th>
		</tr>
		<c:forEach items="${produtoList}" var="produto">
			<tr>
			  <td>${produto.nome}</td>
			  <td><a href="<c:url value="/produtos/editar/${produto.id}"/>">Editar</a></td>
			</tr>
		</c:forEach>
	</table>
	
</form>	
<%@ include file="../../../footer.jsp"%>