<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<body>
	<form action="<c:url value='/orcamentos/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Or�amento</a></li>
			</ul>
			<div id="tabs-1">
				<br><br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Datas do Or�amento:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="orcamento.id" value="${orcamento.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Data do Or�amento:</label></td> 
						<td align="left"><input	type="text" class="data" name="orcamento.data" value="${orcamento.data}" /><br></td>
						<td align="right" width="80"><label>Data Inicio:</label></td> 
						<td align="left"><input	type="text" class="data" name="orcamento.inicio" value="${orcamento.inicio}" /></td><br>
						<td align="right" width="80"><label>Data Fim:</label> </td>
						<td align="left"><input type="text" class="data" name="orcamento.fim" value="${orcamento.fim}" /> </td>
						</tr></table>
				</fieldset>
				<br/>
				<fieldset id="detalhe-container" style="width: 1140px;">
				<legend>
					Detalhes do Or�amento:
				</legend>
				<table align="right"><tr><td>
					<input type="button" value="Adicionar" onclick="adicionar();" icon="ui-icon-document"/></td></tr>
				</table>
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
					<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br /></tr></td>
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
	
	$('.salvar').live('click', function() {
		alert("Dados salvos com sucesso!!");
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
		$('input[type="submit"]').each(function () {
			   $(this).hide().after('<button>').next().button({
			        icons: { primary: $(this).attr('icon') },
			        label: $(this).val()
			    }).click(function (event) {
			         event.preventDefault();
			         $(this).prev().click();
			    });
			});
		$('input[type="button"]').each(function () {
			   $(this).hide().after('<button>').next().button({
			        icons: { primary: $(this).attr('icon') },
			        label: $(this).val()
			    }).click(function (event) {
			         event.preventDefault();
			         $(this).prev().click();
			    });
			});
		$(".data").datepicker({
		    dateFormat: 'dd/mm/yy',
		    dayNames: ['Domingo','Segunda','Ter�a','Quarta','Quinta','Sexta','S�bado'],
		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','S�b','Dom'],
		    monthNames: ['Janeiro','Fevereiro','Mar�o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
		    nextText: 'Pr�ximo',
		    prevText: 'Anterior',
		    showOn: "button",
			buttonImage: "${pageContext.request.contextPath}/images/calendar.gif",
			buttonImageOnly: true
		});
	});
	
</script>