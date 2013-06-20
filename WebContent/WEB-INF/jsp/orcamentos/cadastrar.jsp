<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<body>
	<form action="<c:url value='/orcamentos/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Cliente</a></li>
			</ul>
			<div id="tabs-1">
				<br><br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Dados Pessoais:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="orcamento.id" value="${cliente.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Nome:</label></td> 
						<td align="left"><input	type="text" name="orcamento.data" size=50 value="${orcamento.data}" /><br></td>
						<td align="right" width="80"><label>CPF/CNPJ:</label></td> 
						<td align="left"><input	type="text" name="orcamento.inicio" size=29 value="${orcamento.inicio}" /></td></tr></table><br>
						<table><tr><td align="right" width="95"><label>Endereço:</label> </td>
						<td align="left"><input type="text" name="orcamento.fim" size=96 value="${orcamento.fim}" /> </td>
						</tr></table>
				</fieldset>
				<br/>
				<fieldset id="detalhe-container" style="width: 600px;">
				<legend>
					Telefones:
				</legend>
				</fieldset><br/>
				<fieldset id="detalhe-container" style="width: 600px;">
				<legend>
					Telefones
					<img src="${pageContext.request.contextPath}/images/novo.png" alt="+" onclick="adicionar();" />
				</legend>

				<c:forEach items="${orcamento.orcamentodetalhe}" var="orcamentodetalhe" varStatus="status">
					<div class="orcamentodetalhe">
						<label>Nome:</label>
						<input type="text" name="orcamento.orcamentodetalhe[${status.index}].produto" value="${orcamentodetalhe.produto}" />
						<input type="text" name="orcamento.orcamentodetalhe[${status.index}].quantidade" value="${orcamentodetalhe.quantidade}" />
						<input type="text" name="orcamento.orcamentodetalhe[${status.index}].preco" value="${orcamentodetalhe.preco}" />
						<input type="hidden" name="orcamento.orcamentodetalhe[${status.index}].id" value="${orcamentodetalhe.id}" />
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
		'<div class="telefonecliente">' +
			'<label>Numero:</label>' +
			'<input type="text" name="orcamento.orcamentodetalhe[${status.index}].produto" value="${orcamentodetalhe.produto}" />'+
			'<input type="text" name="orcamento.orcamentodetalhe[${status.index}].quantidade" value="${orcamentodetalhe.quantidade}" />'+
			'<input type="text" name="orcamento.orcamentodetalhe[${status.index}].preco" value="${orcamentodetalhe.preco}" />'+
			'<input type="hidden" name="orcamento.orcamentodetalhe[${status.index}].id" value="${orcamentodetalhe.id}" />'+
			'<img src="${pageContext.request.contextPath}/images/excluir.png" alt="-" class="button-remover" />' +
		'</div>';

	$('.button-remover').live('click', function() {
		$(this).parent().remove();
		reorderIndexes();
	});

	function adicionar() {
		$('#detalhe-container').append(model);

		reorderIndexes();
	};
	
	function reorderIndexes() {
		var regex = /\[[0-9]\]/g;
	
		$('.orcamentodetalhex').each(function(index) {
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
