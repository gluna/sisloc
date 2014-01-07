<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8"	src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" charset="utf-8"	src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>

<body>
	<form action="<c:url value='/pagamentos/contasareceber'/>" method="post">
	<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Relatórios de Contas a Receber</a></li>
			</ul>
			<div id="tabs-1">
			<br>
			<fieldset id="nome_cliente" style="width: 1140px;">
			<legend>
				Dados da Busca:
			</legend>
			<table><tr>
			<td align="right" width="95"><label>Data Inicio:</label></td>
			<td align="left"><input type="text" class="data" name="inicio" value="<fmt:formatDate value="${inicio}" dateStyle="medium" />" /></td>
			<td align="right" width="95"><label>Data Fim:</label></td>
			<td align="left"><input type="text" class="data" name="fim" value="<fmt:formatDate value="${fim}" dateStyle="medium" />" /></td>
			</tr>
			</table>
			</fieldset>
			<table align="center">
			<tr><td>
				<input type="submit" value="Imprimir" class="imprimir" icon="ui-icon-print"/><br/>
			</td></tr>
			</table>
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
		$(".data").datepicker({
		    dateFormat: 'dd/mm/yyyy',
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
 });
 </script>	
	