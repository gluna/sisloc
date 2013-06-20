<%@ include file="../../../header.jsp" %>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>  -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<body>
	<form action="<c:url value='/produtos/salvar'/>" method="post">
		<br><br> 
		<label>ID:</label> <input type="text" name="produto.id" value="${produto.id}" readonly /> 
		<label>Código:</label> <input	type="text" name="produto.codigo" value="${produto.codigo}" />
		<label>Nome:</label> <input type="text" name="produto.nome" value="${produto.nome}" /> 
		<label>Descrição:</label> <input type="text" name="produto.descricao" value="${produto.descricao}" /> 
		<label>quantidade:</label> <input type="text" name="produto.quantidade" value="${produto.quantidade}" /> <br>
		
		<br/>
		
		
		<fieldset id="preco-container" style="width: 600px;">
		<legend>
			Preços
			<img src="${pageContext.request.contextPath}/images/novo.png" alt="+" onclick="adicionar();" />
		</legend>

		<c:forEach items="${produto.precos}" var="precos" varStatus="status">
			<div class="precos">
				<label>preco:</label>
				<input type="text" name="produto.precos[${status.index}].dias" value="${preco.dias}" />
				<input type="text" name="produto.precos[${status.index}].preco" value="${preco.preco}" />
				
				'<img src="${pageContext.request.contextPath}/images/remover.png" alt="-" class="button-remover" />'
			</div>
		</c:forEach>
	</fieldset><br/>
	
	<br> <input type="submit" value="Enviar Dados" /><br />
	</form>

</body>
<%@ include file="../../../footer.jsp"%>

<script type="text/javascript">
	var model =
		'<div class="precos">' +
			'<label>Dias:</label>' +
			'<input type="text" name="produto.precos[0].dias" />' +
			'<input type="text" name="produto.precos[0].preco" />' +
			'<img src="${pageContext.request.contextPath}/images/excluir.png" alt="-" class="button-remover" />' +
		'</div>';

	$('.button-remover').live('click', function() {
		$(this).parent().remove();
		reorderIndexes();
	});
	
	$('.salvar').live('click', function() {
		alert("Dados salvos com sucesso!!");
	});

	function adicionar() {
		$('#preco-container').append(model);

		reorderIndexes();
	};
	
	function reorderIndexes() {
		var regex = /\[[0-9]\]/g;
	
		$('.precos').each(function(index) {
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
