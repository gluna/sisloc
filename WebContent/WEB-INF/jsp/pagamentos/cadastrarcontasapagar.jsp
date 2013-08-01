<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8"	src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" charset="utf-8"	src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>

<body>
	<form action="<c:url value='/pagamentos/salvarcontasapagar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Registro de Contas a Pagar</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="nome_cliente" style="width: 1140px;">
					<legend> Dados da Locação: </legend>
					<table>
						<tr>
							<!-- <td align="right" width="95"><label>Número da Locação:</label></td> -->
							<td align="left"><input type="hidden" class="maiuscula" name="pagamento.id" value="${pagamento.id}" readonly /><br></td>
							<td align="right" width="95"><label>Dt. Vencimento:</label></td>
							<td align="left"><input type="text" class="data" name="pagamento.dtvencimento" value="<fmt:formatDate value="${pagamento.dtvencimento}" dateStyle="medium" />" />
							<td align="right" width="95"><label>Valor:</label></td>
							<td align="left"><input type="text" class="text" name="pagamento.valor" value="${pagamento.valor}" /> 
							<td align="right" width="95"><label>Descrição:</label></td>
							<td align="left"><input type="text" class="text" name="pagamento.descricao" value="${pagamento.descricao}" /> 
							 
							<br></td></tr></table>
							
				</fieldset>
				<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br/>
			</div>
		</div>
	</form>
</body>
<%@ include file="../../../footer.jsp"%>
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
		$('a[name="editar"]').each(function () {
			   $(this).button({icons: {primary: "ui-icon-pencil"}});
			   $(this).click();
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
		    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
		    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
		    nextText: 'Próximo',
		    prevText: 'Anterior',
		    showOn: "button",
			buttonImage: "${pageContext.request.contextPath}/images/calendar.gif",
			buttonImageOnly: true
		});
		$(".data1").datepicker({
		    dateFormat: 'dd/mm/yy',
		    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
		    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
		    nextText: 'Próximo',
		    prevText: 'Anterior',
		    showOn: "button",
		    display: none,
			buttonImage: "${pageContext.request.contextPath}/images/calendar.gif",
			buttonImageOnly: true
		});
	});
	
</script>

<style type="text/css">
input.maiuscula {
  text-transform: uppercase;
  background-color: #FFFFE0;
}
.data1 {
  background-color: #FFFFE0;
}
</style>