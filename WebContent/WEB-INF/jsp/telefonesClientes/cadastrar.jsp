<%@ include file="../../../header.jsp" %>
	<body>
		<form action="<c:url value='/clientes/addTelefone'/>" method="post">
			<br><br>
			<label>ID:</label>		<input type="text" name="telefonecliente.id"		value="${telefonecliente.id}" readonly/>
			<label>Tipo:</label>	<input type="text" name="telefonecliente.tipo"		value="${telefonecliente.tipo}"/>
			<label>Número:</label>	<input type="text" name="telefonecliente.numero"	value="${telefonecliente.numero}"/>
			<br><br>
			<input type="submit" value="Enviar Dados"/><br/><br/>
		</form>
	</body>
<%@ include file="../../../footer.jsp" %> 