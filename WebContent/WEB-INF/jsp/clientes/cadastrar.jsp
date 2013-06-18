<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<body>
	<form action="<c:url value='/clientes/salvar'/>" method="post">
		<br><br> 
		<label>ID:</label> <input type="text" name="cliente.id" value="${cliente.id}" readonly /> 
		<label>Nome:</label> <input	type="text" name="cliente.nome" value="${cliente.nome}" />
		<label>Endereço:</label> <input type="text" name="cliente.logradouro" value="${cliente.logradouro}" /> 
		<label>Número:</label> <input type="text" name="cliente.numero" value="${cliente.numero}" /> 
		<label>Complemento:</label> <input type="text" name="cliente.complemento" value="${cliente.complemento}" /> <br>
		
		<br/>
		
		
		<fieldset id="artista-container" style="width: 600px;">
		<legend>
			Artistas
			<img src="${pageContext.request.contextPath}/images/novo.png" alt="+" onclick="adicionar();" />
		</legend>

		<c:forEach items="${cliente.telefones}" var="telefonecliente" varStatus="status">
			<div class="telefonecliente">
				<label>Nome:</label>
				<input type="text" name="cliente.telefones[${status.index}].tipo" value="${telefone.tipo}" />
				<input type="text" name="cliente.telefones[${status.index}].numero" value="${telefone.numero}" />
				<input type="hidden" name="cliente.telefones[${status.index}].id" value="${telefone.id}" />
			</div>
		</c:forEach>
	</fieldset><br/>
	
	<br> <input type="submit" value="Enviar Dados" /><br />
	</form>

</body>
<%@ include file="../../../footer.jsp"%>

<script type="text/javascript">
	var model =
		'<div class="telefonecliente">' +
			'<label>Numero:</label>' +
			'<input type="text" name="cliente.telefones[0].numero" />' +
		'</div>';

	$('.button-remover').live('click', function() {
		$(this).parent().remove();
		reorderIndexes();
	});

	function adicionar() {
		$('#artista-container').append(model);

		reorderIndexes();
	};
	
	function reorderIndexes() {
		var regex = /\[[0-9]\]/g;
	
		$('.telefonecliente').each(function(index) {
			var $campos = $(this).find('input'),
				$input	,
				name	;

			$campos.each(function() {
				$input	= $(this),
				name	= $input.attr('name');

				$input.attr('name', name.replace(regex, '[' + index + ']'));
			});
		});
		
	};
</script>

