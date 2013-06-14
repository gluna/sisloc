<%@ include file="../../../header.jsp" %>
	<body>
		<form action="<c:url value='/clientes/salvar'/>" method="post">
			<br><br>
			<label>ID:</label>           <input type="text" name="cliente.id"         value="${cliente.id}" readonly/>
			<label>Nome:</label>    	 <input type="text" name="cliente.nome"  value="${cliente.nome}"/>
			<label>Endereço:</label> <input type="text" name="cliente.logradouro" value="${cliente.logradouro}"/>
			<label>Número:</label>   <input type="text" name="cliente.numero"   value="${cliente.numero}"/>
			<label>Complemento:</label>      <input type="text" name="cliente.complemento"      value="${cliente.complemento}"/>
			<br><br>
			<input type="submit" value="Enviar Dados"/><br/><br/>
		</form>
	</body>
<%@ include file="../../../footer.jsp" %> 