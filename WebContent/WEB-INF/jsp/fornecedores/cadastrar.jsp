<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<body>
	<form action="<c:url value='/fornecedores/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Fornecedores</a></li>
			</ul>
			<div id="tabs-1">
				<br><br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Dados Pessoais:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="fornecedor.id" value="${fornecedor.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Nome:</label></td> 
						<td align="left"><input	type="text" name="fornecedor.nome" size=50 value="${fornecedor.nome}" /><br></td>
						<td align="right" width="80"><label>CPF/CNPJ:</label></td> 
						<td align="left"><input	type="text" name="fornecedor.ident" size=40 value="${fornecedor.ident}" /></td></tr></table><br>
						<table><tr><td align="right" width="95"><label>Endereço:</label> </td>
						<td align="left"><input type="text" name="fornecedor.logradouro" size=100 value="${fornecedor.logradouro}" /> </td>
						<td align="right"><label>Número:</label></td> 
						<td align="left"> <input type="text" name="fornecedor.numero" size=10 value="${fornecedor.numero}" /><br> </td></tr></table><br> 
						<table><tr><td align="right"> <label>Complemento:</label></td> 
						<td align="left"><input type="text" name="fornecedor.complemento" size=50 value="${fornecedor.complemento}" /> <br></td>
						<td align="right" width="85"><label>Bairro:</label></td> 
						<td align="left"> <input type="text" name="fornecedor.bairro" size=30 value="${fornecedor.bairro}" /><br> </td>
						</tr>
					</table>
				</fieldset>
				<br/>
				<fieldset id="telefone-container" style="width: 600px;">
				<legend>
					Telefones:
				</legend>
				</fieldset><br/>
				<fieldset id="telefone-container" style="width: 600px;">
				<legend>
					Telefones
					<img src="${pageContext.request.contextPath}/images/novo.png" alt="+" onclick="adicionar();" />
				</legend>

				<c:forEach items="${fornecedor.telefones}" var="telefonefornecedor" varStatus="status">
					<div class="telefonefornecedor">
						<label>Nome:</label>
						<input type="text" name="fornecedor.telefones[${status.index}].tipo" value="${telefone.tipo}" />
						<input type="text" name="fornecedor.telefones[${status.index}].numero" value="${telefone.numero}" />
						<input type="hidden" name="fornecedor.telefones[${status.index}].id" value="${telefone.id}" />
						'<img src="${pageContext.request.contextPath}/images/remover.png" alt="-" class="button-remover" />'
					</div>
				</c:forEach>
				</fieldset><br/>
	
				<br>
				<table align="center">
					<tr><td> 
					<input type="submit" value="Salvar" icon="ui-icon-disk"/><br /></tr></td>
				</table>
			</div>
		</div>	
	</form>

</body>
<%@ include file="../../../footer.jsp"%>

<script type="text/javascript">
	var model =
		'<div class="telefonefornecedor">' +
			'<label>Numero:</label>' +
			'<input type="text" name="fornecedor.telefones[0].numero" />' +
			'<img src="${pageContext.request.contextPath}/images/excluir.png" alt="-" class="button-remover" />' +
		'</div>';

	$('.button-remover').live('click', function() {
		$(this).parent().remove();
		reorderIndexes();
	});

	function adicionar() {
		$('#telefone-container').append(model);

		reorderIndexes();
	};
	
	function reorderIndexes() {
		var regex = /\[[0-9]\]/g;
	
		$('.telefonefornecedor').each(function(index) {
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
<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
	$('input[type="submit"]').each(function () {
		   $(this).hide().after('<button>').next().button({
		        icons: { primary: $(this).attr('icon') },
		        label: $(this).val()
		    }).click(function (event) {
		         event.preventDefault();
		         $(this).prev().click();
		    });
		});
</script>
