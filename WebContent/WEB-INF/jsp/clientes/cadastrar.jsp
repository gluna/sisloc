<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<body>
	<form action="<c:url value='/clientes/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Cliente</a></li>
			</ul>
			<div id="tabs-1">
				<br><br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<!--<label>ID:</label> --><input type="hidden" name="cliente.id" value="${cliente.id}" readonly />
					<table height=20><tr><td align="right"> 
						<label>Nome:</label></td> 
						<td align="left"><input	type="text" name="cliente.nome" size=50 value="${cliente.nome}" /><br></td>
						<td align="right"><label>CPF/CNPJ:</label></td> 
						<td align="left"><input	type="text" name="cliente.ident" size=40 value="${cliente.ident}" /><br></td></tr></table>
						<table height=20><tr><td align="right"><label>Endereço:</label> </td>
						<td align="left"><input type="text" name="cliente.logradouro" size=100 value="${cliente.logradouro}" /> </td></tr></table> 
						<table height=20><tr><td align="right"> <label>Complemento:</label></td> 
						<td align="left"><input type="text" name="cliente.complemento" size=50 value="${cliente.complemento}" /> <br></td>
						<td align="right"><label>Número:</label></td> 
						<td align="right"> <input type="text" name="cliente.numero" size=10 value="${cliente.numero}" /><br><br> </td></tr>
					</table>
				</fieldset>
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
			'<input type="text" name="cliente.telefones[0].numero" />' +
			'<img src="${pageContext.request.contextPath}/images/excluir.png" alt="-" class="button-remover" />' +
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
